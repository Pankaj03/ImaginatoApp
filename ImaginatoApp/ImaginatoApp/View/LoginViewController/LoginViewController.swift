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
        
        
    }
    
}
extension LoginViewController{
    
    
}
