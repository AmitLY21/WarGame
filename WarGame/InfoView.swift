//
//  InfoView.swift
//  WarGame
//
//  Created by user216694 on 4/12/22.
//

import UIKit

class InfoView: UIViewController {
    //Adding option to enter player name and a general explantion of which weapon is stronger
    
    @IBOutlet weak var btnStartGame: UIButton!
    @IBOutlet weak var EditTextPlayer1: UITextField!
    @IBOutlet weak var EditTextPlayer2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startGame(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameView
        
        if EditTextPlayer1.text != nil{
            vc.player1text = EditTextPlayer1.text!
        }
           
        if EditTextPlayer1.text != nil{
            vc.player2text = EditTextPlayer2.text!
        }
        present(vc, animated: true)
    }

}
