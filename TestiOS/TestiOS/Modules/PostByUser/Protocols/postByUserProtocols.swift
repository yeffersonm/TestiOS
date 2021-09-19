//
//  postByUserProtocols.swift
//  TestiOS
//
//  
//

import Foundation
import UIKit

protocol postByUserViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: postByUserPresenterProtocol? { get set }
    func setData(listData:[post])
    func displayLoader()
    func showError(message:String)
}

protocol postByUserWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createpostByUserModule(user:user) -> UIViewController
}

protocol postByUserPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: postByUserViewProtocol? { get set }
    var interactor: postByUserInteractorInputProtocol? { get set }
    var wireFrame: postByUserWireFrameProtocol? { get set }
    
    func viewDidLoad(parm:user)
}

protocol postByUserInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func fillData(data:[post])
    func displayError(error:String)
}

protocol postByUserInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: postByUserInteractorOutputProtocol? { get set }
    func fetchPostByUser(users:user)
}
