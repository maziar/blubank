//
//  CountryListViewController+Binding.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation

extension CountryListViewController {
    func setUpBinding() {
        bindCountryListViewModel()
    }
    
    func bindCountryListViewModel() {
        viewModel.countryListChangeHandler = { [weak self] change in
            guard let strongSelf = self else { return }
            switch change {
            case .didChangeNetworkActivityStatus(_):
                break
            case .didSuccess:
                strongSelf.tableView.cr.endHeaderRefresh()
                strongSelf.tableView.cr.endLoadingMore()
                strongSelf.viewModel.fetchAllCountryList()
            case .didError(let error):
                strongSelf.tableView.cr.endHeaderRefresh()
                strongSelf.tableView.cr.endLoadingMore()
                print(error)
            }
        }
    }
}
