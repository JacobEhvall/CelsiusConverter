//
//  CelsiusConverter.swift
//  CelsiusConverter
//
//  Created by Jacob  Ehnvall on 2020-01-16.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import Foundation
class CelsiusConverter {
    
    
    func degreesFahrenheit(degressCelsius: Int ) -> Int {
        
        let degreeF = 1.8 * Double(degressCelsius) + 32.0
        
        
        return Int(round(degreeF))
    }

}
