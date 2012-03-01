package com.salamander

class HomeController {

    def index() { 
        [ warning : params.warning ]
    }
    
    def details() { }
}
