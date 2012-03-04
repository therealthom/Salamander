package com.salamander

class Producto {

    String nombre
    String descripcion
    TipoDeProducto tipoDeProducto
    String tags
    
    static constraints = {
        nombre blank:false
        descripcion blank:false
        tipoDeProducto nullable:false
        tags blank:true        
    }
}
