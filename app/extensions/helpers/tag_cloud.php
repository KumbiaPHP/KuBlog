<?php
/**
 * @author Deivinson Tejeda (CaChi)
 *
 */
class TagCloud
{
    public $min_size = 80;
    public $max_size = 140;
    public $attributes = array('class' => 'tag');
    // Tag elements, biggest and smallest values
    protected $_elements;
    protected $_biggest;
    protected $_smallest;
    /**
     * Constructor de un nuevo TagCloud. Los elementos deben ser pasados en un array,
     * cada elemento del array debe tener "name" ,"url", y "count" key.
     * El estilo del tamaño de las fuentes será aplicado vía "style" atributo en procentaje.
     *
     * @param   array    elements del TagCloud
     * @param   integer  mínimo font size
     * @param   integer  máximo font size
     * @return  void
     */
    public function __construct (array $elements, $min_size = NULL, $max_size = NULL)
    {
        $this->_elements = $elements;
        $counts = array();
        foreach ($elements as $data) {
            $counts[] = $data['count'];
        }
        // Obtiene el valor máximo y mínimo dentro de los elements
        $this->_biggest = max($counts);
        $this->_smallest = min($counts);
        if ($min_size !== NULL) {
            $this->min_size = $min_size;
        }
        if ($max_size !== NULL) {
            $this->max_size = $max_size;
        }
    }
    /**
     * Obtiene la class usando un porcentaje
     *
     * @returns int $class
     */
    public function getClass ($percent)
    {
        if ($percent >= 99){
            $class = 1;
        } else if ($percent >= 70) {
            $class = 2;
        } else if ($percent >= 60){
            $class = 3;
        } else if ($percent >= 50){
            $class = 4;
        } else if ($percent >= 40) {
            $class = 5;
        } else if ($percent >= 30){
            $class = 6;
        } else if ($percent >= 20){
            $class = 7;
        } else if ($percent >= 10){
            $class = 8;
        } else if ($percent >= 5){
            $class = 9;
        } else{
            $class = 0;
        }
        return $class;
    }
    /**
     * Renderiza los elementos del TagCloud dentro de un array de enlace
     *
     * @param bool $class Indica si se usara class css para los tamaño de la fuente
     * @return  string
     */
    public function show ($class=true)
    {
        // Valor mínimo debe ser 1 para evitar: divide by zero errors
        $range = max($this->_biggest - $this->_smallest, 1);
        $scale = max($this->max_size - $this->min_size, 1);
        // Import the attributes locally to prevent overwrites
        $attr = $this->attributes;
        $output = '';
        foreach ($this->_elements as $data) {
            if($class){
                $size = $this->getClass(($data['count'] / $this->_biggest) * 100);
                $output .= "<span class='size{$size}'><a href='/articulo/tag/{$data['name']}' class='tag'> {$data['name']} </a></span>";
            } else {
                // Determina el tamaño basado en el min/max scale y el smallest/biggest rango
                $size = ((($data['count'] - $this->_smallest) * $scale) / $range) + $this->min_size;
                $attr['style'] = 'font-size: ' . round($size, 0) . '%';
                $attr['title'] = $data['name'];
                $output .= Html::link($data['url'], $data['name'], $attr);
            }

        }
        return $output;
    }
}