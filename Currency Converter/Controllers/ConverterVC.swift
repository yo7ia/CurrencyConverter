//
//  ConverterVC.swift
//  FixerIoCurrencyConverter (iOS)
//
//  Created by Ahmed Yehia on 24/06/2021.
//
import UIKit

class ConverterVC: UIViewController {

    @IBOutlet weak var baseCurrencySymbolLbl: UILabel!
    @IBOutlet weak var targetCurrencySymbolLbl: UILabel!
    @IBOutlet weak var baseCurrencyValueTxt: UITextField!
    @IBOutlet weak var targetCurrencyValueTxt: UITextField!
    
    var selectedCurrency : Currency!
    var currencySymbol: String!
    var currencyValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(ConverterVC.handleTap))
        view.addGestureRecognizer(tap)
        
        setupView()
    }
    
    func initData(symbol: Currency) {
        self.selectedCurrency = symbol
        self.currencySymbol = symbol.symbol
        self.currencyValue = symbol.value
    }
    
    func setupView() {
        baseCurrencySymbolLbl.text = BASE_CURRENCY
        baseCurrencyValueTxt.text = "\(BASE_VALUE)"
        
        targetCurrencySymbolLbl.text = currencySymbol
        targetCurrencyValueTxt.text = currencyValue
    }
    
    func convertCurrency() {
        guard let amount = baseCurrencyValueTxt.text else { return }
        let sanitizedAmount = Double(amount.toEnglishNumbers) ?? 1.0
        
        let convertedAmount = sanitizedAmount * (Double(currencyValue) ?? 1.0)
        
        self.targetCurrencyValueTxt.text = "\(convertedAmount)".fromNormaltoCurrencyFormat
       
    }
    
    @IBAction func convert(_ sender: Any) {
        view.endEditing(true)
        convertCurrency()
    }
    
    
}


extension ConverterVC:  UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @objc func handleTap(){
        view.endEditing(true)
        convertCurrency()
    }
}
