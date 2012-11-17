<?php

class CursosController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
            $model = new Application_Model_dbTables_Cursos();
            $this->view->misCursos = $model->getAll();
    }
    public function addAction() {
        $errors = array();
        $this->view->post=false;
        
        if ($this->getRequest()->isPost()) {
            $model = new Application_Model_dbTables_Cursos();
            $errors = $model->save($_POST);
            if(count($errors) > 0) {
            $this->view->errors = $errors;
            $this->view->curso = $_POST;
            $this->view->post=true;
        } else {
                $this->_redirect('/cursos/');
            }   
        }
    }
    public function deleteAction() {
        if ($this->getRequest()->isPost()) { //si es post ejecuta
            $del = $this->getRequest()->getPost('del'); //si es el boton si elimina
            if ($del == 'Si') { // si el boton es el SI
                $id = $this->getRequest()->getPost('id'); //obtiene el id
                
                $cursos = new Application_Model_dbTables_Cursos(); //crea el modelo
                $cursos->deleteCurso($id); //ejecuta el metodo eliminar 
            }
            $this->_redirect('/cursos/');
        } else { //si no es post ejecuta otra accion
            $id = $this->_getParam('id', 0); // obtiene el parametro
            
            $cursos = new Application_Model_dbTables_Cursos(); //crea el modelo
            $this->view->curso = $cursos->getCurso($id); //obtiene los datos del articulo a eliminar
        }
    }
    public function editAction() {
        if ($this->getRequest()->isPost()) { //si es post ejecuta
            $data = array(
                'nombre' => $_POST['nombre'],
                'descripcion' => $_POST['descripcion'],
            );
            
            $cursos = new Application_Model_dbTables_Cursos(); //crea el modelo
           $cursos->updateCurso($_POST); //ejecuta el metodo actualizar 
            
            $this->_redirect('/cursos/');
        } else { //si no es post ejecuta otra accion
            $id = $this->_getParam('id', 0); // obtiene el parametro
            $cursos = new Application_Model_dbTables_Cursos();  // crea el modelo
            $this->view->curso = $cursos->getCurso($id); //obtiene los datos del articulo a eliminar
        }
    }

}

