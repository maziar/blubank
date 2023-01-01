//
//  CountryListServiceProtocol.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/28/22.
//

import Foundation

public protocol CountryListServiceProtocol {
    func getCountryList(request: CountryListRequest,
                        _ completion: @escaping (Result<CountryListResponse>) -> Void)
    func saveAll(response: CountryListResponse)
}
