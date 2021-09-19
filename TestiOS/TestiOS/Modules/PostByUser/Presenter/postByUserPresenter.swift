//
//  postByUserPresenter.swift
//  TestiOS
//
//  
//

import Foundation

class postByUserPresenter  {
    // MARK: Properties
    weak var view: postByUserViewProtocol?
    var interactor: postByUserInteractorInputProtocol?
    var wireFrame: postByUserWireFrameProtocol?
}

extension postByUserPresenter: postByUserPresenterProtocol {
    func viewDidLoad(parm:user) {
        view?.displayLoader()
        interactor?.fetchPostByUser(users: parm)
    }
}

extension postByUserPresenter: postByUserInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func fillData(data:[post]){
        view?.setData(listData: data)
    }
    
    func displayError(error:String){
        view?.showError(message: error)
    }
}
