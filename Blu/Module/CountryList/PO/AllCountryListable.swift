//
//  AllCountryListable.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/30/22.
//

import Foundation

protocol AllCountryListable: AnyObject {
    var allCountryListService: AllCountryListServiceProtocol! { get }
    func fetchAllCountryList()
    var allCountryList: [Country] { get set }
}

extension AllCountryListable {
    func fetchAllCountryList() {
        allCountryList = allCountryListService.getAllCountryList()
    }
}
