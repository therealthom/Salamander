package com.salamander

class Producto {

    String nombre
    String descripcion
    TipoDeProducto tipoDeProducto
    Sucursal sucursal
    String tags
    
    static constraints = {
        nombre blank:false
        descripcion blank:false
        tipoDeProducto nullable:false
        sucursal nullable:true
        tags blank:true        
    }
}
