//
//  Extensions.swift
//  TestiOS
//
//

import UIKit


extension UISearchBar {
    
    func addPlaceholder(text:String){
        self.placeholder = GlobalConstant.titlesConstant().placeholderTitle
    }
    
    func addBorder(){
        self.backgroundColor = .white
        self.layer.borderColor = Constants.color().mainColor.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}

extension UIViewController {
    func startLoading() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.scaleIndicator(factor: 2.5)
        activityIndicator.style = .gray
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
        }
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
        }
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func alert(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func prepareLabel() -> UILabel {
        let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        emptyLabel.text = "List is empty"
        emptyLabel.textAlignment = NSTextAlignment.center
        return emptyLabel
    }
    
}

extension UIActivityIndicatorView {
    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}

extension String {
    
    func divideMessage() -> String {
        var descripcion = String()
        if let range = self.range(of: ":") {
            let text = self[range.upperBound...].trimmingCharacters(in: .whitespaces)
            descripcion = text
        }
        return descripcion
    }
    
}
