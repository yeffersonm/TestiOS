//
//  ListUserView.swift
//  TestiOS
//
//  
//

import Foundation
import UIKit

class ListUserView: UIViewController {
    @IBOutlet private weak var tableUser: UITableView!
    @IBOutlet private weak var textSearch: UISearchBar!
    var listUser = [user]()
    private var rowsCount = Int()
    var presenter: ListUserPresenterProtocol?
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = GlobalConstant.titlesConstant().firstViewTitle
        setUpTable()
        loadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.textSearch.endEditing(true)
    }
    private func stopLoader(){
        self.stopLoading()
    }
    
    private func loadingView(){
        textSearch.returnKeyType = .done
        textSearch.addBorder()
        textSearch.addPlaceholder(text: GlobalConstant.titlesConstant().placeholderTitle)
        textSearch.delegate = self
        presenter?.viewDidLoad()
    }
    
    private func setUpTable(){
        self.tableUser.delegate = self
        self.tableUser.dataSource = self
        ListUserTableViewCell.register(in: self.tableUser, with: ListUserTableViewCell().userCellId)
    }
}

extension ListUserView: ListUserViewProtocol {
    
    func viewContent(rows:Int) {
        self.tableUser.backgroundView = nil
        self.tableUser.separatorStyle = .singleLine
        self.rowsCount = rows
        tableUser.reloadData()
        stopLoader()
    }
    
    func emptyView(rows:Int){
        self.tableUser.backgroundView = self.prepareLabel()
        self.tableUser.separatorStyle = .none
        self.rowsCount = rows
        tableUser.reloadData()
        stopLoader()
    }
    
    func reloadData(data: [user]) {
        listUser = data
        reload()
    }
    
    private func reload(){
        presenter?.valideContent(content: listUser)
    }
    
    func showError(error:String){
        emptyView(rows: 0)
        self.alert(message: error.divideMessage(), title: GlobalConstant.titlesConstant().alertTitle)
    }
    
    func showLoader() {
        self.startLoading()
    }
    
}

extension ListUserView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: ListUserTableViewCell().userCellId, for: indexPath)
        guard let cell = tableViewCell as? ListUserTableViewCell else { return tableViewCell }
        cell.selectionStyle = .none
        cell.setUpCell(with: listUser[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentPostView(user: listUser[indexPath.row])
    }
}

extension ListUserView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchString(char: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.endEditing(true)
    }
}
