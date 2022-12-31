//
//  MyCountryViewController.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import UIKit

class MyCountryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var navigator = MyCountryNavigator(navigationController: self.navigationController)
    var viewModel = MyCountryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTableView()
        addCoutryListButton()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchMyCountryList()
    }
    
    func setup() {
        self.title = Label.home.rawValue
    }
    
    func addCoutryListButton() {
        let addButton = UIBarButtonItem(title: Label.selectCountries.rawValue,
                                        style: .done,
                                        target: self,
                                        action: #selector(goToCountryList))
        self.navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc
    func goToCountryList() {
        navigator.navigate(to: .countryList, isPresent: true)
    }
}

extension MyCountryViewController: MyCountryDelegate {
    func reload() {
        tableView.reloadData()
    }
}
