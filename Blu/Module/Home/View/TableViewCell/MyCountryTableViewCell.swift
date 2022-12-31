//
//  MyCountryTableViewCell.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import UIKit
import MarqueeLabel

class MyCountryTableViewCell: BaseMyCountryCell {
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryShimmerLabel: UILabel!
    @IBOutlet weak var countryLabel: MarqueeLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func config(country: Country) {
        let presenter = CountryPresenter(country: country)
        countryLabel.text = presenter.name
        flagImageView.sd_setImage(with: URL(string: presenter.flag),
                                  placeholderImage: UIImage(named: Image.placeholder.rawValue))
    }
}

extension MyCountryTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: MyCountryTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: MyCountryTableViewCell.nameOfClass)
    }
}
