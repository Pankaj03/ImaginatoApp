//
//  LoginApiManager.swift
//  ImaginatoApp
//
//  Created by VishalNeha on 24/03/21.
//  Copyright © 2021 Pankaj Asudani. All rights reserved.
//

import UIKit

class LoginApiManager: NSObject {
    
    func callApi(controller: UIViewController, params: [String: Any], onCompletion: ((LoginResponse?)-> Void)?) {
     
        Services.makeRequest(apiURL: LoginApi.login.urlString(), method: .post, parameters: params) { (response, error) in
            if let data = response?.value as? [[String: Any]] {
                print(data)
                onCompletion?(nil)
            }else{
                onCompletion?(nil)
            }
        }
    }
}
