//
//  MyCountryDependecyContainer.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

class MyCountryDependecyContainer: MyCountryNavigatorProtocol {
    func makeCountryListViewController() -> UINavigationController {
        let vc = CountryListViewController(nibName: CountryListViewController.nameOfClass, bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }
}
