package com.salamander

import com.salamander.commons.DatosGenerales
import com.salamander.auth.Usuario

class Empresa extends DatosGenerales {
    Usuario usuario
    
    static constraints = {
        usuario nullable:false
    }
}
