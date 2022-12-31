//
//  BaseMyCountryCell.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation

protocol BaseMyCountryCellProtocol {
    func config(country: Country)
}

protocol BaseMyCountryCellDelegate: AnyObject {
    func tapCountry(country: Country)
}

extension BaseMyCountryCellDelegate {
    func tapCountry(country: Country) {}
}

class BaseMyCountryCell: BaseTableViewCell {
    weak var delegate: BaseMyCountryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(country: Country) {}
}
