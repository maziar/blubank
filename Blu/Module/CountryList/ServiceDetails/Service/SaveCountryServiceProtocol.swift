//
//  SaveCountryServiceProtocol.swift
//  Blu
//
//  Created by Maziar Saadatfar on 1/1/23.
//

import Foundation

public protocol SaveCountryServiceProtocol {
    func saveCountries(countries: [Country])
    func updateCountry(country: Country)
    func deleteAll()
}
