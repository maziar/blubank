//
//  CountrySearchable.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import Foundation

protocol CountrySearchable: AnyObject {
    var searchService: SearchServiceProtocol! { get }
    func searchCountryList(searchText: String)
    var searchResultCountryList: [Country] { get set }
}

extension CountrySearchable {
    func searchCountryList(searchText: String) {
        searchResultCountryList = searchService.searchCountryList(searchText: searchText)
    }
}
