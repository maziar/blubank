//
//  CountryPresenter.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation

struct CountryPresenter {
    var name: String
    var flag: String
    
    init(country: CountryModel) {
        self.name = country.name ?? String()
        self.flag = country.flag ?? String()
    }
    
    init(country: Country) {
        self.name = country.name ?? String()
        self.flag = country.flag ?? String()
    }
}
