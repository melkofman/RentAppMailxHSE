
//
//  MessageCell.swift
//  incoming
//
//  Created by Melanie Kofman on 28.10.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {
    let textView: UITextView = {
        let textv = UITextView()
        textv.backgroundColor = .clear
        textv.font = UIFont.systemFont(ofSize: 16)
        textv.translatesAutoresizingMaskIntoConstraints = false
        return textv
    }()
    
    let helperImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "helper")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        imageView.layer.masksToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    static let colorUser = UIColor(red: 0/255, green: 0/255, blue: 230/255, alpha: 0.6)
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = colorUser
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    var bubbleViewWidthAnchor: NSLayoutConstraint?
    var bubbleViewRightAncor: NSLayoutConstraint?
    var bubbleViewLeftAncor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        
        addSubview(bubbleView)
        addSubview(textView)
        addSubview(helperImageView)
        
        helperImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        helperImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        helperImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        helperImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        bubbleViewRightAncor = bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        bubbleViewRightAncor?.isActive = true
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bubbleViewWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleViewWidthAnchor?.isActive = true
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        bubbleViewLeftAncor = bubbleView.leftAnchor.constraint(equalTo: helperImageView.rightAnchor, constant: 10)
        bubbleViewLeftAncor?.isActive = false
        
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
