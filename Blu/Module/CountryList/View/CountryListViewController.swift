//
//  CountryListViewController.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import UIKit

class CountryListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    var searchViewController: SearchViewController!
    
    var viewModel = CountryListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addDoneButton()
        setUpBinding()
        setup()
        setupSearchViewController()
        viewModel.fetch()
    }
    
    func setup() {
        self.title = Label.countryList.rawValue
        viewModel.delegate = self
    }
    
    func addDoneButton() {
        let doneButton = UIBarButtonItem(title: Label.done.rawValue,
                                         style: .done,
                                         target: self,
                                         action: #selector(dismissView))
        self.navigationItem.leftBarButtonItems = [doneButton]
    }
    
    @objc
    func dismissView() {
        self.dismiss(animated: true)
    }
}
