//
//  LoginViewController.swift
//  ImaginatoApp
//
//  Created by VishalNeha on 24/03/21.
//  Copyright © 2021 Pankaj Asudani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .always
    }

    //IBAction Method
    @IBAction func loginButtonPressed(_ sender: Any) {
        loginAPICall()
    }
    
}
extension LoginViewController{
    func loginAPICall() {
        let validation = Validation()
        let fields: [InputFieldStyle] = [.email, .password]
        var dictFields = [InputFieldStyle: Any]()
        dictFields[.email] = self.emailTextField.text
        dictFields[.password] = self.passwordTextField.text
        do{
            try validation.isValidFields(fields, data: dictFields)
            viewModel.apiCall(self, params: ["email":validation.email ?? "", "password":validation.password ?? ""]) {
            }
        } catch{
            if let validatedError = error as? ValidationError {
                print(validatedError)
                //show error message
            }
        }
    }
}
