<?php

class Application_Model_dbTables_Usuarios extends Zend_Db_Table_Abstract {

    protected $_rowClass = "Application_Model_Usuario";
    protected $_name = 'usuarios';
    protected $_primary = 'id';

    public function getUsuario($id) {
        $row = $this->fetchRow($this->select()->where('id = ?', $id));
        return (is_null($row)) ? array() : $row;
    }
     public function getEstudiante($id) {
        $select = $this->select();
        $select->where('id = ?', $id);
        $select->where('tipoUsuarios_id = ?', "1");
        $row = $this->fetchRow($select);
        
        return (is_null($row)) ? array() : $row;
    }

    public function getAll() {
        $select = $this->select()->where('tipoUsuarios_id = ?', "1");
        return $this->fetchAll($select);
                 
        //return $this->fetchAll();
    }

    public function searchEstudiante($param, $tipo) {
        if ($tipo == 1) {
            $select = $this->select();
            $select->where('nombre like ?', "%{$param}%");
            $select->where('tipoUsuarios_id = ?', "1");
        
            return $this->fetchAll($select);
        } else {
            if ($tipo == 2) {
                  $select = $this->select();
                $select->where('identificacion like ?', "%{$param}%");
                $select->where('tipoUsuarios_id = ?', "1");

                 return $this->fetchAll($select);
            } else {
                    $select = $this->select();
                $select->where('id like ?', "%{$param}%");
                $select->where('tipoUsuarios_id = ?', "1");

                 return $this->fetchAll($select);
            }
        }
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

