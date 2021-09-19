//
//  postByUserView.swift
//  TestiOS
//
//  
//

import Foundation
import UIKit

class postByUserView: UIViewController {
    
    @IBOutlet private weak var tablePost: UITableView!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblTel: UILabel!
    @IBOutlet private weak var lblEmail: UILabel!
    
    // MARK: Properties
    var presenter: postByUserPresenterProtocol?
    var users:user?
    var postList = [post]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        loadPresenter()
    }
    private func loadPresenter(){
        title = GlobalConstant.titlesConstant().postViewTitle
        presenter?.viewDidLoad(parm:users!)
    }
    
    private func setUpTable(){
        tablePost.delegate = self
        tablePost.dataSource = self
        PostByUserTableViewCell.register(in: self.tablePost, with: PostByUserTableViewCell().postCellId)
    }
    
    private func emptyView(){
        self.tablePost.backgroundView = self.prepareLabel()
        self.tablePost.separatorStyle = .none
    }
}

extension postByUserView: postByUserViewProtocol {
    
    func displayLoader() {
        self.startLoading()
    }
    
    func showError(message:String){
        emptyView()
        self.stopLoading()
        self.tablePost.reloadData()
        self.alert(message: message.divideMessage(), title: GlobalConstant.titlesConstant().alertTitle)
    }
    
    func setData(listData:[post]) {
        lblName.text = users?.name
        lblTel.text = users?.phone
        lblEmail.text = users?.email
        postList = listData
        self.tablePost.reloadData()
        self.stopLoading()
    }
    
    // TODO: implement view output methods
}

extension postByUserView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: PostByUserTableViewCell().postCellId, for: indexPath)
        guard let cell = tableViewCell as? PostByUserTableViewCell else { return tableViewCell }
        cell.setUp(data: postList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return GlobalConstant.titlesConstant().postViewTitle
    }
}
