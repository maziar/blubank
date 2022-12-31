//
//  CountryListSerializer.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/28/22.
//

import Foundation
import ObjectMapper

class CountryListSerializer {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    static let shared = CountryListSerializer()
    
    func serialize(data: Data) -> Result<CountryListResponse> {
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]]
        guard let json = json else {
            let result = Result<CountryListResponse>.failure(Error.invalidResponse)
            return result
        }
        guard let countries = Mapper<CountryModel>().mapArray(JSONObject: json) else {
            let result = Result<CountryListResponse>.failure(Error.invalidResponse)
            return result
        }
        let response = CountryListResponse(countries: countries)
        return Result<CountryListResponse>.success(response)
    }
}
