<html>
  <head>
    <title><g:message code='spring.security.ui.login.title'/></title>
    <meta name='layout' content='simple'/>
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
        <div class="login s2ui_center ui-corner-all" style='text-align:center;'>
          <div class="login-inner">
            <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off' class="well">
              <div class="sign-in">
                <div class="page-header">
                  <h3>Iniciar Sesión</h3>
                </div>
                <input name="j_username" id="username" size="20" placeholder="Nombre de Usuario" class="span3"/>
                <input type="password" name="j_password" id="password" size="20" placeholder="Contraseña" class="span3"/>
                <br/>
                <!--label class="checkbox">
                  <input type="checkbox" class="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />
                  <g:message code='spring.security.ui.login.rememberme'/>
                </label-->
                <br/>
                <g:link controller='register' action="forgotPassword">Recuperar Contraseña</g:link>
                <g:link controller='register'>Crear cuenta</g:link>
                <br/><br/>
                <g:submitButton class="btn btn-primary btn-medium" name="btnEnviar" value="Ingresar"/>
                
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script>
      $(document).ready(function() {
	$('#username').focus();
      });
      <s2ui:initCheckboxes/>
    </script>
  </body>
</html>
