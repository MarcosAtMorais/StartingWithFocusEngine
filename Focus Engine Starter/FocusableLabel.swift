//
//  FocusableLabel.swift
//  Focus Engine Starter
//
//  Created by Marcos Morais on 05/02/2018.
//  Copyright © 2018 Marcos Morais. All rights reserved.
//

import UIKit

class FocusableLabel: UILabel {
    
    /// Cor da label quando o foco é aplicado
    let focusedColor: UIColor = UIColor.white
    /// Cor da label quando o foco é retirado
    let unfocusedColor: UIColor = UIColor.black
    
    /**
     Propriedade que deve ser true para poder ganhar foco
     - Precondition: userInteractionEnabled deve estar como true!
     */
    override var canBecomeFocused: Bool {
        return true
    }
    
    
    /**
     Método chamado quando a Focus Engine é atualizada. São parametrizados o contexto do foco e o Animation Coordinator.
     */
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        print(#function, coordinator)

        if context.nextFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                self.applyCustomShadow(with: 0.5, and: CGSize(width: 0, height: 5))
            }, completion: nil)
        }
        else if context.previouslyFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                self.rollbackCustomShadow()
            }, completion: nil)
        }
        
    }
    
    // MARK: Shadowing Effect Methods
    /**
     Método para aplicação de sombra no momento em que a UIView ganha o foco.
     - parameters:
     - opacity: Opacidade da sombre projetada.
     - offset: Medida em CGSize da diferença da sombra em relação ao conteúdo.
     - Requires: iOS 6.0 ou superior
     - Precondition: Opacity e Offset não podem ser nil. focusedColor deve ser uma cor válida.
     */
    func applyCustomShadow(with opacity: Float, and offset: CGSize) {
        
        self.textColor = focusedColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 20
        self.layer.shadowOffset = offset
        
        // Animação de scale para simular o efeito de ganho de foco.
        self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        
    }
    
    /**
     Método para reconfigurar a sombra da UIView.
     - Precondition: o textColor não pode ser nil.
     - Note: As propriedades da layer podem ser animadas.
     */
    func rollbackCustomShadow() {
        self.textColor = unfocusedColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = UIColor.clear.cgColor
        // Animação de perda de foco.
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
    }

}
