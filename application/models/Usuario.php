<?php

class Application_Model_Usuario extends Zend_Db_Table_Row_Abstract{
    
   public function  getEdad() {
        $fecha_nac= $this->fechaNacimiento;
        $dia=date("j"); 
        $mes=date("n"); 
        $anno=date("Y"); 
        
        //descomponer fecha de nacimiento 
        $dia_nac=substr($fecha_nac, 8, 2); 
        $mes_nac=substr($fecha_nac, 5, 2); 
        $anno_nac=substr($fecha_nac, 0, 4); 


        if($mes_nac>$mes){ 
        $calc_edad= $anno-$anno_nac-1; 
        }else{ 
        if($mes==$mes_nac AND $dia_nac>$dia){ 
        $calc_edad= $anno-$anno_nac-1;  
        }else{ 
        $calc_edad= $anno-$anno_nac; 
        } 
        } 
        return $calc_edad;
    }
    public function  getFechaRegistro() {
       
        $fecha=date("D d M Y",strtotime($this->fechaNacimiento));
        
        return $fecha;
    }
    
}    
