//
//  Services.swift
//  ImaginatoApp
//
//  Created by VishalNeha on 24/03/21.
//  Copyright © 2021 Pankaj Asudani. All rights reserved.
//

import Foundation
import Alamofire

var host: String!

var currentEnvironment: String!

//MARK:- Service Configuration

private struct ServiceConfig
{
    static let devHost = "http://imaginato.mocklab.io/"
}

//MARK:- Service Environments
enum ServiceEnvironment: String
{
    case development
}

//MARK:- API Endpoints

enum LoginApi {
    case login
    
    //Methods
    func urlString() -> String {
    let prefixAuth = host ?? ""
        switch self {
        case .login:
            return prefixAuth + "login"
        }
    }
}

class Services
{
    static var env: ServiceEnvironment!
    typealias CompletionHandler = (_ response:DataResponse<Any>?, _ error:Error?) -> ()
    typealias DownloadCompletionHandler = (_ response:DefaultDownloadResponse?, _ error:Error?) -> ()
    
    static func initWebServicesEnvironment(_ environment: ServiceEnvironment)
    {
        env = environment
        switch environment
        {
        case .development:
            host = ServiceConfig.devHost
            currentEnvironment = "dev"
            break
        }
    }
}

extension Services {
    class func makeRequest(apiURL urlString:String, method: HTTPMethod, parameters: [String:Any]?, completionHandler:CompletionHandler?) {
        
        print("--------------------------------------------------------------------")
        print("request url      => \(urlString)")
        print("request params   => \(String(describing: parameters))")
        print("--------------------------------------------------------------------")
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON {(response:DataResponse<Any>) in
                let status_code = response.response?.statusCode
                if status_code == 200 {
                    switch(response.result) {
                    case .success(_):
                        completionHandler?(response, nil)
                    case .failure(_):
                        completionHandler?(nil, response.result.error)
                        break
                    }
                } else {
                    completionHandler?(nil, nil)
                }
        }
    }
}
