//
//  CountryListRequest.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/28/22.
//

import Foundation

public struct CountryListRequest {
    public var itemsPerPage: Int = 30
    public var page: Int = 1
    
    var dictionary: [String: Any] {
        return ["page": page]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
