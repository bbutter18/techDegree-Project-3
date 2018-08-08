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

//MARK: Properties


let roundsPerGame = 6
var score = 0
var questionsAsked = 0
var displayedEvents: [eventCreator] = []
let listOfEvents = groupOfEvents()



class ViewController: UIViewController {

    
//MARK: Outlets
    
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    
    
    @IBOutlet weak var DownFull: UIButton!
    @IBOutlet weak var UpHalf1: UIButton!
    @IBOutlet weak var DownHalf1: UIButton!
    @IBOutlet weak var UpHalf2: UIButton!
    @IBOutlet weak var DownHalf2: UIButton!
    @IBOutlet weak var UpFull: UIButton!
    
    
    @IBOutlet weak var NextRoundButton: UIButton!
    @IBOutlet weak var InstructionsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupGame()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if displayedEvents[0].date <= displayedEvents[1].date &&
            displayedEvents[1].date <= displayedEvents[2].date &&
            displayedEvents[2].date <= displayedEvents[3].date {
            
            score += 1
            
            NextRoundButton.setImage(UIImage(named: "next_round_success.png"), for: .normal)
        } else {
            NextRoundButton.setImage(UIImage(named: "next_round_fail.png"), for: .normal)
            
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
        
        if questionsAsked == roundsPerGame {
            
        } else {
            
            setupGame()
            
        }
    }
    
    func setupGame() {
        questionsAsked += 1
        //NextRoundButton.isHidden = true
        
        getEvents()
        setLabelText()
        
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
    
    
    
//MARK: Actions
    
    @IBAction func DownFull(_ sender: UIButton) {
        let L1 = Label1
        let L2 = Label2
        
        Label1 = L2
        Label2 = L1
        
        swap(&displayedEvents[0], &displayedEvents[1])
    }
    
    
    @IBAction func UpHalf1(_ sender: UIButton) {
        let L1 = Label1
        let L2 = Label2
        
        Label1 = L2
        Label2 = L1
        
        swap(&displayedEvents[1], &displayedEvents[0])
    }
    
    
    @IBAction func DownHalf1(_ sender: UIButton) {
        let L2 = Label2
        let L3 = Label3
        
        Label2 = L3
        Label3 = L2
        
        swap(&displayedEvents[1], &displayedEvents[2])
    }
    
    
    @IBAction func UpHalf2(_ sender: UIButton) {
        let L2 = Label2
        let L3 = Label3
        
        Label2 = L3
        Label3 = L2
        
        swap(&displayedEvents[2], &displayedEvents[1])
    }
    
    
    @IBAction func DownHalf2(_ sender: UIButton) {
        let L3 = Label3
        let L4 = Label4
        
        Label4 = L3
        Label3 = L4
        
        swap(&displayedEvents[2], &displayedEvents[3])
    }
    
    
    @IBAction func UpFull(_ sender: UIButton) {
        let L3 = Label3
        let L4 = Label4
        
        Label4 = L3
        Label3 = L4
        
        swap(&displayedEvents[3], &displayedEvents[2])
    }
    


} //END






