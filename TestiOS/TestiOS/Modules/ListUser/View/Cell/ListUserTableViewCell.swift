//
//  ListUserTableViewCell.swift
//  TestiOS
//
//

import UIKit

class ListUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var telUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    @IBOutlet weak var imagePhone: UIImageView!
    @IBOutlet weak var imageEmail: UIImageView!
    
    let userCellId = GlobalConstant.constantcells().userCellId
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCell(with content: user){
        nameUser.text = content.name
        telUser.text = content.phone
        emailUser.text = content.email
    }
    
    static func register(in table: UITableView, with identifier: String){
        let nib = UINib.init(nibName: String.init(describing: ListUserTableViewCell.self), bundle: nil)
        table.register(nib, forCellReuseIdentifier: identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
