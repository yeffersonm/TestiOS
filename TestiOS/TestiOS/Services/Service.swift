//
//  Service.swift
//  TestiOS
//
//

import Foundation
import Alamofire

class Service {
    
    static let shared = Service()
    
    func requestForUsers(completion: @escaping(Result<[user],Error>) -> Void) {
        AF.request(caseApi.listUser.path).responseDecodable(of: [user].self) { response in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestPostByUser(users: user,completion: @escaping(Result<[post],Error>) -> Void) {
        AF.request(caseApi.postByUser(users: users).path).responseDecodable(of: [post].self) { response in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
