//
//  postByUserInteractor.swift
//  TestiOS
//
//  
//

import Foundation

class postByUserInteractor: postByUserInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: postByUserInteractorOutputProtocol?
    
    func fetchPostByUser(users:user){
        Service.shared.requestPostByUser(users: users) { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.presenter?.fillData(data: model)
                }
            case .failure(let error):
                self.presenter?.displayError(error: error.localizedDescription)
            }
        }
    }
}
