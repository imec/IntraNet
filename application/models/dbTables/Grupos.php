<?php

class Application_Model_dbTables_Grupos extends Zend_Db_Table_Abstract {

    protected $_name = 'grupos';
    protected $_primary = 'codigo';
 
    public function getFechaInicio($id){
        $row = $this->fetchRow($this->select()->where('codigo = ?', $id));
	// le doy formato
        $fecha=date("D d M Y",strtotime($row->fechaInicio));
        return (is_null($row)) ? array() : $fecha;
    }

    
    
}    
