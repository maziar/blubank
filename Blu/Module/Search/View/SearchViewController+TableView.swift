//
//  SearchViewController+TableView.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import Foundation
import UIKit

extension SearchViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        SearchTableViewCell.register(for: tableView)
    }
}

extension SearchViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            guard var country = viewModel.searchResultCountryList.item(at: indexPath.row) else {
                return
            }
            cell.accessoryType = country.selected ? .none : .checkmark
            country.selected.toggle()
            viewModel.searchResultCountryList[indexPath.row] = country
            viewModel.updateCountry(country: country)
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return IntSize.one.rawValue
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResultCountryList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = CountryCellBuilder()
        let tableCell = tableCellBuilder.build(type: .search,
                                               tableView: tableView,
                                               indexPath: indexPath)
        if let country = viewModel.searchResultCountryList.item(at: indexPath.row) {
            tableCell.config(country: country)
        }
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  SizeConstant.searchTableCellHeight.rawValue
    }
}
