//
//  PaymentCell.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit

class PaymentCell: UITableViewCell {
    var paymentType: PaymentSectionType? {
        didSet  {
            guard let paymentType = paymentType else{return}
            textLabel?.text = paymentType.description
           
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
