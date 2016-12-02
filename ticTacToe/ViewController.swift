//
//  ViewController.swift
//  ticTacToe
//
//  Created by Mackenzie Wacker on 12/1/16.
//  Copyright © 2016 Mackenzie Wacker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for element in self.buttonOutletCollection {
            element.backgroundColor = self.UIColorFromRGB(0x61E9E7)
        }
        self.winnerLabel.isHidden = true
    }
    //OVERRIDE DEFAULT
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MY WORK
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet var buttonOutletCollection: [UIButton]!
    
    @IBOutlet weak var winnerLabel: UILabel!

    var playerOne: [Int] = [Int]()
    var playerTwo: [Int] = [Int]()
    var winningCombos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9]]

    
    var turnCount: Int = 2
 
    @IBAction func anyButtonPressedFunction(_ sender: UIButton) {
        print(sender.tag)
        
        //PLAYER ONE
        if self.turnCount % 2 == 0 {
            
            sender.backgroundColor = self.UIColorFromRGB(0xE5287F)
            sender.isEnabled = false
            playerOne.append(sender.tag)
            
            //if playerOne.count == 5  then tie game. else do as follows:
            
            outerloop: for i in 0...6 {
              var winningCount: Int = 0
                innerloop: for j in 0...2 {
                    if playerOne.contains(winningCombos[i][j]) {
                        winningCount += 1
                        print("*****\(winningCount)*****")
                        if winningCount == 3 {
                            //WINNER!
                            self.winnerLabel.text = "Player One Wins!!!"
                            self.winnerLabel.isHidden = false
                            for button in self.buttonOutletCollection {
                                button.isEnabled = false
                            }
                        }
                    }
                    else {
                        break innerloop
                    }
                }
            }
            
            turnCount += 1
            print(playerOne)
        }
        //PLAYER TWO
        else {
            
            sender.backgroundColor = self.UIColorFromRGB(0xFFDB46)
            sender.isEnabled = false
            playerTwo.append(sender.tag)

            outerloop: for i in 0...6 {
                var winningCount: Int = 0
                innerloop: for j in 0...2 {
                    if playerTwo.contains(winningCombos[i][j]) {
                        winningCount += 1
                        if winningCount == 3 {
                            //WINNER!
                            self.winnerLabel.text = "Player Two Wins!!!"
                            self.winnerLabel.isHidden = false
                            for button in self.buttonOutletCollection {
                                button.isEnabled = false
                            }
                        }
                    }
                    else {
                        break innerloop
                    }
                }
            }
            
            turnCount += 1
            print(playerTwo)
        }
        
    }
    
    
    //WINNING FUNCTION ... ?
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    
    //RESET FUNCTION
    func reset() {
        for element in self.buttonOutletCollection {
            element.backgroundColor = self.UIColorFromRGB(0x61E9E7)
            element.isEnabled = true
        }
        self.winnerLabel.isHidden = true
        self.turnCount = 2
        self.playerOne = []
        self.playerTwo = []
    }
    
    
    // HELPER FUNCTION to set colors with Hex values
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
        )
    }
}























