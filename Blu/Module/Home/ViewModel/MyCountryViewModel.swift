//
//  MyCountryViewModel.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import Foundation
import UIKit

protocol MyCountryDelegate: AnyObject {
    func reload()
}

final class MyCountryViewModel: BaseViewModel,
                                MyCountryListable {
    weak var delegate: MyCountryDelegate?
    
    var myCountryListService: MyCountryListServiceProtocol!
    var myCountryList: [Country] = [] {
        didSet {
            delegate?.reload()
        }
    }
    init(myCountryListService: MyCountryListServiceProtocol = MyCountryListService()) {
        self.myCountryListService = myCountryListService
    }
}
