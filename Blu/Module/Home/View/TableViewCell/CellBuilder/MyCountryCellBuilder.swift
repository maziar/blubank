//
//  MyCountryCellBuilder.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

enum MyCountryCellType {
    case country
}

class MyCountryCellBuilder {
    func build(type: MyCountryCellType, tableView: UITableView, indexPath: IndexPath) -> BaseMyCountryCell {
        var cell: BaseMyCountryCell!
        switch type {
        case .country:
            cell = tableView.dequeueReusableCell(withIdentifier: MyCountryTableViewCell.nameOfClass,
                                                 for: indexPath) as? MyCountryTableViewCell
        }
        return cell
    }
}
