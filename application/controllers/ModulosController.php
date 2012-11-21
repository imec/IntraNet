<?php

class ModulosController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

   public function indexAction()
    {
            $model = new Application_Model_dbTables_Modulos();
            $this->view->misModulos = $model->getAll();
    }
    
    public function addAction() {
        $errors = array();
        $this->view->post=false;
        
        if ($this->getRequest()->isPost()) {
            $model = new Application_Model_dbTables_Modulos();
            $errors = $model->save($_POST);
            if(count($errors) > 0) {
            $this->view->errors = $errors;
            $this->view->misModulos = $_POST;
            //obtener curso seleccionado por post
                $modelCurso2 = new Application_Model_dbTables_Cursos();
                $this->view->cursoSelect = $modelCurso2->getCurso($_POST['cursos_codigo']);
            //obtener curso seleccionado por post
            
            $this->view->post=true;
        } else {
                $this->_redirect('/modulos/');
            }   
        }
        $modelCurso = new Application_Model_dbTables_Cursos();
        $this->view->misCursos = $modelCurso->getAll();
        
    }
}

