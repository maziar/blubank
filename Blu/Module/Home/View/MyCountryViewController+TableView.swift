//
//  MyCountryViewController+TableView.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

extension MyCountryViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        MyCountryTableViewCell.register(for: tableView)
    }
}

extension MyCountryViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyCountryViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return IntSize.one.rawValue
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myCountryList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = MyCountryCellBuilder()
        let tableCell = tableCellBuilder.build(type: .country,
                                               tableView: tableView,
                                               indexPath: indexPath)
        tableCell.delegate = self
        if let country = viewModel.myCountryList.item(at: indexPath.row) {
            tableCell.config(country: country)
        }
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeConstant.countryListCellHeight.rawValue
    }
}

extension MyCountryViewController: BaseMyCountryCellDelegate {
    func tapCountry(country: Country) {}
}
