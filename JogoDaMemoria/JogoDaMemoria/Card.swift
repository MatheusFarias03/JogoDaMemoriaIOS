//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Matheus Matsumoto on 17/06/22.
//

import Foundation
import UIKit

class Card {
    
    var cardImage:UIImage
    var selected:Bool
    var back:UIImage = #imageLiteral(resourceName: "card_back")
    
    init(cardImage:UIImage, selected:Bool) {
        self.cardImage = cardImage
        self.selected = selected
    }
}
