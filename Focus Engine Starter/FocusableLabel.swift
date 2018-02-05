//
//  FocusableLabel.swift
//  Focus Engine Starter
//
//  Created by Marcos Morais on 05/02/2018.
//  Copyright © 2018 Marcos Morais. All rights reserved.
//

import UIKit

class FocusableLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let focusedColor: UIColor = UIColor.white
    let unfocusedColor: UIColor = UIColor.black
    
    override var canBecomeFocused: Bool {
        return true
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        print(#function, coordinator)

        if context.nextFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                self.applyCustomShadow(with: 0.5, and: CGSize(width: 0, height: 5))
                self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            }, completion: nil)
        }
        else if context.previouslyFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                self.rollbackCustomShadow()
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
        
    }
    
    // MARK: Shadowing Effect Methods
    
    func applyCustomShadow(with opacity: Float, and offset: CGSize) {
        
        self.textColor = focusedColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 20
        self.layer.shadowOffset = offset
        
    }
    
    func rollbackCustomShadow() {
        self.textColor = unfocusedColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = UIColor.clear.cgColor
    }

}
