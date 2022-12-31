//
//  CountrySavable.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/30/22.
//

import Foundation

protocol CountrySavable: AnyObject {
    func saveCountries(countries: [Country])
    func updateCountry(country: Country)
    func deleteAll()
}

extension CountrySavable {
    func saveCountries(countries: [Country]) {
        DBManager.shared.countryDao.saveAll(countries: countries)
    }
    
    func updateCountry(country: Country) {
        DBManager.shared.countryDao.update(country: country)
    }
    
    func deleteAll() {
        DBManager.shared.countryDao.deleteAll()
    }
}
