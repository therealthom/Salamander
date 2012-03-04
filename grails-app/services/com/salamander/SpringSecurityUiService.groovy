package com.salamander

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.springframework.transaction.interceptor.TransactionAspectSupport

class SpringSecurityUiService extends grails.plugins.springsecurity.ui.SpringSecurityUiService {

    RegistrationCode register(user, String cleartextPassword, salt) {
        String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName
        String passwordFieldName = SpringSecurityUtils.securityConfig.userLookup.passwordPropertyName

        user."$passwordFieldName" = cleartextPassword
        if (!user.save()) {
            warnErrors user, messageSource
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
            return null
        }

        def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
        if (!registrationCode.save()) {
            warnErrors registrationCode, messageSource
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
        }

        registrationCode
    }
        
}
