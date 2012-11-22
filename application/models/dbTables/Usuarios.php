<?php

class Application_Model_dbTables_Usuarios extends Zend_Db_Table_Abstract {

    protected $_rowClass = "Application_Model_Usuario";
    protected $_name = 'usuarios';
    protected $_primary = 'id';

    public function getUsuario($id) {
        $row = $this->fetchRow($this->select()->where('id = ?', $id));
        return (is_null($row)) ? array() : $row;
    }

    public function getAll() {
        return $this->fetchAll();
    }

    public function searchUser($param, $tipo) {
        if ($tipo == 1) {
            $select = $this->select()->where('nombre like ?', "%{$param}%");
            return $this->fetchAll($select);
        } else {
            if ($tipo == 2) {
                 $select = $this->select()->where('identificacion like ?', "%{$param}%");
                 return $this->fetchAll($select);
            } else {
                 $select = $this->select()->where('id like ?', "%{$param}%");
                 return $this->fetchAll($select);
            }
        }
    }
 
    
    
}

