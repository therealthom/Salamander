package com.salamander

import com.salamander.commons.DatosGenerales

class Sucursal extends DatosGenerales {

    Empresa empresa

    static constraints = {
        empresa nullable:true
    }    
}
