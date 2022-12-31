//
//  Navigator.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination,
                  isPresent: Bool,
                  modalPresentationStyle: UIModalPresentationStyle,
                  animated: Bool,
                  viewModel: BaseViewModel?,
                  isModalInPresentation: Bool)
}
