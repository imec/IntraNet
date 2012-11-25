<?php

class SearchController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {

        if (empty($_GET) || $_GET['next'] == "") {
            $this->_redirect('/');
        } else {
           
                if (empty($_GET['id']) || empty($_GET['tipo'])) {
                    $next = $_GET['next']; //obtiene el next

                    $model = new Application_Model_dbTables_Usuarios();
                    $this->view->miEstudiante = $model->getAllStudents();
                    $this->view->telefonos_model = new Application_Model_dbTables_Telefonos();
                    $this->view->next = $next;
                } else {
                    $param = $_GET['id']; //obtiene el parametro
                    $tipo = $_GET['tipo']; //obtiene el parametro
                    $next = $_GET['next']; //obtiene el next

                    $model = new Application_Model_dbTables_Usuarios(); //crea el modelo
                    $this->view->estSer = $model->searchEstudiante($param, $tipo);
                    $this->view->telefonos_model = new Application_Model_dbTables_Telefonos();
                    $this->view->next = $next;
                }
            
        }

       
    }

}
