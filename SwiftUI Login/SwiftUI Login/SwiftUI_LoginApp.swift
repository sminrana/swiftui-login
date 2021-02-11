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

@main
struct SwiftUI_LoginApp: App {
    let persistenceController = PersistenceController.shared

    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.logged {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(self.viewModel)
            } else {
                LoginView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(self.viewModel)
            }
        }
    }
}
