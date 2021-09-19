//
//  Constants.swift
//  TestiOS
//
//

import Foundation
import UIKit

var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

struct Constants {
    struct localData {
        let KeyForUserDefaults = "UserArray"
    }
    
    struct resourceApi {
        let mainUrl = "https://jsonplaceholder.typicode.com"
    }
    
    struct color {
        let mainColor = UIColor(red: 0.157, green: 0.655, blue: 0.271, alpha: 1)
    }
}

struct GlobalConstant {
    struct constantcells {
        let userCellId = "userCell"
        let postCellId = "postCell"
    }
    struct titlesConstant {
        let firstViewTitle = "Prueba de ingreso"
        let placeholderTitle = "Buscar usuario"
        let postViewTitle = "Publicaciones"
        let alertTitle = "ERROR"
    }
}

enum caseApi {
    case listUser
    case postByUser(users:user)
    
    var path:String {
        switch self {
        case .listUser:
            return Constants.resourceApi().mainUrl + "/users"
        case let .postByUser(users):
            return Constants.resourceApi().mainUrl + "/posts?userId=\(users.id)"
        }
    }
}

