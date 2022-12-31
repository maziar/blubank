//
//  SearchServiceProtocol.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import Foundation

public protocol SearchServiceProtocol {
    func searchCountryList(searchText: String) -> [Country]
}
