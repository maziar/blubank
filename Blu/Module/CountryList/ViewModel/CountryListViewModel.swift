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
    var delegate: CountryListDelegate?
    var allCountryList: [Country] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.reload()
            }
        }
    }
    var saveCountryService: SaveCountryServiceProtocol!
    var allCountryListService: AllCountryListServiceProtocol!
    var countryListService: CountryListServiceProtocol!
    var countryListResponse: CountryListResponse?
    var countryListChangeHandler: ((CountryListModelChange) -> Void)?
    
    var fetchFromDBIsEmpty: Bool {
        fetchAllCountryList()
        return allCountryList.isEmpty
    }
    
    init(countryListService: CountryListServiceProtocol = CountryListService(),
         allCountryListService: AllCountryListServiceProtocol = AllCountryListService(),
         saveCountryService: SaveCountryServiceProtocol = SaveCountryService()) {
        self.countryListService = countryListService
        self.allCountryListService = allCountryListService
        self.saveCountryService = saveCountryService
    }
    
    func fetch() {
        if fetchFromDBIsEmpty { countryList(request: CountryListRequest()) }
    }
}
