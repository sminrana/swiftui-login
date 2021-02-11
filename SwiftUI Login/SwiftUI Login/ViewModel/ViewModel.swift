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

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var logged: Bool = false
    @Published var user: User = User()
    
    func login(_ params: String...) {
        
        LoginApi().login(email: params[0], password: params[1], completion: { result, data in
            if result == .success {
                self.logged = true
                self.user = User(username: "Smin Rana")
            }
            
            if result == .error {
                self.logged = false
            }
        })
    }
}
