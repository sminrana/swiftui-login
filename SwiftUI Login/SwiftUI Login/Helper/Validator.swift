/**
 * ***********************************************************************
 *  SMIN RANA CONFIDENTIAL
 *   __________________
 *
 * Copyright 2020  Smin Rana
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Smin Rana and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Smin Rana
 * and its suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Smin Rana.
 * www.sminrana.com
 *
 */

import Foundation

class Validator: NSObject {
    @discardableResult func validateUsername(_ username: String?) throws -> String {
        guard let username = username else { throw ValidationError.requireUsername }
        
        guard username.count > 0 else { throw ValidationError.requireUsername }
        
        let emailValidator = EmailValidator()
        guard emailValidator.isValidEmail(email: username) else { throw ValidationError.inValidEmail}
        
        return username
    }
    
    @discardableResult func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.requirePassword }
        
        guard password.count > 0 else { throw ValidationError.requirePassword }
        
        return password
    }
}

class EmailValidator: NSObject {
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}

enum ValidationError: LocalizedError {
    case requireUsername
    case requirePassword
    case inValidEmail
    
    var errorDescription: String? {
        switch self {
            case .requireUsername:
                return "Email address is required"
            case .requirePassword:
                return "Password is required"
            case .inValidEmail:
                return "Invalid email address"
        }
    }
}

