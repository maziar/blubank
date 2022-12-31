//
//  CountryCellBuilder.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation
import UIKit

enum CountryCellType {
    case country
    case search
}

class CountryCellBuilder {
    func build(type: CountryCellType, tableView: UITableView, indexPath: IndexPath) -> BaseCountryCell {
        var cell: BaseCountryCell!
        switch type {
        case .country:
            cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.nameOfClass,
                                                 for: indexPath) as? CountryTableViewCell
        case .search:
            cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.nameOfClass,
                                                 for: indexPath) as? SearchTableViewCell
        }
        return cell
    }
}
