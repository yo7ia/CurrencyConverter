//
//  CurrencyCell.swift
//  FixerIoCurrencyConverter (iOS)
//
//  Created by Ahmed Yehia on 24/06/2021.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var currencySymbolLbl: UILabel!
    @IBOutlet weak var currencySymbolFlagLbl: UILabel!
    @IBOutlet weak var currencyValueLbl: UILabel!
    @IBOutlet weak var backView: UIView!

    func configureCell(currency: Currency) {
        currencyValueLbl.text = currency.value.fromNormaltoCurrencyFormat
        currencySymbolLbl.text = "\(currency.symbol!)"
        currencySymbolFlagLbl.text = "\(currency.flag ?? "")"
        backView.dropShadow()
    }

}
