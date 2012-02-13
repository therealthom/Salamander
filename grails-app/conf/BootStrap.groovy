import com.salamander.auth.*

class BootStrap {

    def init = { servletContext ->
        
        def rol = new Rol()
        rol.authority = "ROLE_USER"
        rol.save();
        
        def usuario = new Usuario()
        usuario.username = "user"
        usuario.password = "passwd"
        usuario.fullname = "Nombre Completo"
        usuario.birthdate = new Date()
        usuario.gender = "M"
        usuario.email = "email@email.com"
        usuario.enabled = true        
        usuario.accountExpired = false
        usuario.accountLocked = false
        usuario.passwordExpired = false
        usuario.save()
        
        def usuarioRol = new UsuarioRol()
        usuarioRol.usuario = Usuario.findByUsername("user")
        usuarioRol.rol = Rol.findByAuthority("ROLE_USER")
        usuarioRol.save()
        
    }
    def destroy = {
    }
}
