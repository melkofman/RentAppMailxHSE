//
//  SettingsSection.swift
//  SettingsTemplate
//
//  Created by Таисия Хахарова on 01.11.2020.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//
protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum Options: Int, CaseIterable, SectionType {
    case personalInf
    case payments
    case feedback
    case notifications
    case phonenumber
    case about
    case logout
    
    var containsSwitch: Bool{
    switch self{
    case.notifications:return true
    case.phonenumber:return true
    case.personalInf:return false
    case.payments: return false
    case.feedback:return false
    case.about: return false
    case.logout:return false
        
    }
        }
    
    var description: String {
        switch self{
        case .personalInf: return "Личная информация"
        case .payments: return "Платежи"
        case .feedback:return "Обратная связь"
        case .notifications: return "Уведомления"
        case .phonenumber: return "Показывать номер"
        case .about: return "О приложении"
        case .logout: return "Выйти"
        }
    }
}


