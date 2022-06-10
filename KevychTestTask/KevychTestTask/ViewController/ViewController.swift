//
//  ViewController.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    
    //MARK: UIElements
    private let tableView = UITableView(frame: UIScreen.main.bounds)
    private let searchBar = UISearchController()
    private var viewModel: ViewControllerModel?
    
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeItems()
        initUI()
    }
    
    
    
    //MARK: Private methods
    
    private func initUI() {
        addConstrints()
    }
    

    
    private func initializeItems() {
        self.viewModel = ViewControllerModel()
        self.viewModel?.delegate = self
//        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .systemGray6
        searchBar.searchBar.delegate = self
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        view.addSubview(tableView)
        tableView.register(DetailTableViewCell.self ,
                           forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        title = viewModel?.controllerTitleText ?? ""
        viewModel?.loadData()
    }
    
    private func addConstrints() {
        let tableViewConstraint = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ]
        
        NSLayoutConstraint.activate(tableViewConstraint)
        
    }
}


//MARK: TableView Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell,
              let viewModel = viewModel else { return UITableViewCell()}
        cell.configure(model: viewModel.returnCellModel(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.heightForRow() ?? 0
    }
}


//MARK: SearchBar Extension
extension ViewController: UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) { }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text,
              let viewModel = viewModel else { return }
        viewModel.getRequest(searchWorld: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.loadData()
    }
}

extension ViewController: ViewControllerModelDelegate {
    func updateUI() {
        DispatchQueue.main.async { [ weak self ] in
            self?.tableView.reloadData()
        }
    }
    
    func callAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: buttonText,
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        // show the alert
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}
