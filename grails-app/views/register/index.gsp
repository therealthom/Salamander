<html>
  <head>
    <meta name='layout' content='simple'/>
    <title><g:message code='spring.security.ui.register.title'/></title>
  </head>
  <body>
    <div class="row"> 
      <div class="span8" style="text-align:center">    
        <div class="hero-unit">
          <h1>Heading</h1>
          <p>Tagline</p>
          <p>
            <a class="btn btn-primary btn-large">
              Learn more
            </a>
          </p>
        </div>
      </div>
      <div class="span4" style="text-align: center">
          <g:if test='${emailSent}'>
            <br/>
            <g:message code='spring.security.ui.register.sent'/>
          </g:if>
          <g:else>            
            <g:form name="registerForm" action="register" class="well">
              <div class="page-header">
                <h3>¿Eres nuevo? Regístrate</h3>
              </div>
              <g:textField name="username" bean="${command}" value="${command.username}" placeholder="Nombre de Usuario" class="span3"/>
              <g:textField name="fullname" bean="${command}" value="${command.fullname}" placeholder="Nombre Completo" class="span3"/>              
              <g:textField name="email" bean="${command}" value="${command.email}" placeholder="Correo electrónico" class="span3"/>
              <g:passwordField name="password" value="" placeholder="Contraseña" class="span3"/>
              <g:passwordField name="password2" value="" placeholder="Contraseña (Otra vez)" class="span3"/>
              <g:submitButton name="send" value="Crear Cuenta" class="btn btn-primary btn-medium"/>
            </g:form>
          </g:else>
      </div>
    </div>
    <script>
      $(document).ready(function() {
        $('#username').focus();
      });
    </script>
  </body>
</html>
