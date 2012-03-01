package com.salamander.auth

import com.salamander.geo.GeoPosition

class Usuario {

    static searchable = true
    
    transient springSecurityService

    String username
    String password
    String fullname
    String email
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [ geoPositions : GeoPosition ]
    
    static constraints = {
        username blank: false, unique: true
        password blank: false
        email blank:false, email: true, unique: true
        fullname nullable:false, blank: false
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
