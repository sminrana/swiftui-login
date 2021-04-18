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

enum ResponseResult {
    case success
    case error
}

final class LoginApi {
    func login(email: String, password: String, completion: @escaping (_ result: ResponseResult, _ data: Any?) -> ()) {
        let postData = "email=\(email)&password=\(password)".data(using: .utf8)
        
        guard let url = URL(string: AppSettings.HOST + "/api/login") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = postData
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            print(data)
            if (error != nil) {
                completion(.error, data)
            } else {
                completion(.success, data)
            }
        }.resume()
    }
}
