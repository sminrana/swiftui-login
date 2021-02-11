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
        let login: Bool = true
        completion(.success, login)
        //completion(.error, login)
        
        /*let postData = "email=\(params[0])&password=\(params[1])".data(using: .utf8)
        
        guard let url = URL(string: "http://local.com/api/login") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = postData
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data else { return }
            completion(.success, data)
         
            /*let decodedResponse = try! JSONDecoder().decode(User.self, from: data)
            
            DispatchQueue.main.sync {
                completion(.success, login)
            }*/
            
        }.resume()*/
    }
}
