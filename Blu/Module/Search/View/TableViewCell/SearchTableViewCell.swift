//
//  SearchTableViewCell.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/31/22.
//

import UIKit
import MarqueeLabel

class SearchTableViewCell: BaseCountryCell {
    @IBOutlet weak var countryNameLabel: MarqueeLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func config(country: Country?) {
        guard let country = country else {
            return
        }
        let presenter = CountryPresenter(country: country)
        countryNameLabel.text = presenter.name
        let accessoryType: AccessoryType = country.selected ? .checkmark : .none
        self.accessoryType = accessoryType
    }
}

extension SearchTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: SearchTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: SearchTableViewCell.nameOfClass)
    }
}
