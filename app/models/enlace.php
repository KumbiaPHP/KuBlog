<?php
class Enlace extends ActiveRecord {

	public function buscaPorNombre($nombre = NULL) {
		$nombre = filter_var($nombre, FILTER_SANITIZE_STRING);
		return $this->find_first("conditions: nombre = \"$name\"");
	}

	public function buscaIdPorNombre($nombre = NULL) {
		$this->find_first("nombre = \"$nombre\"");
		return $this->id;
	}

	public function listaTodos() {
		$enlaces = array();
		foreach ($this->find() as $enlace) {
			$enlaces[] = array('nombre' => $enlace->nombre, 'url' => $enlace->url);
		}
		return $enlaces;
	}

}
