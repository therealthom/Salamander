package com.salamader

class RedirectToTagLib {
    def redirectMainPage = {
        response.sendRedirect("${request.contextPath}/home")
    }
}