//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Matheus Matsumoto on 17/06/22.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var pairNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        pairNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.pairCardsNum = Int(pairNumberLabel.text ?? "4")
        }
    }
    
}

