//
//  File.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class ChocoMilk: Milk {
    
    enum Cacao: String {
        case Original = "Choco Milk"
        case SixtyPercent = "60% Cacaco Choco Milk"
        case NinetyPercent  = "90% Cacaco Choco Milk"
    }
    
    private var cacao: Cacao
    
    init(manufacturedDate: Date, fat: Int, cacao: Cacao, hot: Bool, calorie: Int) {
        self.cacao = cacao
        super.init(brand: "매일우유", capacity: 550, price: Money(how: 2000), name: cacao.rawValue, manufacturedDate: manufacturedDate, fat: fat, expiration: Calendar.current.date(byAdding: .day, value: 14, to: manufacturedDate)!, hot: hot, calorie: calorie)
    }
    
    required init() {
        self.cacao = .Original
        let manufacturedDate = Date()
        super.init(brand: "매일우유", capacity: 550, price: Money(how: 2000), name: cacao.rawValue, manufacturedDate: manufacturedDate, fat: 20, expiration: Calendar.current.date(byAdding: .day, value: 14, to: manufacturedDate)!, hot: false, calorie: 550)
    }
    
    required init?(coder: NSCoder) {
        self.cacao = coder.decodeObject(forKey: "cacao") as! Cacao
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(cacao, forKey: "cacao")
        super.encode(with: coder)
    }
    
}
