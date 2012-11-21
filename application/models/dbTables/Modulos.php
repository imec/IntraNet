<?php

class Application_Model_dbTables_Modulos extends Zend_Db_Table_Abstract {

    protected $_name = 'modulos';
    protected $_primary = 'codigo';
 
    
    public function getAll() {
        return $this->fetchAll();
    }
    public function getModulo($id) {
        $row = $this->fetchRow($this->select()->where('codigo = ?', $id));
	return (is_null($row)) ? array() : $row->toArray();
    }
     public function deleteModulo($id) {
        $this->delete('codigo =' . (int) $id);
    }
    public function updateModulo($data) {
       $this->update($data, 'codigo = ' . (int) $data['codigo']);
    }
    public function save($data) {
        $errors = array();
        if($data['codigo'] == "")
            $errors[] = "codigo"; 
        if($data['nombre'] == "")
            $errors[] = "nombre"; 
        if($data['descripcion'] == "")
            $errors[] = "descripcion";
         if($data['cursos_codigo'] == "")
            $errors[] = "cursos_codigo"; 
        
        if(count($errors) > 0) {
            return $errors;
        } else {
            $this->insert($data);
            return array();
        }
      
    }
    
}    
