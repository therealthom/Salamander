package com.salamander

class ImagenDeProducto {

    Producto producto
    String nombre
    String descripcion
    byte[] imagen
    
    static constraints = {
        producto nullable:false
        nombre blank:false
        descripcion blank:true
        imagen nullable:false
    }
    
    String toString() {
        "${nombre}"
    }
}
