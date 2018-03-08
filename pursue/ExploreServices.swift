//
//  ExploreServices.swift
//  pursue
//
//  Created by Jaylen Sanders on 3/5/18.
//  Copyright © 2018 Glory. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class ExploreServices {
    
    // MARK: - GET pursuits by interests
    
    func getPursuits(pursuitId : String, completion: @escaping (Pursuit, Post, Steps, User, Principles, Comment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["pursuitId"] = pursuitId
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    // MARK: - GET users
    
    func getUsers(completion: @escaping (User) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    // MARK: - QUERY database by user input
    
    func queryDatabase(userId : String, completion: @escaping (User, Pursuit, Steps, Principles) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["userId"] = userId
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
}
