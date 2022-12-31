//
//  SearchService.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import Foundation

public class SearchService: SearchServiceProtocol {
    public func searchCountryList(searchText: String) -> [Country] {
        let countries = DBManager.shared.countryDao.search(searchText: searchText)
        return countries
    }
}
