<?php

class MatricularController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function matricularAction()
    {
        if(empty($_GET) || $_GET['id']== "" ) {
            $this->_redirect('/matricular/search/');
        }else{
            
        } 
    }
	public function resultAction()
    {
        // action body
    }
	

}

