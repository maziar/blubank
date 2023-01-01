//
//  SaveCountryService.swift
//  Blu
//
//  Created by Maziar Saadatfar on 1/1/23.
//

import Foundation

public class SaveCountryService: SaveCountryServiceProtocol {
    public func saveCountries(countries: [Country]) {
        DBManager.shared.countryDao.saveAll(countries: countries)
    }
    
    public func updateCountry(country: Country) {
        DBManager.shared.countryDao.update(country: country)
    }
    
    public func deleteAll() {
        DBManager.shared.countryDao.deleteAll()
    }
}
