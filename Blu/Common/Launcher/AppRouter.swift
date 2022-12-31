//
//  AppRouter.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import Foundation
import UIKit

final class AppRouter {
    static let shared = AppRouter()
    
    func configureHomeViewController() -> UIViewController {
        let vc = MyCountryViewController(nibName: MyCountryViewController.nameOfClass, bundle: nil)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
}
