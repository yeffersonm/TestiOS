//
//  PostByUserTableViewCell.swift
//  TestiOS
//
//

import UIKit

class PostByUserTableViewCell: UITableViewCell {
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var subtitlePost: UILabel!
    
    let postCellId = GlobalConstant.constantcells().postCellId
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func register(in table: UITableView, with identifier: String){
        let nib = UINib.init(nibName: String.init(describing: PostByUserTableViewCell.self), bundle: nil)
        table.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func setUp(data:post){
        titlePost.text = data.title
        subtitlePost.text = data.body
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
