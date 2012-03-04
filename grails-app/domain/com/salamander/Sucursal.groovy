package com.salamander

import com.salamander.geo.GeoPosition

class Sucursal {

    String nombre
    String descripcion
    GeoPosition geoposition

    static constraints = {
        nombre blank:false
        descripcion blank:false
        geoposition nullable:true
    }
}
