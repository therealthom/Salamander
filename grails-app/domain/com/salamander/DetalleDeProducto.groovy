package com.salamander

class DetalleDeProducto {

    Sucursal sucursal
    Producto producto    
    Integer existencia
    Double precio
    
    static constraints = {
        sucursal nullable: true
        producto nullable: false
        existencia blank:false
        precio blank:false
    }
}
