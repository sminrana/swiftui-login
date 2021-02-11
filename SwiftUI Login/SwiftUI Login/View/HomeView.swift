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

struct HomeView: View {
    
    @EnvironmentObject var viewModel: LoginViewModel
    
    @State var fadeOut = false
    
    var body: some View {
        NavigationView {
            MasterView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(Text("Welcome \(self.viewModel.user.username!)"))
                .navigationBarItems(trailing:
                    Button(action: self.logout, label: {
                        Text("Log out")
                    })
                )
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
        
    }
    
    func logout() {
        self.viewModel.logged = false
    }
}

struct MasterView: View {
    let mHome = Menu(name: "Page 1", destination: .page1)
    let mToday = Menu(name: "Page 2", destination: .page2)
    
    var body: some View {
        let menus: [Menu] = [mHome, mToday]
        
        return List {
            ForEach(menus) { menu in
                Text("\(menu.name)")
            }
        }.listStyle(InsetListStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
