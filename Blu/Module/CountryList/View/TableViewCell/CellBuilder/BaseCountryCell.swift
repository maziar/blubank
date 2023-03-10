//
//  BaseCountryCell.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/29/22.
//

import Foundation

protocol BaseCountryCellProtocol {
    func config(country: Country?)
}

class BaseCountryCell: BaseTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(country: Country?) {}
}
