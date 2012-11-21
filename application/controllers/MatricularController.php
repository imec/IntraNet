<?php

class MatricularController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function matricularAction()
    {
        if(empty($_GET) || $_GET['id']== "") {
            $this->_redirect('/matricular/search/');
        }else{
            
        } 
    }
	public function resultAction()
    {
        // action body
    }
	public function searchAction()
    {
        if(empty($_GET)) {
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

