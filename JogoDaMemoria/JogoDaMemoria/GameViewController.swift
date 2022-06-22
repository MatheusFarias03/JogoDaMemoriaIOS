//
//  GameViewController.swift
//  JogoDaMemoriaVersion2
//
//  Created by Matheus Matsumoto on 20/06/22.
//

import UIKit

let screenSize = UIScreen.main.bounds
let screenHeight = Int(screenSize.height)
let screenWidth = Int(screenSize.width)

class GameViewController: UIViewController {

    var cardsNum: Int?
    var cardsArr: [UIImage] = [#imageLiteral(resourceName: "card_heart"), #imageLiteral(resourceName: "card_heart_blue"), #imageLiteral(resourceName: "card_heart_purple"), #imageLiteral(resourceName: "card_diamond_red"), #imageLiteral(resourceName: "card_diamond_blue"), #imageLiteral(resourceName: "card_diamond_purple"), #imageLiteral(resourceName: "card_star_yellow"), #imageLiteral(resourceName: "card_sun")]
    var numberArr: [Int] = []
    var buttonsArr: [UIButton] = []
    var buttonCardDict: [UIButton : Card] = [:]
    
    // Variables for game logic
    var selectionCount: Int = 0
    var firstCard: UIButton?
    var secondCard: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createCardButtons()
        addCards()
    }
    
    func createCardButtons(){
        
        let margin = Int(screenWidth/46)
        var xPos = Int(screenWidth/20)
        var yPos = Int(screenHeight/20)
        let size = Int(screenWidth/5)
        let cardBack = #imageLiteral(resourceName: "card_back")

        for _ in 0..<cardsNum! {
            // Checks if the position is possible
            if xPos >= Int(screenWidth - size) {
                xPos = Int(screenWidth/20)
                yPos += size + margin
            }
            // Creates button
            let button = UIButton(frame: CGRect(x: xPos, y: yPos, width: size, height: size))
            button.addTarget(self, action: #selector(cardPressed), for: .touchUpInside)
            button.setImage(cardBack, for: .normal)
            view.addSubview(button)
            
            buttonsArr.append(button)
            
            xPos += size + margin
        }
    }
    
    @objc func cardPressed(_ sender: UIButton){
        
        sender.setImage(buttonCardDict[sender]?.cardImage, for: .normal)
        selectionCount += 1
        
        if selectionCount == 1 {
            
            firstCard = sender
            
        } else if selectionCount == 2 {
            
            secondCard = sender
            
            var areEqual: Bool = false
            if buttonCardDict[firstCard!]?.cardImage == buttonCardDict[secondCard!]?.cardImage {
                areEqual = true
            }
            
            if areEqual == false {
                
                let secondsDelay = 0.1
                DispatchQueue.main.asyncAfter(deadline: .now() + secondsDelay) { [self] in
                    
                    sleep(2)
                    buttonCardDict[firstCard!]?.selected = false
                    firstCard?.setImage(#imageLiteral(resourceName: "card_back"), for: .normal)
                    buttonCardDict[secondCard!]?.selected = false
                    secondCard?.setImage(#imageLiteral(resourceName: "card_back"), for: .normal)
                    
                }
            }
            
            selectionCount = 0
            
        }
        
    }
    
    func addCards() {
        // Adds numbers to the array
        for i in 0..<(cardsNum!/2){
            for _ in 0..<2{
                numberArr.append(i)
            }
        }
        for i in 0..<cardsNum! {
            // Generate random number
            var selectedNum = numberArr.randomElement()!
            while selectedNum == i {
                selectedNum = numberArr.randomElement()!
            }
            // Adds element and key to the dictionary
            buttonCardDict[buttonsArr[i]] = Card(cardImage: cardsArr[selectedNum], selected: false)
            let numIndex = numberArr.firstIndex(of: selectedNum)
            numberArr.remove(at: numIndex!)
        }
    }
    
    @IBAction func replayButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
