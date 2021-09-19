//
//  ListUserInteractor.swift
//  TestiOS
//
//  
//

import Foundation

class ListUserInteractor: ListUserInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: ListUserInteractorOutputProtocol?
    
    
    func fetchUsers() {
        Service.shared.requestForUsers { resul in
            switch resul {
            case .success(let model):
                DispatchQueue.main.async {
                    self.presenter?.fillArray(with: model)
                    localService.shared.save(model)
                }
            case .failure(let error):
                self.presenter?.displayError(error: error.localizedDescription)
            }
        }
    }
    
    func filterString(char: String, array: [user]) {
        let structArray = array.filter { $0.name.localizedCaseInsensitiveContains(char)}
        self.presenter?.verifyData(char: char, data: structArray)
    }
    
}
