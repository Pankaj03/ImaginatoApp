//
//  Validation.swift
//  ImaginatoApp
//
//  Created by pankaja on 24/03/21.
//  Copyright © 2021 Pankaj Asudani. All rights reserved.
//

import UIKit

enum ValidationError: Error, Equatable {

    case emptyEmail, emptyPassword
    case invalidEmail, invalidPassword
    var value: String? {
        switch self {
            case .emptyEmail: return "Field is mandatory"
            case .emptyPassword: return "Field is mandatory"
            case .invalidEmail: return "Please Enter a valid email address"
            case .invalidPassword: return String(format: "%@", "Password must have least one uppercase\nleast one digit\nleast one lowercase\nleast one symbol\nmin 8 characters total")
        }
    }
}

class Validation: NSObject {
    private(set) var email: String?
    private(set) var password: String?
}
extension Validation{
    func isValidFields(_ fields:[InputFieldStyle], data dictFields:[InputFieldStyle: Any]?) throws {
        do {
            try  fields.forEach { (inputFieldStyle) in
                let value = dictFields?[.email] as? String
                try self.isValueEmtpy(value, forFieldType: inputFieldStyle)
                
                if inputFieldStyle == .email {
                    try value?.isValidEmail()
                }
                if inputFieldStyle == .password {
                    try value?.isValidPassword()
                }
            }
        }catch{
            throw error
        }
        self.email = dictFields?[.email] as? String
        self.password = dictFields?[.password] as? String
    }
    
    func isValueEmtpy(_ value: Any?, forFieldType field: InputFieldStyle) throws {
        switch field {
            case . email: throw ValidationError.emptyEmail
            case .password: throw ValidationError.emptyPassword
        }
    }
}
