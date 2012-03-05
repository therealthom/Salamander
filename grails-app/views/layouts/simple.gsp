<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes; org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="initial-scale = 1.0">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script type="text/javascript" src="/salamander/static/plugins/jquery-1.7.1/js/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
    
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">    
    <r:require modules="scaffolding"/>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">

    <g:layoutHead/>
    <r:layoutResources/>
  </head>

  <body>

    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <g:link class="brand" controller="home" action="index">Salamander</g:link>
          <div class="nav-collapse">
            <ul class="nav">
              <sec:ifLoggedIn>
              <li class="active">
                <g:link controller="home" action="index">Inicio</g:link>
              </li>
              </sec:ifLoggedIn>
              <sec:ifNotLoggedIn>
              <li class="active">
                <g:link controller="register" action="index">Registrarse</g:link>
              </li>
              </sec:ifNotLoggedIn>
              <li><a href="#about">Acerca de</a></li>
            </ul>
          </div><!--/.nav-collapse -->          
        </div>
      </div>
    </div>

    <div class="container">
      <g:layoutBody/>
    </div>

    <r:layoutResources/>

  </body>
</html>