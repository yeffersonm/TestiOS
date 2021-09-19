//
//  postByUserWireFrame.swift
//  TestiOS
//
//  
//

import Foundation
import UIKit

class postByUserWireFrame: postByUserWireFrameProtocol {
    
    class func createpostByUserModule(user:user) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "postByUser")
        if let view = viewController as? postByUserView {
            let presenter: postByUserPresenterProtocol & postByUserInteractorOutputProtocol = postByUserPresenter()
            let interactor: postByUserInteractorInputProtocol  = postByUserInteractor()
            let wireFrame: postByUserWireFrameProtocol = postByUserWireFrame()
            
            view.presenter = presenter
            view.users = user
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "PostByUser", bundle: Bundle.main)
    }
    
}
