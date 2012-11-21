<?php

class EstudiantesController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function infoAction() {
        if(empty($_GET) || $_GET['id']== "" || $_GET['tipo']=="") {
            $this->_redirect('/estudiantes/search/');
        }else{
            
        } 
    }

    public function searchAction() {
        
        if(empty($_GET) || $_GET['id']== "" || $_GET['tipo']=="") {
            $model = new Application_Model_dbTables_Usuarios();
            $this->view->miEstudiante = $model->getAll();
        }else{
            $param = $_GET['id']; //obtiene el parametro
            $tipo = $_GET['tipo']; //obtiene el parametro
            $model = new Application_Model_dbTables_Usuarios(); //crea el modelo
            $this->view->estSer = $model->searchUser($param, $tipo);
        } 
                
            
        
    }

}
