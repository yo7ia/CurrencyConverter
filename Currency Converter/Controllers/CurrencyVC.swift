//
//  MainVC.swift
//  FixerIoCurrencyConverter (iOS)
//
//  Created by Ahmed Yehia on 24/06/2021.
//


import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var baseCurrencyFlagLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let country = IsoCountryCodes.searchByCurrency(BASE_CURRENCY).first
        baseCurrencyFlagLbl.text = "\(country?.flag ?? "")"
        getValues()
    }
    

    
    func getValues() {
        CurrencyService.instance.getLatestCurrencyValues(completion: { (success) in
            if success {
                self.tableView.reloadData()
            }
        })
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrencyService.instance.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell") as? CurrencyCell else {
            return UITableViewCell()
        }
        let currency = CurrencyService.instance.currencies[indexPath.row]
        
        cell.configureCell(currency: currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        let currency = CurrencyService.instance.currencies[indexPath.row]
        CurrencyService.instance.selectedCurrency = currency
        
        guard let converterVC = storyboard?.instantiateViewController(withIdentifier: "ConverterVC") as? ConverterVC else { return }
        converterVC.initData(symbol: currency)
        present(converterVC, animated: true, completion: nil)
    }
    
}


