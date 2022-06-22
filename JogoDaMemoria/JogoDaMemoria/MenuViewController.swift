//
//  ViewController.swift
//  JogoDaMemoriaVersion2
//
//  Created by Matheus Matsumoto on 20/06/22.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        numberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.cardsNum = Int(numberLabel.text!)
        }
    }
}

