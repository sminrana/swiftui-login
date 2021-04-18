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

/// Main menu item for the list
struct Menu: Identifiable {
    var id = UUID()
    var name: String
    var destination: ViewType
}

enum ViewType {
    case page1
    case page2
}

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    var token: String?
    var isLogged: Bool?
    var message: String?
}

