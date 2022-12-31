//
//  CountryListViewController+TableView.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

extension CountryListViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        CountryTableViewCell.register(for: tableView)
        tableView.cr.addHeadRefresh(animator: PullToRefreshAnimator()) {
            self.viewModel.allCountryList = [Country]()
            self.viewModel.deleteAll()
            self.tableView.reloadData()
            self.viewModel.countryList(request: CountryListRequest())
        }
    }
}

extension CountryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            guard var country = viewModel.allCountryList.item(at: indexPath.row) else {
                return
            }
            cell.accessoryType = country.selected ? .none : .checkmark
            country.selected = !country.selected
            viewModel.allCountryList[indexPath.row] = country
            viewModel.updateCountry(country: country)
        }
    }
}

extension CountryListViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return IntSize.one.rawValue
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allCountryList.isEmpty ? 10 : viewModel.allCountryList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = CountryCellBuilder()
        let tableCell = tableCellBuilder.build(type: .country,
                                               tableView: tableView,
                                               indexPath: indexPath)
        tableCell.delegate = self
        if let country = viewModel.allCountryList.item(at: indexPath.row) {
            tableCell.config(country: country)
        }
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeConstant.countryListCellHeight.rawValue
    }
}

extension CountryListViewController: BaseCountryCellDelegate {
    func tapCountry(country: Country) {
    }
}
