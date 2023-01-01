//
//  CountrySavable.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/30/22.
//

import Foundation

protocol CountrySavable: AnyObject {
    var saveCountryService: SaveCountryServiceProtocol! { get }
    func saveCountries(countries: [Country])
    func updateCountry(country: Country)
    func deleteAll()
}

extension CountrySavable {
    func saveCountries(countries: [Country]) {
        saveCountryService.saveCountries(countries: countries)
    }
    
    func updateCountry(country: Country) {
        saveCountryService.updateCountry(country: country)
    }
    
    func deleteAll() {
        saveCountryService.deleteAll()
    }
}
