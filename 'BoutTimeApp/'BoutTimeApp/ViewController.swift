//
//  ViewController.swift
//  'BoutTimeApp
//
//  Created by Woodchuck on 8/8/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//

import UIKit
import GameKit
import CoreFoundation


class ViewController: UIViewController {

//MARK: Properties
    
    let roundsPerGame = 6
    var score = 0
    var questionsAsked = 0
    var displayedEvents: [eventCreator] = []
    let listOfEvents = groupOfEvents()
    var timeToAnswer = 60
    var timer = Timer()
    
    
//MARK: Outlets
    
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    
    @IBOutlet weak var downFull: UIButton!
    @IBOutlet weak var upHalfer1: UIButton!
    
    @IBOutlet weak var downHalfer1: UIButton!
    @IBOutlet weak var upHalfer2: UIButton!
    
    @IBOutlet weak var downHalfer2: UIButton!
    @IBOutlet weak var upFull: UIButton!
    
    @IBOutlet weak var NextRoundButton: UIButton!
    @IBOutlet weak var InstructionsLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var scoreStatement: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NextRoundButton.isHidden = true
        setupGame()
        
    }


    
//MARK: Setup Game
    
    
    func getEvents() {
        while displayedEvents.count < 4 {
            var theEvent = listOfEvents.getRandomEvent()
            
            if displayedEvents.contains(theEvent) {
                
                while displayedEvents.contains(theEvent) {
                    theEvent = listOfEvents.getRandomEvent()
                    
                }
            }
            
            displayedEvents.append(theEvent)
        }
        
    }
    
    func checkAnswer() {
        timeLabel.isHidden = true
        timer.invalidate()
        
        if displayedEvents[0].date <= displayedEvents[1].date &&
            displayedEvents[1].date <= displayedEvents[2].date &&
            displayedEvents[2].date <= displayedEvents[3].date {
            
            score += 1
            
            NextRoundButton.setBackgroundImage(UIImage(named: "next_round_success.png"), for: .normal)
        } else {
            NextRoundButton.setBackgroundImage(UIImage(named: "next_round_fail.png"), for: .normal)
            
        }
        
        NextRoundButton.isHidden = false
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            checkAnswer()
            
            loadNextRound(delay: 2)
        }
    }
    
    
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    
//MARK: Game Logic
    
    func nextRound() {
        displayedEvents.removeAll()
        timeToAnswer = 60
        
        if questionsAsked == roundsPerGame {
            gameOver()
        } else {
            setupGame()
        }
    }
    
    func setupGame() {
        questionsAsked += 1
        NextRoundButton.isHidden = true
        InstructionsLabel.isHidden = false
        timeLabel.isHidden = false
        timeLabel.text = "0:60"
        
        playAgain.isHidden = true
        scoreStatement.isHidden = true
        finalScore.isHidden = true
        
        getEvents()
        setLabelText()
        startTimer()
        
    }
    
    func gameOver() {
        hideAllLabelsAndButtons()
        
        NextRoundButton.isHidden = true
        InstructionsLabel.isHidden = true
        timeLabel.isHidden = true
        
        scoreStatement.isHidden = false
        finalScore.isHidden = false
        playAgain.isHidden = false
        
        finalScore.text = "\(score)/6"
    }

//MARK: Timer Logic
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeToAnswer -= 1
        
        if timeToAnswer >= 10 {
            timeLabel.text = "0:\(timeToAnswer)"
        } else if timeToAnswer < 10 {
            timeLabel.text = "0:0\(timeToAnswer)"
        }
        
        if timeToAnswer <= 0 {
            timer.invalidate()
            checkAnswer()
            loadNextRound(delay: 2)
        }
    }
    
    
//MARK: Setup Labels and Game Buttons
    
    func setLabel1() {
        Label1.text = displayedEvents[0].event
        
    }
    
    func setLabel2() {
        Label2.text = displayedEvents[1].event
    }
    
    func setLabel3() {
        Label3.text = displayedEvents[2].event
    }
    
    func setLabel4() {
        Label4.text = displayedEvents[3].event
    }
    
    
    func setLabelText() {
        
        Label1.text = displayedEvents[0].event
        Label2.text = displayedEvents[1].event
        Label3.text = displayedEvents[2].event
        Label4.text = displayedEvents[3].event
        
    }
    
    func hideAllLabelsAndButtons() {
        Label1.isHidden = true
        Label2.isHidden = true
        Label3.isHidden = true
        Label4.isHidden = true
        
        downFull.isHidden = true
        downHalfer1.isHidden = true
        upHalfer1.isHidden = true
        downHalfer2.isHidden = true
        upHalfer2.isHidden = true
        upFull.isHidden = true
    }
    
    func unHideAllLabelsAndButtons() {
        Label1.isHidden = false
        Label2.isHidden = false
        Label3.isHidden = false
        Label4.isHidden = false
        
        downFull.isHidden = false
        downHalfer1.isHidden = false
        upHalfer1.isHidden = false
        downHalfer2.isHidden = false
        upHalfer2.isHidden = false
        upFull.isHidden = false
    }
    
    
//MARK: Actions
    
    
    @IBAction func downFull(_ sender: UIButton) {
        
       displayedEvents.swapAt(0, 1)
        
        //downFull.setImage(UIImage(named: "down_full_selected.png"), for: .selected)
        setLabel1()
        setLabel2()
    }
    
    @IBAction func upHalf1(_ sender: UIButton) {
       displayedEvents.swapAt(1, 0)
        
        setLabel1()
        setLabel2()
    }
    
    
    @IBAction func downHalf1(_ sender: UIButton) {
        
        displayedEvents.swapAt(1, 2)
     
        setLabel2()
        setLabel3()
    }
    
    @IBAction func upHalf2(_ sender: UIButton) {
        
        displayedEvents.swapAt(2, 1)
        
        setLabel2()
        setLabel3()
    }
    
    @IBAction func upDown2(_ sender: UIButton) {
        
        displayedEvents.swapAt(2, 3)
        
        setLabel3()
        setLabel4()
    }
    
    @IBAction func upFull(_ sender: UIButton) {
        
        displayedEvents.swapAt(3, 2)
        
        setLabel3()
        setLabel4()
    }
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        score = 0
        questionsAsked = 0
        timeToAnswer = 60
        displayedEvents.removeAll()
        unHideAllLabelsAndButtons()
        
        setupGame()
    }
    
    
    
    
    
    

        
    
    
    
    

       
    
    
    
        
        
    
    
    
    
       
    
    


} //END






