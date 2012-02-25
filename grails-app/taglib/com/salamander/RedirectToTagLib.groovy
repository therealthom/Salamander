package com.salamander

class RedirectToTagLib {
    def redirectMainPage = {
        response.sendRedirect("${request.contextPath}/home")
    }
}