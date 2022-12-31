//
//  CountryListViewController+Searching.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import Foundation
import UIKit

extension CountryListViewController {
    func setupSearchViewController() {
        searchViewController = SearchViewController(nibName: SearchViewController.nameOfClass, bundle: nil)
        searchController = UISearchController(searchResultsController: searchViewController)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Label.search.rawValue
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.delegate = self
        searchController.searchBar.tintColor = .lightGray
        searchController.showsSearchResultsController = true
        searchController.isActive = true
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension CountryListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.searchTextField.isFirstResponder {
            searchController.showsSearchResultsController = true
            let color = UIColor.gray
            searchController.searchBar.searchTextField.backgroundColor = color
        } else {
            searchController.searchBar.searchTextField.backgroundColor = nil
            searchViewController.viewModel.searchText = String()
            searchViewController.tableView.reloadData()
        }
    }
}

extension CountryListViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewController.viewModel.searchText = searchText
    }
}

extension CountryListViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            self.searchController.searchResultsController?.view.isHidden = false
        }
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.searchController.searchResultsController?.view.isHidden = false
    }
}
