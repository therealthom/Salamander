package com.salamander

import grails.plugins.springsecurity.Secured

class AdminController {

    @Secured(['ROLE_USER'])
    def index() {   
    }
}