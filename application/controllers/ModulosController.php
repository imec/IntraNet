<?php

class ModulosController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

   public function indexAction() {
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
            
            //Obtener curso seleccionado por post *********************************************
            /**/  $modelCurso2 = new Application_Model_dbTables_Cursos();
            /**/  $this->view->cursoSelect = $modelCurso2->getCurso($_POST['cursos_codigo']);
            //Obtener curso seleccionado por post *********************************************
            
            $this->view->post=true;
        } else {
                $this->_redirect('/modulos/');
            }   
        }
        $modelCurso = new Application_Model_dbTables_Cursos();
        $this->view->misCursos = $modelCurso->getAll();
        
    }

     public function deleteAction() {
        if ($this->getRequest()->isPost()) {
            //si es post ejecuta esta accion
            $del = $this->getRequest()->getPost('del'); 
            if ($del == 'Si') { 
                //De ser el boton "si" elimina
                $id = $this->getRequest()->getPost('id'); //obtiene el id
                $modulos = new Application_Model_dbTables_Modulos(); //crea el modelo
                $modulos->deleteModulo($id); //ejecuta el metodo eliminar 
            }
            $this->_redirect('/modulos/');
        } else { 
            //si no es post ejecuta otra accion
            $id = $this->_getParam('id', 0); // obtiene el parametro
            $modulos = new Application_Model_dbTables_Modulos(); //crea el modelo
            $this->view->modulo = $modulos->getModulo($id); //obtiene los datos del modulo a eliminar
        }
    }
    
    public function editAction() {
        if ($this->getRequest()->isPost()) { //si es post ejecuta
            $data = array(
                'nombre' => $_POST['nombre'],
                'descripcion' => $_POST['descripcion'],
                'cursos_codigo' => $_POST['cursos_codigo'],
            );

            $modulos = new Application_Model_dbTables_Modulos(); //crea el modelo
            $modulos->updateModulo($_POST); //ejecuta el metodo actualizar 

            $this->_redirect('/modulos/');
        } else { 
            //si no es post ejecuta otra accion
                $id = $this->_getParam('id', 0); // obtiene el parametro
                $modulos = new Application_Model_dbTables_Modulos();  // crea el modelo
                $this->view->modulo = $modulos->getModulo($id); //obtiene los datos del articulo a eliminar
                $a = $modulos->getModulo($id); //obtiene los datos del articulo a eliminar

            //Obtener datos del curso perteneciente al modulo *********************************************
                  $modelCurso = new Application_Model_dbTables_Cursos();
                  $this->view->cursoSelect = $modelCurso->getCurso($a['cursos_codigo']);
            
            //Obtener datos de todos los cursos *********************************************
                  $modelCurso2 = new Application_Model_dbTables_Cursos();
                  $this->view->misCursos = $modelCurso2->getAll();
            
            
        }
    }
}

