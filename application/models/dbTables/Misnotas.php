<?php

class Application_Model_dbTables_Misnotas extends Zend_Db_Table_Abstract {

    protected $_name = 'misnotas';
    protected $_primary = 'usuarios_id';
 
    public function getMisNotas($user, $curso){
         
        $select = $this->select();
        $select->where('usuarios_id = ?', $user);
        $select->where('cursos_codigo = ?', $curso);

        return $this->fetchAll($select);
    }
    
}    