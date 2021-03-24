//
//  String+Extention.swift
//  ImaginatoApp
//
//  Created by pankaja on 24/03/21.
//  Copyright © 2021 Pankaj Asudani. All rights reserved.
//

import Foundation

extension String {
    
    func isValidPassword() throws -> Bool {
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
    
    func isValidEmail() throws -> Bool {
      let isEmail = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
        if isEmail == false{
            throw ValidationError.invalidEmail
        }
        return isEmail
    }
}
