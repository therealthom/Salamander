package com.salamander

class TipoDeProducto {

    String nombre
    String descripcion
    
    static constraints = {
        nombre blank:false
        descripcion blank:true
    }
    
    String toString() {
        "${nombre}"
    }
}
