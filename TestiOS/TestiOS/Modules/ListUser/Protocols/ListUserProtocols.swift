//
//  ListUserProtocols.swift
//  TestiOS
//
//  
//

import Foundation
import UIKit

protocol ListUserViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListUserPresenterProtocol? { get set }
    func reloadData(data: [user])
    func showError(error:String)
    func showLoader()
    func emptyView(rows:Int)
    func viewContent(rows:Int)
}

protocol ListUserWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListUserModule() -> UIViewController
    func presentPostController(from:ListUserViewProtocol, user:user)
}

protocol ListUserPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListUserViewProtocol? { get set }
    var interactor: ListUserInteractorInputProtocol? { get set }
    var wireFrame: ListUserWireFrameProtocol? { get set }
    func presentPostView(user:user)
    func viewDidLoad()
    func searchString(char:String)
    func valideContent(content:[user])
}

protocol ListUserInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func fillArray(with content: [user])
    func displayError(error: String)
    func verifyData(char:String, data:[user])
}

protocol ListUserInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListUserInteractorOutputProtocol? { get set }
    func fetchUsers()
    func filterString(char:String, array:[user])
}
