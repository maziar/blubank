//
//  SearchViewController.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/30/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setup()
    }
    
    func setup() {
        viewModel.delegate = self
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func reload() {
        tableView.reloadData()
    }
}
