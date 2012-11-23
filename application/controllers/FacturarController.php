<?php

class FacturarController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function facturarAction()
    {
        // action body
    }
	public function resultAction()
    {
        // action body
    }
	public function detalleAction()
    {
        if(empty($_GET) || $_GET['id']== "") {
             $this->_redirect('/facturar/search/');   
        }else{
            
        } 
    }
	public function historialAction()
    {
        // action body
    }
	public function searchAction()
    {
        if (empty($_GET) || $_GET['id'] == "" || $_GET['tipo'] == "") {
            $model = new Application_Model_dbTables_Usuarios();
            $this->view->miEstudiante = $model->getAllStudents();
            $this->view->telefonos_model = new Application_Model_dbTables_Telefonos();
        } else {
            $param = $_GET['id']; //obtiene el parametro
            $tipo = $_GET['tipo']; //obtiene el parametro
            $model = new Application_Model_dbTables_Usuarios(); //crea el modelo
            $this->view->estSer = $model->searchEstudiante($param, $tipo);
            $this->view->telefonos_model = new Application_Model_dbTables_Telefonos();
        }
    }

}

