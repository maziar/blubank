//
//  MyCountryNavigator.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

class MyCountryNavigator: Navigator {
    enum Destination {
        case countryList
    }
    
    private weak var navigationController: UINavigationController?
    private let viewControllerFactory: MyCountryNavigatorProtocol
    
    init(navigationController: UINavigationController?,
         viewControllerFactory: MyCountryNavigatorProtocol = MyCountryDependecyContainer()) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func navigate(to destination: Destination,
                  isPresent: Bool = false,
                  modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                  animated: Bool = true,
                  viewModel: BaseViewModel? = nil,
                  isModalInPresentation: Bool = false) {
        let viewController = makeViewController(for: destination, viewModel: viewModel)
        
        if isPresent {
            viewController.isModalInPresentation = isModalInPresentation
            viewController.modalPresentationStyle = modalPresentationStyle
            navigationController?.present(viewController, animated: animated, completion: nil)
        } else {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func makeViewController(for destination: Destination,
                                    viewModel: BaseViewModel? = nil) -> UIViewController {
        switch destination {
        case .countryList:
            return viewControllerFactory.makeCountryListViewController()
        }
    }
}
