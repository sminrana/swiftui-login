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
import CoreData

struct LoginView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    // Save username and password in AppStorage
    @AppStorage("username") var username: String = ""
    @AppStorage("password") var password: String = ""
    
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.gray, Color.secondary]),
                       startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.vertical)
        .overlay(
            VStack(spacing: 20) {
                Text("Your Logo Here")
                    .font(.largeTitle)
                TextField("Email Address", text: $username)
                    .padding()
                    .border(Color.white)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .padding()
                    .cornerRadius(5.0)
                    .border(Color.white)
                Button("Login", action: login)
                    .frame(width: 250, alignment: .center)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(EdgeInsets(top: 10.00, leading: 80.00, bottom: 20.00, trailing: 80.00))
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Warning"), message: Text("\(self.alertMessage)"), dismissButton: .default(Text("Ok")))
                    })
            }
            .padding(50)
            .onReceive(viewModel.$user, perform:  { user in
                // Show alert with the message receive from server if login fails
                if !(user.isLogged ?? false) && user.message != nil {
                    self.showAlert = true
                    self.alertMessage = user.message ?? ""
                }
            })
        )
    }
    
    func login() {
        let validator = Validator()
        
        do {
            try validator.validateUsername(self.username)
        } catch ValidationError.requireUsername {
            showAlert = true
            alertMessage = ValidationError.requireUsername.localizedDescription
            return
        } catch {
            
        }
        
        do {
            try validator.validateUsername(self.username)
        } catch ValidationError.inValidEmail {
            showAlert = true
            alertMessage = ValidationError.inValidEmail.localizedDescription
            return
        } catch {
            
        }
        
        do {
            try validator.validatePassword(self.password)
        } catch ValidationError.requirePassword {
            showAlert = true
            alertMessage = ValidationError.requirePassword.localizedDescription
            return
        } catch {
           
        }
        
        self.viewModel.login(self.username, self.password)
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

