//
//  CountryModel.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/28/22.
//

import Foundation
import ObjectMapper

public struct CountryModel: Mappable
{
    public var flag: String?
    public var id: Int!
    public var name: String?
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        self.flag <- map["flags.png"]
        self.id <- map["area"]
        self.name <- map["name.common"]
    }
}
