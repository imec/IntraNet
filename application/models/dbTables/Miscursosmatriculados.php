<?php

class Application_Model_dbTables_Miscursosmatriculados extends Zend_Db_Table_Abstract {

    protected $_name = 'miscursosmatriculados';
    protected $_primary = 'usuarios_id';

    public function getCursosMatriculados($param) {
             $row = $this->fetchRow($this->select()->where('usuarios_id = ?', $param));
             return (is_null($row)) ? array() : $row;
    }
    
}

