//
//  ViewController.swift
//  CelsiusConverter
//
//  Created by Jacob  Ehnvall on 2020-01-16.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    
    
    @IBOutlet weak var temeratureLabel: UILabel!
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    
    private let userDefualtsRowKey = "defaultPickerRow"
    
    private var temeratureValues = (-100...100).map{$0}
    
    let converter = CelsiusConverter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        temeratureLabel.text = "\(0) F"
        
        
        let defaultPickerRow = initialPickerRow()
        
        
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: 0, inComponent: 0)
        
//        for index in -100...100 {
//            temeratureValues.append(index)
//        }
        
    }
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefualtsRowKey) as? Int
        
        if let row = savedRow {
            return row
        } else {
            return temeratureValues.count / 2
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temeratureValues.count
        
        //        if component == 0 {
        //            return 4
        //        } else {
        //            return 2
        //        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temeratureValues[row]) °C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let degreeC = temeratureValues[row]
        let degreeF = converter.degreesFahrenheit(degressCelsius: degreeC)
        temeratureLabel.text = "\(degreeF) °F"
        
        saveSelected(row: row)
    }
   
    
    func saveSelected(row: Int) {
        
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefualtsRowKey)
        defaults.synchronize()
        
    }
    
    
}

