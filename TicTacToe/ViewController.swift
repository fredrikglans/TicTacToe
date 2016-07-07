//
//  ViewController.swift
//  TicTacToe
//
//  Created by Glans on 2016-07-02.
//  Copyright © 2016 Glans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ticTacImg1: UIImageView!
    @IBOutlet var ticTacImg2: UIImageView!
    @IBOutlet var ticTacImg3: UIImageView!
    @IBOutlet var ticTacImg4: UIImageView!
    @IBOutlet var ticTacImg5: UIImageView!
    @IBOutlet var ticTacImg6: UIImageView!
    @IBOutlet var ticTacImg7: UIImageView!
    @IBOutlet var ticTacImg8: UIImageView!
    @IBOutlet var ticTacImg9: UIImageView!
    
    @IBOutlet var ticTacBtn1: UIButton!
    @IBOutlet var ticTacBtn2: UIButton!
    @IBOutlet var ticTacBtn3: UIButton!
    @IBOutlet var ticTacBtn4: UIButton!
    @IBOutlet var ticTacBtn5: UIButton!
    @IBOutlet var ticTacBtn6: UIButton!
    @IBOutlet var ticTacBtn7: UIButton!
    @IBOutlet var ticTacBtn8: UIButton!
    @IBOutlet var ticTacBtn9: UIButton!
    
    
    @IBOutlet var resetBtn: UIButton!
    @IBOutlet var userMessage: UILabel!
    
    var plays = Dictionary<Int,Int>()
    var done = false
    var aiDeciding = false
    
    
    @IBAction func UIButtonClicked(sender:UIButton){
        userMessage.hidden = true
        if plays[sender.tag] == nil && done == false && aiDeciding == false {
            setImageForSpot(sender.tag, player:1)
        }
        checkForWin()
        aiTurn()
    }
    
    @IBAction func UIResetButtonClicked(){
        ticTacImg1.hidden = true
        plays[1] = nil
        ticTacImg2.hidden = true
        plays[2] = nil
        ticTacImg3.hidden = true
        plays[3] = nil
        ticTacImg4.hidden = true
        plays[4] = nil
        ticTacImg5.hidden = true
        plays[5] = nil
        ticTacImg6.hidden = true
        plays[6] = nil
        ticTacImg7.hidden = true
        plays[7] = nil
        ticTacImg8.hidden = true
        plays[8] = nil
        ticTacImg9.hidden = true
        plays[9] = nil
        userMessage.hidden = true
        resetBtn.hidden = true
        done = false
    }
    
    func setImageForSpot(spot:Int,player:Int) {
        var playerMark = "x"
        if player == 1 {
            playerMark = "x"
        }
        else {
            playerMark = "o"
        }
        
        plays[spot] = player
        switch spot {
        case 1:
            ticTacImg1.image = UIImage(named:playerMark)
            ticTacImg1.hidden = false
        case 2:
            ticTacImg2.image = UIImage(named:playerMark)
            ticTacImg2.hidden = false
        case 3:
            ticTacImg3.image = UIImage(named:playerMark)
            ticTacImg3.hidden = false
        case 4:
            ticTacImg4.image = UIImage(named:playerMark)
            ticTacImg4.hidden = false
        case 5:
            ticTacImg5.image = UIImage(named:playerMark)
            ticTacImg5.hidden = false
        case 6:
            ticTacImg6.image = UIImage(named:playerMark)
            ticTacImg6.hidden = false
        case 7:
            ticTacImg7.image = UIImage(named:playerMark)
            ticTacImg7.hidden = false
        case 8:
            ticTacImg8.image = UIImage(named:playerMark)
            ticTacImg8.hidden = false
        case 9:
            ticTacImg9.image = UIImage(named:playerMark)
            ticTacImg9.hidden = false
        default:
            ticTacImg5.image = UIImage(named:playerMark)
            ticTacImg5.hidden = false
        }
        
    }
    
    
    func checkForWin() {
        if plays[1] == 1 && plays[5] == 1 && plays[9] == 1 {
            userMessage.hidden = false
            userMessage.text = "I won" //diag
            resetBtn.hidden = false
            done = true
        }
        else if plays[1] == 1 && plays[2] == 1 && plays[3] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
        else if plays[4] == 1 && plays[5] == 1 && plays[6] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
        else if plays[7] == 1 && plays[8] == 1 && plays[9] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
        else if plays[3] == 1 && plays[5] == 1 && plays[7] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
        else if plays[1] == 1 && plays[4] == 1 && plays[7] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
        else if plays[2] == 1 && plays[5] == 1 && plays[8] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
        else if plays[3] == 1 && plays[5] == 1 && plays[9] == 1 {
            userMessage.hidden = false
            resetBtn.hidden = false
            done = true
        }
    }
    
    func aiTurn() {
        if plays[5] == nil {
            setImageForSpot(5,player:0)
        }
        else {
            var aiPlay = arc4random_uniform(9)+1
            while aiPlay == 5 && plays[Int(aiPlay)] != nil {
                aiPlay = arc4random_uniform(9)+1
            }
            setImageForSpot(Int(aiPlay),player:0)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticTacImg1.hidden = true
        ticTacImg2.hidden = true
        ticTacImg3.hidden = true
        ticTacImg4.hidden = true
        ticTacImg5.hidden = true
        ticTacImg6.hidden = true
        ticTacImg7.hidden = true
        ticTacImg8.hidden = true
        ticTacImg9.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

