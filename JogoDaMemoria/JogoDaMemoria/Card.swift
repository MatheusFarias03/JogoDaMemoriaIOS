//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Matheus Matsumoto on 17/06/22.
//

import Foundation
import UIKit

class Card {
    
    var cardImage:UIImageView
    var selected:Bool
    
    init(cardImage:UIImageView, selected:Bool) {
        self.cardImage = cardImage
        self.selected = selected
    }
    
}
