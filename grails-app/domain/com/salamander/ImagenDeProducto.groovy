package com.salamander

class ImagenDeProducto {

    Producto producto
    byte[] imagen
    
    static constraints = {
        producto nullable:false
        imagen nullable:false
    }
}
