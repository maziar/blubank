//
//  CountryListViewModel.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import Foundation
import UIKit

final class CountryListViewModel: BaseViewModel,
                                  CountryListable,
                                  AllCountryListable,
                                  CountrySavable {
    var allCountryListService: AllCountryListServiceProtocol!
    var allCountryList: [Country] = []
    
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
