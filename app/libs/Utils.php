<?php
class Utils
{
    public static function slug ($string, $separator = '_', $length = 100)
    {
        $search = explode(',', 'ç,Ç,ñ,Ñ,æ,Æ,œ,á,Á,é,É,í,Í,ó,Ó,ú,Ú,à,À,è,È,ì,Ì,ò,Ò,ù,Ù,ä,ë,ï,Ï,ö,ü,ÿ,â,ê,î,ô,û,å,e,i,ø,u,Š,Œ,Ž,š,¥');
        $replace = explode(',', 'c,C,n,N,ae,AE,oe,a,A,e,E,i,I,o,O,u,U,a,A,e,E,i,I,o,O,u,U,ae,e,i,I,oe,ue,y,a,e,i,o,u,a,e,i,o,u,s,o,z,s,Y');
        $string = str_replace($search, $replace, $string);
        $string = strtolower($string);
        $string = preg_replace('/[^a-z0-9_]/i', $separator, $string);
        $string = preg_replace('/\\' . $separator . '[\\' . $separator . ']*/', $separator, $string);
        if (strlen($string) > $length) {
            $string = substr($string, 0, $length);
        }
        $string = preg_replace('/\\' . $separator . '$/', '', $string);
        $string = preg_replace('/^\\' . $separator . '/', '', $string);
        return $string;
    }
    /**
     * Balance Tags
     * 
     *
     * @param string $text
     * @return string
     */
    public static function balanceTags ($text)
    {
        $tagstack = array();
        $stacksize = 0;
        $tagqueue = '';
        $newtext = '';
        $single_tags = array('br' , 'hr' , 'img' , 'input'); //Known single-entity/self-closing tags
        $nestable_tags = array('blockquote' , 'div' , 'span'); //Tags that can be immediately nested within themselves
        # WP bug fix for comments - in case you REALLY meant to type '< !--'
        $text = str_replace('< !--', '<    !--', $text);
        # WP bug fix for LOVE <3 (and other situations with '<' before a number)
        $text = preg_replace('#<([0-9]{1})#', '&lt;$1', $text);
        while (preg_match("/<(\/?\w*)\s*([^>]*)>/", $text, $regex)) {
            $newtext .= $tagqueue;
            $i = strpos($text, $regex[0]);
            $l = strlen($regex[0]);
            // clear the shifter
            $tagqueue = '';
            // Pop or Push
            if ($regex[1][0] == "/") { // End Tag
                $tag = strtolower(substr($regex[1], 1));
                // if too many closing tags
                if ($stacksize <= 0) {
                    $tag = '';
                    //or close to be safe $tag = '/' . $tag;
                } else  // if stacktop value = tag close value then pop
                    if ($tagstack[$stacksize - 1] == $tag) { // found closing tag
                        $tag = '</' . $tag . '>'; // Close Tag
                        // Pop
                        array_pop($tagstack);
                        $stacksize --;
                    } else { // closing tag not at top, search for it
                        for ($j = $stacksize - 1; $j >= 0; $j --) {
                            if ($tagstack[$j] == $tag) {
                                // add tag to tagqueue
                                for ($k = $stacksize - 1; $k >= $j; $k --) {
                                    $tagqueue .= '</' . array_pop($tagstack) . '>';
                                    $stacksize --;
                                }
                                break;
                            }
                        }
                        $tag = '';
                    }
            } else { // Begin Tag
                $tag = strtolower($regex[1]);
                // Tag Cleaning
                // If self-closing or '', don't do anything.
                if ((substr($regex[2], - 1) == '/') || ($tag == '')) {} // ElseIf it's a known single-entity tag but it doesn't close itself, do so
elseif (in_array($tag, $single_tags)) {
                    $regex[2] .= '/';
                } else { // Push the tag onto the stack
                    // If the top of the stack is the same as the tag we want to push, close previous tag
                    if (($stacksize > 0) && ! in_array($tag, $nestable_tags) && ($tagstack[$stacksize - 1] == $tag)) {
                        $tagqueue = '</' . array_pop($tagstack) . '>';
                        $stacksize --;
                    }
                    $stacksize = array_push($tagstack, $tag);
                }
                // Attributes
                $attributes = $regex[2];
                if ($attributes) {
                    $attributes = ' ' . $attributes;
                }
                $tag = '<' . $tag . $attributes . '>';
                //If already queuing a close tag, then put this tag on, too
                if ($tagqueue) {
                    $tagqueue .= $tag;
                    $tag = '';
                }
            }
            $newtext .= substr($text, 0, $i) . $tag;
            $text = substr($text, $i + $l);
        }
        // Clear Tag Queue
        $newtext .= $tagqueue;
        // Add Remaining text
        $newtext .= $text;
        // Empty Stack
        while ($x = array_pop($tagstack)) {
            $newtext .= '</' . $x . '>'; // Add remaining tags to close
        }
        $newtext = str_replace("< !--", "<!--", $newtext);
        $newtext = str_replace("<    !--", "< !--", $newtext);
        return $newtext;
    }
    /**
     * Truncate Text, no permite Tag HTML
     * 
     * @param string $text String a truncar
     * @param string $limit cantidad de palabras a permitir
     * @param string $end string que ira al final del truncamiento
     */
    public static function truncateWord ($text, $limit = 50, $end = '[...]')
    {
        $text = trim(strip_tags($text)); //quitando tags HTML, Espacios al final y al inicio
        if (str_word_count($text, 0) > $limit) {
            $words = str_word_count($text, 2);
            $pos = array_keys($words);
            $text = substr($text, 0, $pos[$limit]) . $end;
        }
        return $text;
    }
    /**
     * Truncates text.
     *
     * Cuts a string to the length of $length and replaces the last characters
     * with the ending if the text is longer than length.
     *
     * @param string  $text String to truncate.
     * @param integer $length Length of returned string, including ellipsis.
     * @param mixed   $ending If string, will be used as Ending and appended to the trimmed string. Can also be an associative array that can contain the last three params of this method.
     * @param boolean $exact If false, $text will not be cut mid-word
     * @param boolean $considerHtml If true, HTML tags would be handled correctly
     * @return string Trimmed string.
     */
	public static function truncate($text, $length = 100, $dot = '...', $exact = true, $considerHtml = false) {
	    
		if ($considerHtml) {
			if (mb_strlen(preg_replace('/<.*?>/', '', $text)) <= $length) {
				return $text;
			}
			$totalLength = mb_strlen($dot);
			$openTags = array();
			$truncate = '';
			preg_match_all('/(<\/?([\w+]+)[^>]*>)?([^<>]*)/', $text, $tags, PREG_SET_ORDER);
			foreach ($tags as $tag) {
				if (!preg_match('/img|br|input|hr|area|base|basefont|col|frame|isindex|link|meta|param/s', $tag[2])) {
					if (preg_match('/<[\w]+[^>]*>/s', $tag[0])) {
						array_unshift($openTags, $tag[2]);
					} else if (preg_match('/<\/([\w]+)[^>]*>/s', $tag[0], $closeTag)) {
						$pos = array_search($closeTag[1], $openTags);
						if ($pos !== false) {
							array_splice($openTags, $pos, 1);
						}
					}
				}
				$truncate .= $tag[1];

				$contentLength = mb_strlen(preg_replace('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|&#x[0-9a-f]{1,6};/i', ' ', $tag[3]));
				if ($contentLength + $totalLength > $length) {
					$left = $length - $totalLength;
					$entitiesLength = 0;
					if (preg_match_all('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|&#x[0-9a-f]{1,6};/i', $tag[3], $entities, PREG_OFFSET_CAPTURE)) {
						foreach ($entities[0] as $entity) {
							if ($entity[1] + 1 - $entitiesLength <= $left) {
								$left--;
								$entitiesLength += mb_strlen($entity[0]);
							} else {
								break;
							}
						}
					}

					$truncate .= mb_substr($tag[3], 0 , $left + $entitiesLength);
					break;
				} else {
					$truncate .= $tag[3];
					$totalLength += $contentLength;
				}
				if ($totalLength >= $length) {
					break;
				}
			}

		} else {
			if (mb_strlen($text) <= $length) {
				return $text;
			} else {
				$truncate = mb_substr($text, 0, $length - strlen($dot));
			}
		}
		if (!$exact) {
			$spacepos = mb_strrpos($truncate, ' ');
			if (isset($spacepos)) {
				if ($considerHtml) {
					$bits = mb_substr($truncate, $spacepos);
					preg_match_all('/<\/([a-z]+)>/', $bits, $droppedTags, PREG_SET_ORDER);
					if (!empty($droppedTags)) {
						foreach ($droppedTags as $closingTag) {
							if (!in_array($closingTag[1], $openTags)) {
								array_unshift($openTags, $closingTag[1]);
							}
						}
					}
				}
				$truncate = mb_substr($truncate, 0, $spacepos);
			}
		}

		$truncate .= $dot;

		if ($considerHtml) {
			foreach ($openTags as $tag) {
				$truncate .= '</'.$tag.'>';
			}
		}
		return $truncate;
	}
}