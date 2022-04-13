//
//  ViewController.swift
//  WarGame
//
//  Created by user216694 on 4/12/22.
//

import UIKit

class GameView: UIViewController {
    
    @IBOutlet weak var CardsPlayer2: UIImageView!
    @IBOutlet weak var CardsPlayer1: UIImageView!
    @IBOutlet weak var imgPlayer1: UIImageView!
    @IBOutlet weak var imgPlayer2: UIImageView!
    
    @IBOutlet weak var Player2Name: UILabel!
    @IBOutlet weak var Player1Name: UILabel!
    
    var player1text: String = "Player 1"
    var player2text: String = "Player 2"
    
    @IBOutlet weak var ScorePlayer1: UILabel!
    @IBOutlet weak var ScorePlayer2: UILabel!
    var score1 : Int = 0;
    var score2 : Int = 0;

    @IBOutlet weak var lbl_winner: UILabel!
    @IBOutlet weak var numOfRounds: UILabel!
    
    let cards = [#imageLiteral(resourceName: "knuckles"), #imageLiteral(resourceName: "flail"), #imageLiteral(resourceName: "hands")  , #imageLiteral(resourceName: "smoke") , #imageLiteral(resourceName: "katana"), #imageLiteral(resourceName: "sais") , #imageLiteral(resourceName: "quiver") , #imageLiteral(resourceName: "dagger") , #imageLiteral(resourceName: "spike")  , #imageLiteral(resourceName: "shuriken") ]
    var timer = Timer();
    var gameCounter: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if player1text.isEmpty{
            Player1Name.text = "Player 1"
        }else{
            Player1Name.text = player1text
        }
        
        if player2text.isEmpty{
            Player2Name.text = "Player 2"
        }else{
            Player2Name.text = player2text
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 2,repeats: true , block: {_ in
            self.playGame();
            self.gameCounter += 1
            self.numOfRounds.text = "Number Of Rounds: \(self.gameCounter)/20"
            
            if self.gameCounter == 20{
                self.timer.invalidate();
                self.checkFinalWinner();
            }
        })
        
        
        
    }
    /**
     check who is the winner
     */
    func checkFinalWinner(){
        if score1 > score2{
            lbl_winner.text = "<- Winner"
        }else if score1 < score2{
            lbl_winner.text = "Winner ->"
        }else{
            lbl_winner.text = "<- TIE ->"
        }
    }
    /**
     Game behavior
     */
    func playGame(){
        CardsPlayer1.image = cards.randomElement()
        CardsPlayer2.image = cards.randomElement()
        let index1 : Int = cards.firstIndex(of:CardsPlayer1.image!)!
        let index2 : Int = cards.firstIndex(of:CardsPlayer2.image!)!
        checkWinner(index1,index2);
        
        
    }
    /**
     Check current round winner!
     */
    func checkWinner(_ index1 : Int , _ index2 : Int){
        if index1 < index2 {
            score2+=1
            ScorePlayer2.text = "Score: \(score2)"
            lbl_winner.text = "Player 2 Won!"
        }else if index1 > index2{
            score1+=1
            ScorePlayer1.text = "Score: \(score1)"
            lbl_winner.text = "Player 1 Won!"

        }else{
            score1+=1
            score2+=1
            ScorePlayer1.text = "Score: \(score1)"
            ScorePlayer2.text = "Score: \(score2)"
            lbl_winner.text = "TIE!"

        }
    }

}

	
