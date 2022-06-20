//
//  GameViewController.swift
//  JogoDaMemoria
//
//  Created by Matheus Matsumoto on 17/06/22.
//

import UIKit

class GameViewController: UIViewController {

    var pairCardsNum:Int?
    
    var cardsArray : [UIImage] = [#imageLiteral(resourceName: "card_diamond_blue"), #imageLiteral(resourceName: "card_diamond_red"), #imageLiteral(resourceName: "card_diamond_purple"), #imageLiteral(resourceName: "card_heart"), #imageLiteral(resourceName: "card_heart_blue"), #imageLiteral(resourceName: "card_heart_purple"), #imageLiteral(resourceName: "card_star_yellow"), #imageLiteral(resourceName: "card_sun")]
    var currentCardsArr:[Card] = []
    var numbersArr: [Int] = []
    var imageViewArr : [UIImageView] = []
    var imageViewDict: [UIImageView:Card] = [:]
    var buttonsDict: [UIImageView: UIButton] = [:]
    
    @IBOutlet weak var cardOneImageView: UIImageView!
    @IBOutlet weak var cardTwoImageView: UIImageView!
    @IBOutlet weak var cardThreeImageView: UIImageView!
    @IBOutlet weak var cardFourImageView: UIImageView!
    @IBOutlet weak var cardFiveImageView: UIImageView!
    @IBOutlet weak var cardSixImageView: UIImageView!
    @IBOutlet weak var cardSevenImageView: UIImageView!
    @IBOutlet weak var cardEightImageView: UIImageView!
    @IBOutlet weak var cardNineImageView: UIImageView!
    @IBOutlet weak var cardTenImageView: UIImageView!
    @IBOutlet weak var cardElevenImageView: UIImageView!
    @IBOutlet weak var cardTwelveImageView: UIImageView!
    @IBOutlet weak var cardThirteenImageView: UIImageView!
    @IBOutlet weak var cardFourteenImageView: UIImageView!
    @IBOutlet weak var cardFifteenImageView: UIImageView!
    @IBOutlet weak var cardSixteenImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToImageViewArr()
        addCards()
        displayCards()
        createButtons()
    }
    
    func addCards(){
        
        // Add the cards to the currentCardsArr and add the numbers to numbersArr
        for i in 0..<pairCardsNum! {
            for _ in 0..<2 {
                numbersArr.append(i)
                currentCardsArr.append(Card(cardImage: cardsArray[i], selected: false))
            }
        }
        
        // Assign an random image
        
        for i in 0..<(pairCardsNum! * 2) {
            var selectedNum = numbersArr.randomElement()!
            while selectedNum == i {
                selectedNum = numbersArr.randomElement()!
            }
            imageViewDict[imageViewArr[i]] = currentCardsArr[selectedNum]
            
            let numIndex = numbersArr.firstIndex(of: selectedNum)
            numbersArr.remove(at: numIndex!)
        }
        
        
    }
    
    func addToImageViewArr() {
        imageViewArr.append(contentsOf: [cardOneImageView, cardTwoImageView, cardThreeImageView,
                                         cardFourImageView, cardFiveImageView, cardSixImageView,
                                         cardSevenImageView, cardEightImageView, cardNineImageView,
                                         cardTenImageView, cardElevenImageView, cardTwelveImageView,
                                         cardThirteenImageView, cardFourteenImageView, cardFifteenImageView, cardSixteenImageView])
    }
    
    func displayCards(){
        for (cardView, card) in imageViewDict {
            if card.selected == true {
                cardView.image = card.cardImage
            } else {
                cardView.image = card.back
            }
        }
    }
    
    func createButtons(){
        for (cardView, card) in imageViewDict{
            let xPos = Int(cardView.frame.origin.x)
            let yPos = Int(cardView.frame.origin.y)
            let width = Int(cardView.frame.width)
            let height = Int(cardView.frame.height)
            let button = UIButton(frame: CGRect(x: xPos, y: yPos, width: width, height: height))
            button.addTarget(self, action: #selector(cardPressed), for: .touchUpInside)
            buttonsDict[cardView] = button
            print("xPos : \(xPos) , yPos : \(yPos) , width : \(width) , height : \(height)")
        }
    }
    
    @objc func cardPressed(sender: UIButton!){
        print("Card Pressed!")
    }
    
    
    @IBAction func replayPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
