<?php

class PostsController extends Zend_Controller_Action {

	public function listarAction() {

        $model = new Application_Model_Posts();
		$this -> view -> posts = $model -> getAll();
		
    }

    public function agregarAction() {

        $form = new Application_Form_AgregarCurso();

        if ($this->getRequest()->isPost()) {

            if ($form->isValid($this->_getAllParams())) {
                $model = new Application_Model_Posts();
                $model->save($form->getValues());
                return $this->_redirect('/posts/listar/');
            }
        }

        $this->view->form = $form;
    }
	
}
