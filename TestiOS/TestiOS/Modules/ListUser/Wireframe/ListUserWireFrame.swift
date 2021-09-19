//
//  ListUserWireFrame.swift
//  TestiOS
//
//  
//

import Foundation
import UIKit

class ListUserWireFrame: ListUserWireFrameProtocol {
    
    class func createListUserModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ListUser")
        if let view = navController.children.first as? ListUserView {
            let presenter: ListUserPresenterProtocol & ListUserInteractorOutputProtocol = ListUserPresenter()
            let interactor: ListUserInteractorInputProtocol  = ListUserInteractor()
            let wireFrame: ListUserWireFrameProtocol = ListUserWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    func presentPostController(from:ListUserViewProtocol, user:user){
        let postController = postByUserWireFrame.createpostByUserModule(user: user)
        postController.modalPresentationStyle = .fullScreen
        if let newView = from as? UIViewController {
            newView.navigationController?.pushViewController(postController, animated: true)
        }
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ListUser", bundle: Bundle.main)
    }
    
}
