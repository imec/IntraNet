<?php

class EstudiantesController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function infoAction() {
        if (empty($_GET) || $_GET['id'] == "") {
            $this->_redirect('/estudiantes/search/');
        } else {
            $model1 = new Application_Model_dbTables_Usuarios();
            $a = $model1->getEstudiante($_GET['id']);
            if(empty($a)){
                $this->_redirect('/estudiantes/search/');
            }else{
                // TAB PERSONAL *****************************
                    //crea el modelo para informacion
                        $model = new Application_Model_dbTables_Usuarios();
                        $this->view->Estudiante = $model->getUsuario($_GET['id']);

                    //crea el modelo para telefonos         
                        $modelTelefonos = new Application_Model_dbTables_Telefonos(); 
                        $this->view->Telefonos = $modelTelefonos->getTelefonos($_GET['id']);

                    //crea el modelo para fotos     
                        $modelFotos = new Application_Model_dbTables_Fotos();
                        $foto = $modelFotos->getFoto($_GET['id']);
                        if (empty($foto)) {
                            $this->view->Foto = "no.jpg";
                        } else {
                            $this->view->Foto = $foto['nombreFoto'];
                        }

                // TAB CURSOS *******************************
                    //Obtiene informacion de Cursos Matriculados         
                        $modelCursos = new Application_Model_dbTables_Miscursosmatriculados(); 
                        $this->view->CursosMatriculados = $modelCursos->getCursosMatriculados($_GET['id']);
                        $this->view->cursos_model = new Application_Model_dbTables_Cursos(); 
                        $this->view->grupos_model = new Application_Model_dbTables_Grupos();
            }                
        }
    }

    public function searchAction() {

        if (empty($_GET) || $_GET['id'] == "" || $_GET['tipo'] == "") {
            $model = new Application_Model_dbTables_Usuarios();
            $this->view->miEstudiante = $model->getAll();
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
