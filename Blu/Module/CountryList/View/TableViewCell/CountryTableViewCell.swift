//
//  CountryTableViewCell.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import UIKit
import MarqueeLabel
import SDWebImage
import UIView_Shimmer

class CountryTableViewCell: BaseCountryCell, ShimmeringViewProtocol {
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryShimmerLabel: UILabel!
    @IBOutlet weak var countryLabel: MarqueeLabel!
    
    var shimmeringAnimatedItems: [UIView] {
        [
            countryShimmerLabel,
            flagImageView
        ]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.showShimmer(show: true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func config(country: Country?) {
        if let country = country {
            let presenter = CountryPresenter(country: country)
            countryLabel.text = presenter.name
            flagImageView.sd_setImage(with: URL(string: presenter.flag),
                                      placeholderImage: UIImage(named: Image.placeholder.rawValue))
            let accessoryType: AccessoryType = country.selected ? .checkmark : .none
            self.accessoryType = accessoryType
            self.showShimmer(show: false)
        }
        else {
            countryLabel.text = String()
            flagImageView.image = UIImage()
            self.accessoryType = .none
            self.showShimmer(show: true)
        }
    }
}

extension CountryTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: CountryTableViewCell.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: CountryTableViewCell.nameOfClass)
    }
}
