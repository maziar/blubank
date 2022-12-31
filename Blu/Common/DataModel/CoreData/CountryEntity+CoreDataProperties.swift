//
//  CountryEntity+CoreDataProperties.swift
//  
//
//  Created by Maziar Saadatfar on 12/30/22.
//
//

import Foundation
import CoreData


extension CountryEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: "CountryEntity")
    }

    @NSManaged public var flag: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var selected: Bool

    func toCountry() -> Country {
        var country = Country(selected: false)
        country.id = Int(self.id)
        country.flag = self.flag
        country.name = self.name
        country.selected = self.selected
        return country
    }
}
