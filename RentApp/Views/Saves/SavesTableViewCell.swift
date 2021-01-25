//
//  SaveTableViewCell.swift
//  RentApp
//
//  Created by Тагир Ракипов on 09.01.2021.
//

import UIKit

class SaveTableViewCell: UITableViewCell {
    
    var apart: Apartment? {
        didSet {
            guard let apartItem = apart else {return}
            
            if let name = apartItem.pictureIndex {
                apartImageView.image = UIImage(named: name)
            }
            
            priceLabel.text = "\(apartItem.price)"
            detailsLabel.text = "\(apartItem.address), \(apartItem.country)\nКомнаты: \(apartItem.rooms)\nПлощадь: \(apartItem.square)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(apartImageView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(detailsLabel)
        self.contentView.addSubview(containerView)
        
        pinImageView()
        pinContainerView()
        pinDetailsView()
        pinPriceView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let priceLabel: UILabel = getPriceLabel()
    let apartImageView: UIImageView = getImageView()
    let detailsLabel: UILabel = getDetailsView()
    let containerView: UIView = getContainerView()
}

// MARK: - Constraints

extension SaveTableViewCell {
    func pinImageView() {
        apartImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        apartImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(apartImageViewLeadingConstraint)).isActive = true
        apartImageView.widthAnchor.constraint(equalToConstant: CGFloat(apartImageViewWidthConstraint)).isActive = true
        apartImageView.heightAnchor.constraint(equalToConstant: CGFloat(apartImageViewHeightConstraint)).isActive = true
    }
    
    func pinContainerView() {
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.apartImageView.trailingAnchor, constant:CGFloat(containerViewLeadingConstraint)).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:CGFloat(containerViewTrailingConstraint)).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: CGFloat(containerViewHeightConstraint)).isActive = true
    }
    
    func pinDetailsView() {
        detailsLabel.topAnchor.constraint(equalTo:self.priceLabel.bottomAnchor).isActive = true
        detailsLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        detailsLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
    func pinPriceView() {
        priceLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
}

// MARK: - Labels

func getPriceLabel() -> UILabel {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func getImageView() -> UIImageView{
    let img = UIImageView()
    img.contentMode = .scaleAspectFill
    img.translatesAutoresizingMaskIntoConstraints = false
    img.clipsToBounds = true
    return img
}

func getDetailsView() -> UILabel {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.clipsToBounds = true
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
}

func getContainerView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    return view
}

// MARK: - Constants

let priceLabelFontSize = 20

let detailsLabelFontSize = 14

let apartImageViewWidthConstraint = 160
let apartImageViewHeightConstraint = 90
let apartImageViewLeadingConstraint = 10

let containerViewHeightConstraint = apartImageViewHeightConstraint
let containerViewLeadingConstraint = 10
let containerViewTrailingConstraint = -10
