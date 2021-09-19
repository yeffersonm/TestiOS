//
//  ListUserPresenter.swift
//  TestiOS
//
//  
//

import Foundation

class ListUserPresenter  {
    
    // MARK: Properties
    weak var view: ListUserViewProtocol?
    var interactor: ListUserInteractorInputProtocol?
    var wireFrame: ListUserWireFrameProtocol?
    private var searching = Bool()
    private var initialValues = [user]()
    private var localList = localService.shared.load()
}

extension ListUserPresenter: ListUserPresenterProtocol {
    
    func valideContent(content: [user]) {
        if searching{
            if content.count > 0 {
                view?.viewContent(rows:content.count)
            }else{
                view?.emptyView(rows:0)
            }
        }else{
            if content.count > 0{
                view?.viewContent(rows:content.count)
            }else{
                view?.emptyView(rows:0)
            }
        }
    }
    
    
    func viewDidLoad() {
        view?.showLoader()
        if(localList.isEmpty){
            interactor?.fetchUsers()
        }else{
            self.initialValues = localList
            view?.reloadData(data: localList)
        }
    }
    
    func searchString(char: String) {
        interactor?.filterString(char: char, array: initialValues)
    }
    
    func presentPostView(user:user){
        wireFrame?.presentPostController(from: view!, user: user)
    }
}

extension ListUserPresenter: ListUserInteractorOutputProtocol {
    
    func fillArray(with content: [user]) {
        self.initialValues = content
        view?.reloadData(data: content)
    }
    func displayError(error: String) {
        view?.showError(error: error)
    }
    func verifyData(char:String, data:[user]){
        if char.count > 0 {
            self.searching = true
            view?.reloadData(data: data)
        }else{
            self.searching = false
            view?.reloadData(data: initialValues)
        }
    }
    
    // TODO: implement interactor output methods
}
