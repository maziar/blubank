//
//  MyCountryListService.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation

public class MyCountryListService: MyCountryListServiceProtocol {
    public func getMyCountryList() -> [Country] {
        let countries = DBManager.shared.countryDao.getSelected()
        return countries
    }
}
