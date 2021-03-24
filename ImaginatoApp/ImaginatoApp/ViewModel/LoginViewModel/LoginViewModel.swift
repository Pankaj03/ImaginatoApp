//
//  LoginViewModel.swift
//  ImaginatoApp
//
//  Created by VishalNeha on 24/03/21.
//  Copyright © 2021 Pankaj Asudani. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    private(set) var response: LoginResponse?
}
extension LoginViewModel{
    func apiCall(_ controller: UIViewController, params : [String: Any], onCompletion completion: (() -> Void)?) {
        LoginApiManager().callApi(controller: controller, params: params) { (loginResponse) in
            self.response = loginResponse
        }
    }
}
