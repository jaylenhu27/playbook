//
//  EngagementServices.swift
//  pursue
//
//  Created by Jaylen Sanders on 3/5/18.
//  Copyright © 2018 Glory. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class EngagementServices {
    
    // MARK: - COMMENT ON step/principle/pursuit
    
    func commentOnPost(postId : String, commentId : String, comment_text : String, completion: @escaping (PostComment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["postId"] = postId
        parameters["userId"] = userId
        parameters["commentId"] = commentId
        parameters["comment_text"] = comment_text
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    func commentOnPrinciple(principleId : String, commentId : String, comment_text : String, completion: @escaping (PrincipleComment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["principleId"] = principleId
        parameters["userId"] = userId
        parameters["commentId"] = commentId
        parameters["comment_text"] = comment_text
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    func commentOnStep(stepId : String, commentId : String, comment_text : String, completion: @escaping (StepsComment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["stepId"] = stepId
        parameters["userId"] = userId
        parameters["commentId"] = commentId
        parameters["comment_text"] = comment_text
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    // MARK: - DELETE COMMENT FROM step/principle/pursuit
    
    func deleteCommentFromPost(postId : String, commentId : String, completion: @escaping (PostComment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["postId"] = postId
        parameters["commentId"] = commentId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    func deleteCommentFromStep(stepId : String, commentId : String, completion: @escaping (StepsComment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["stepId"] = stepId
        parameters["commentId"] = commentId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    func deleteCommentFromPrinciple(principleId : String, commentId : String, completion: @escaping (PrincipleComment) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["principleId"] = principleId
        parameters["commentId"] = commentId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    // MARK: - SELECT video at id
    
    func selectVideoAtId(postId : String, completion: @escaping (Post) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["postId"] = postId
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    // MARK: - TOGGLE saving step
    
    func toggleSaveStep(stepId : String, pursuitId : String, completion: @escaping (Engagements) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["pursuitId"] = pursuitId
        parameters["stepId"] = stepId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    
    func toggleSavePost(postId : String, pursuitId : String, completion: @escaping (Engagements) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["pursuitId"] = pursuitId
        parameters["postId"] = postId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    func toggleSavePrinciple(principleId : String, pursuitId : String, completion: @escaping (Engagements) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        var parameters = Alamofire.Parameters()
        parameters["principleId"] = principleId
        parameters["pursuitId"] = pursuitId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }
    
    // MARK: - TOOGLE like step/principle/pursuit
    
    func togglePostLike(postId : String, completion: @escaping (Engagements) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["postId"] = postId
        parameters["userId"] = userId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    func togglePrincipleLike(principleId : String, completion: @escaping (Engagements) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["principleId"] = principleId
        parameters["userId"] = userId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    func toggleStepLike(stepId : String, completion: @escaping (Engagements) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["stepId"] = stepId
        parameters["userId"] = userId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    // MARK: - TOGGLE follow interests
    
    func toggleFollowInterests(interestId : String, completion: @escaping (Interests) -> ()) {
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["userId"] = userId
        parameters["interestId"] = interestId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
    // MARK: - TOGGLE follow user
    
    func toggleFollowUser(followeeId : String, completion: @escaping (User) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }

        var parameters = Alamofire.Parameters()
        parameters["followerId"] = userId
        parameters["followeeId"] = followeeId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
            
        }
    }

    // MARK: - TOGGLE follow pursuit
    
    func toggleFollowPursuit(pursuitId : String, completion: @escaping (Pursuit) -> ()){
        let url = "https://pursuit-jaylenhu27.c9users.io/"
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        var parameters = Alamofire.Parameters()
        parameters["pursuitId"] = pursuitId
        parameters["userId"] = userId
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Success: \(response.result.isSuccess)")
            case .failure:
                print("Failure: \(response.result.isSuccess)")
            }
        }
    }
    
}
