//
//  CountryListable.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
enum CountryListModelChange {
    case didSuccess
    case didError(Error)
    case didChangeNetworkActivityStatus(Bool)
}

protocol CountryListable: AnyObject {
    var countryListService: CountryListServiceProtocol! { get }
    var countryListResponse: CountryListResponse? { get set }
    var countryListChangeHandler: ((CountryListModelChange) -> Void)? { get set }
    func countryList(request: CountryListRequest)
}

extension CountryListable {
    func countryList(request: CountryListRequest) {
        emitCountryList(.didChangeNetworkActivityStatus(true))
        countryListService.getCountryList(request: request) { [weak self](result) in
            guard let strongSelf = self else { return }
            strongSelf.emitCountryList(.didChangeNetworkActivityStatus(false))
            switch result {
            case .success(let response):
                strongSelf.countryListResponse = response
                strongSelf.countryListService.saveAll(response: response)
                strongSelf.emitCountryList(.didSuccess)
            case .failure(let error):
                strongSelf.emitCountryList(.didError(error))
            }
        }
    }
    
    func emitCountryList(_ change: CountryListModelChange) {
        countryListChangeHandler?(change)
    }
}
