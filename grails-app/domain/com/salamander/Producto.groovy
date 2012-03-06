package com.salamander

class Producto {

    String nombre
    String descripcion
    Empresa empresa
    Integer existencia
    Double precio
    String tags
    
    static constraints = {
        nombre blank:false
        descripcion blank:false
        empresa nullable:false
        existencia blank:false
        precio blank:false, scale:2
        tags blank:false
    }
    
    String toString() {
        "${nombre}"
    }
}