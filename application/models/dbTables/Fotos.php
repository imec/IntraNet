<?php

class Application_Model_dbTables_Fotos extends Zend_Db_Table_Abstract {

    protected $_name = 'fotos';
    protected $_primary = 'usuarios_id';

    public function getFoto($param) {
             $row = $this->fetchRow($this->select()->where('usuarios_id = ?', $param));
         return (is_null($row)) ? array() : $row;
    }
    
}

