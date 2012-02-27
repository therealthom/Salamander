package com.salamander.auth

import com.salamander.geo.GeoPosition

class Usuario {

    static searchable = true
    
    transient springSecurityService

    String username
    String password
    String fullname
    String birthdate
    String gender
    String email
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [ geoPositions : GeoPosition ]
    
    static constraints = {
        username blank: false, unique: true
        password blank: false
        fullname blank: false
        birthdate blank: false
        gender blank: false
        email email: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Rol> getAuthorities() {
        UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
