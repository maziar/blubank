//
//  ViewModel.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func reload()
}

final class SearchViewModel: BaseViewModel,
                             CountrySearchable,
                             CountrySavable {
    weak var delegate: SearchViewModelDelegate?
    var saveCountryService: SaveCountryServiceProtocol!
    var searchService: SearchServiceProtocol!
    var searchResultCountryList: [Country] = []
    
    var searchText: String = "" {
        didSet {
            if !searchText.isEmpty {
                searchCountryList(searchText: searchText)
            } else {
                searchResultCountryList = []
            }
            delegate?.reload()
        }
    }
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    init(searchService: SearchServiceProtocol = SearchService(),
         saveCountryService: SaveCountryServiceProtocol = SaveCountryService()) {
        self.searchService = searchService
        self.saveCountryService = saveCountryService
    }
}
