//
//  CountryListService.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/28/22.
//

import Foundation
import Alamofire

public class CountryListService: BaseService, CountryListServiceProtocol {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    public func getCountryList(request: CountryListRequest,
                             _ completion: @escaping (Result<CountryListResponse>) -> Void) {
        let urlString = createApiRoute(route: country_list_route)
        AF.request(urlString,
                   method: .get,
                   parameters: request.dictionary,
                   encoding: URLEncoding.default,
                   headers: header)
        .validate(statusCode: 200..<300)
        .responseData { (response) in
            switch response.result {
            case .success(let data):
                let result = CountryListSerializer.shared.serialize(data: data)
                completion(result)
            case .failure(let error):
                let errorModel = self.checkErrorMessage(response, error: error)
                let result = Result<CountryListResponse>.failure(errorModel)
                completion(result)
            }
        }
    }
    
    public func saveAll(response: CountryListResponse) {
        var countries: [Country] = []
        for item in response.countries {
            var country = Country(selected: false)
            country.flag = item.flag
            country.id = item.id
            country.name = item.name
            countries.append(country)
        }
        DBManager.shared.countryDao.saveAll(countries: countries)
    }
}
