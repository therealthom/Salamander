package com.salamander.geo

class Coordinates {
    
    GeoPosition position
    static constraints = {
        latitude(nullable:true)
        longitude(nullable:true)
        altitude(nullable:true)
        accuracy(nullable:true)
        altitudeAccuracy(nullable:true)
        heading(nullable:true)
        speed(nullable:true)
    }
    double latitude
    double longitude
    double altitude
    double accuracy
    double altitudeAccuracy
    double heading
    double speed 
    static belongsTo = GeoPosition
    
}
