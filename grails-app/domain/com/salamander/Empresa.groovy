package com.salamander

class Empresa {

    String nombre
    String descripcion
    
    static constraints = {
        nombre blank:false
        descripcion blank:false
    }
}
