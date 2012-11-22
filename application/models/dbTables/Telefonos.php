<?php

class Application_Model_dbTables_Telefonos extends Zend_Db_Table_Abstract {

    protected $_name = 'telefonos';
    protected $_primary = 'usuarios_id';

    public function getTelefonos($param) {
            $select = $this->select()->where('usuarios_id = ?', $param);
            return $this->fetchAll($select);
    }
    
}

