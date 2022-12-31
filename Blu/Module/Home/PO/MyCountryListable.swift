//
//  MyCountryListable.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation

protocol MyCountryListable: AnyObject {
    var myCountryListService: MyCountryListServiceProtocol! { get }
    func fetchMyCountryList()
    var myCountryList: [Country] { get set }
}

extension MyCountryListable {
    func fetchMyCountryList() {
        myCountryList = myCountryListService.getMyCountryList()
    }
}
