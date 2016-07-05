//
//  CustomCell.swift
//  table
//
//  Created by macbook on 04.07.16.
//  Copyright © 2016 macbook. All rights reserved.
//

import Foundation
import UIKit
class CustomCollectionViewCell: UICollectionViewCell {
    
    var isHeightCalculated: Bool=false
    
    var smthImage = UIImageView()
    var smthTextLabel = UILabel()
    var smthViewFirst = UILabel()
    var smthViewSecond = UILabel()
    var smthViewThird = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        
        smthImage.translatesAutoresizingMaskIntoConstraints = false
        smthImage.layer.borderWidth = 1
        smthImage.layer.masksToBounds = false
        smthImage.backgroundColor=UIColor.greenColor()
        smthImage.layer.borderColor = UIColor.blackColor().CGColor
        smthImage.layer.cornerRadius = 45
        smthImage.clipsToBounds=true
        
        smthTextLabel.translatesAutoresizingMaskIntoConstraints=false
        smthTextLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        smthTextLabel.sizeToFit()
        smthTextLabel.numberOfLines=6
        
        smthViewFirst.backgroundColor=UIColor.lightGrayColor()
        smthViewFirst.translatesAutoresizingMaskIntoConstraints=false
        
        smthViewSecond.backgroundColor=UIColor.yellowColor()
        smthViewSecond.translatesAutoresizingMaskIntoConstraints=false
        
        smthViewThird.backgroundColor=UIColor.orangeColor()
        smthViewThird.translatesAutoresizingMaskIntoConstraints=false
        
        contentView.addSubview(smthImage)
        contentView.addSubview(smthTextLabel)
        contentView.addSubview(smthViewFirst)
        contentView.addSubview(smthViewSecond)
        contentView.addSubview(smthViewThird)

        
        NSLayoutConstraint.activateConstraints([
            smthImage.topAnchor.constraintEqualToAnchor(contentView.topAnchor),
            smthImage.leftAnchor.constraintEqualToAnchor(contentView.leftAnchor),
            smthImage.widthAnchor.constraintEqualToConstant(90),
            smthImage.heightAnchor.constraintEqualToConstant(90),
            
            smthTextLabel.topAnchor.constraintEqualToAnchor(contentView.topAnchor),
            smthTextLabel.leftAnchor.constraintEqualToAnchor(smthImage.rightAnchor, constant: 20),
            smthTextLabel.rightAnchor.constraintEqualToAnchor(contentView.rightAnchor),
            smthTextLabel.heightAnchor.constraintLessThanOrEqualToAnchor(contentView.heightAnchor, multiplier: 0.7),
            
            smthViewFirst.topAnchor.constraintEqualToAnchor(smthTextLabel.bottomAnchor, constant: 5),
            smthViewFirst.leftAnchor.constraintEqualToAnchor(smthImage.rightAnchor, constant: 5),
            smthViewFirst.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor),
            smthViewFirst.widthAnchor.constraintEqualToAnchor(smthTextLabel.widthAnchor, multiplier: 0.3),
            smthTextLabel.heightAnchor.constraintGreaterThanOrEqualToConstant(30),
            
            smthViewSecond.topAnchor.constraintEqualToAnchor(smthTextLabel.bottomAnchor, constant: 5),
            smthViewSecond.leftAnchor.constraintEqualToAnchor(smthViewFirst.rightAnchor, constant: 5),
            smthViewSecond.rightAnchor.constraintEqualToAnchor(smthViewThird.leftAnchor, constant: -5),
            smthViewSecond.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor),
            smthTextLabel.heightAnchor.constraintGreaterThanOrEqualToConstant(30),

            
            smthViewThird.topAnchor.constraintEqualToAnchor(smthTextLabel.bottomAnchor, constant: 5),
            smthViewThird.rightAnchor.constraintEqualToAnchor(contentView.rightAnchor, constant: -5),
            smthViewThird.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor),
            smthViewThird.widthAnchor.constraintEqualToAnchor(smthTextLabel.widthAnchor, multiplier: 0.3),
            smthTextLabel.heightAnchor.constraintGreaterThanOrEqualToConstant(30),

            contentView.heightAnchor.constraintGreaterThanOrEqualToAnchor(smthTextLabel.heightAnchor, multiplier: 1.3),
            contentView.heightAnchor.constraintGreaterThanOrEqualToConstant(90),
            
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        if !isHeightCalculated {
            setNeedsLayout()
            layoutIfNeeded()
            let size = contentView.systemLayoutSizeFittingSize(layoutAttributes.size)
            var newFrame = layoutAttributes.frame
            newFrame.size.width = CGFloat(ceilf(Float(size.width)))
            layoutAttributes.frame = newFrame
            isHeightCalculated = true
        }
        return layoutAttributes
    }
    
}