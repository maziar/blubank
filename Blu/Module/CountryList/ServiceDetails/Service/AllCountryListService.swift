//
//  AllCountryListSerivce.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/30/22.
//

import Foundation

public class AllCountryListService: AllCountryListServiceProtocol {
    public func getAllCountryList() -> [Country] {
        let countries = DBManager.shared.countryDao.getAll()
        return countries
    }
}
