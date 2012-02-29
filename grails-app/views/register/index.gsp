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
      <div class="span4" style="text-align:center">            
        <g:form action='register' name='registerForm'>
          <g:if test='${emailSent}'>
            <br/>
            <g:message code='spring.security.ui.register.sent'/>
          </g:if>
          <g:else>
            <br/>
            <table>
              <tbody>
              <s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}" size='40' labelCodeDefault='Username' value="${command.username}"/>
              <s2ui:textFieldRow name='email' bean="${command}" value="${command.email}" size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>              
              <s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}" size='40' labelCodeDefault='Password' value="${command.password}"/>
              <s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}" size='40' labelCodeDefault='Password (again)' value="${command.password2}"/>
              </tbody>
            </table>
            <s2ui:submitButton elementId='create' form='registerForm' messageCode='spring.security.ui.register.submit'/>
          </g:else>
        </g:form>        
      </div>
    </div>
    <script>
      $(document).ready(function() {
        $('#username').focus();
      });
    </script>
  </body>
</html>
