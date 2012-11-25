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
	

}

