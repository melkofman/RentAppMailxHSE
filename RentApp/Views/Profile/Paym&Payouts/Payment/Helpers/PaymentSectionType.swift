//
//  PaymentSection.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit

protocol PaymentSectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum POptions: Int, CaseIterable, PaymentSectionType {
    case methods
    case statistics
    case settings
    var containsSwitch: Bool{
        switch self{
        case.methods:return false
        case.statistics:return false
        case.settings:return false
        
        }
            }
        
        var description: String {
            switch self{
            case .methods: return "Способы оплаты"
            case .statistics: return "Статистика платежей"
            case .settings:return "Настройки"
            
            }
        }
    }

