<?php

class Application_Model_dbTables_Cursos extends Zend_Db_Table_Abstract {

    protected $_name = 'cursos';
    protected $_primary = 'codigo';
 
    public function getNombreCurso($id){
        $row = $this->fetchRow($this->select()->where('codigo = ?', $id));
	return (is_null($row)) ? array() : $row->nombre;
    }

    public function getAll() {
        return $this->fetchAll();
    }
    public function getCurso($id) {
        $row = $this->fetchRow($this->select()->where('codigo = ?', $id));
	return (is_null($row)) ? array() : $row->toArray();
    }
     public function deleteCurso($id) {
        $this->delete('codigo =' . (int) $id);
    }
    public function updateCurso($data) {
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
        
        if(count($errors) > 0) {
            return $errors;
        } else {
            $this->insert($data);
            return array();
        }
      
    }
    
}    
