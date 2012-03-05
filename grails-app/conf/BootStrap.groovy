import com.salamander.auth.*

class BootStrap {

    def init = { servletContext ->
        if (!Rol.findByAuthority("ROLE_USER")) {
            def rol = new Rol(authority : "ROLE_USER")
            rol.save()
        }        
    }
    def destroy = {
    }
}
