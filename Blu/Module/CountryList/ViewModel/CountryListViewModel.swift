//
//  CountryListViewModel.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import Foundation
import UIKit

protocol CountryListDelegate: AnyObject {
    func reload()
}

final class CountryListViewModel: BaseViewModel,
                                  CountryListable,
                                  AllCountryListable,
                                  CountrySavable {
    var allCountryListService: AllCountryListServiceProtocol!
    var delegate: CountryListDelegate?
    var allCountryList: [Country] = [] {
        didSet{
            DispatchQueue.main.async {
                self.delegate?.reload()
            }
        }
    }
    
    var countryListService: CountryListServiceProtocol!
    var countryListResponse: CountryListResponse?
    var countryListChangeHandler: ((CountryListModelChange) -> Void)?
    
    var fetchFromDBIsEmpty: Bool {
        fetchAllCountryList()
        return allCountryList.isEmpty
    }
    
    init(countryListService: CountryListServiceProtocol = CountryListService(),
         allCountryListService: AllCountryListServiceProtocol = AllCountryListService()) {
        self.countryListService = countryListService
        self.allCountryListService = allCountryListService
    }
    
    func fetch() {
        if fetchFromDBIsEmpty { countryList(request: CountryListRequest()) }
    }
}
