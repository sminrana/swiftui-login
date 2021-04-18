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
    @Published var user: User = User(id: 0, name: "", email: "", token: "", isLogged: false)
    
    private struct UserApiData: Codable {
        var login: Bool
        var data: User?
        var message: String
        var token: String?
    }

    func login(_ params: String...) {
        LoginApi().login(email: params[0], password: params[1], completion: { result, data in
            if result == .success {
                guard let data = data else { return }
                let decodedResponse = try! JSONDecoder().decode(UserApiData.self, from: data as! Data)
                print(decodedResponse)
                
                DispatchQueue.main.sync {
                    if decodedResponse.login {
                        if let u = decodedResponse.data {
                            self.user = User(id: u.id, name: u.name, email: u.email, token: decodedResponse.token!, isLogged: true, message: decodedResponse.message)
                        }
                    } else {
                        self.user = User(id: 0, name: "", email: "", token: "", isLogged: false, message: decodedResponse.message)
                    }
                }
            }
            
            if result == .error {
                DispatchQueue.main.sync {
                    self.user = User(id: 0, name: "", email: "", token: "", isLogged: false)
                }
            }
        })
    }
}
