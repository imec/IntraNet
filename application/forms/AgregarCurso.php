<?php

class Application_Form_AgregarCurso extends Zend_Form {

    public function init() {

        $this->addElement(
                'text', 'codigo', array(
					'label' => 'Codigo',
					'required' => true
                )
        );
		
		$this->addElement(
                'text', 'nombre', array(
					'label' => 'Nombre',
					'required' => true
                )
        );
		
        $this->addElement(
                'textarea', 'descripcion', array(
					'label' => 'Descripcion'
                )
        );

        $this->addElement(
                'submit', 'Guardar', array()
        );
    }

}