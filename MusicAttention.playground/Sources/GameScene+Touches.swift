//
//  GameScene+Touches.swift
//  CaioTeste
//
//  Created by Matheus Gomes Queiroz on 22/03/19.
//  Copyright © 2019 Silvia . All rights reserved.
//

import SpriteKit
import AVFoundation

public extension GameScene {
    
    //Detect the touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        var correctBackGround = [SKTexture]()
        var wrongBackGround = [SKTexture]()
        
        //Population correct vector of the animation
        correctBackGround.append(SKTexture(imageNamed: "green.png"))
        correctBackGround.append(SKTexture(imageNamed: "orange.png"))
        
        //Declaration of the correct animation
        let correctAnimation = SKAction.animate(with: correctBackGround, timePerFrame: 0.25)
        
        //Population wrong vector of the animation
        wrongBackGround.append(SKTexture(imageNamed: "red.png"))
        wrongBackGround.append(SKTexture(imageNamed: "orange.png"))
        
        //Declaration of the wrong animation
        let wrongAnimation = SKAction.animate(with: wrongBackGround, timePerFrame: 0.25)
        
        
        
        //Take the first touch
        let touch = touches.first
        //Touch in the screen position
        let positionInScene = touch?.location(in: self)
        // The knot is in that position now
        let touchedNode = self.atPoint(positionInScene!)
        
        
        if touchedNode.name == "playButton"{
            
            //Remove the playButton
            self.removePlayButton()
            
            //Remove the Title label
            self.removeTitleLabel()
            
            //Start Tutorial
            self.startTutorial()
        }
        
        //Left Button identificated
        if touchedNode.name == "left" {
            
            if isPresentingTutorialLeft {
                if let _ = action(forKey: "playerLeftAction") {
                    removeAction(forKey: "playerLeftAction")
                }
                
                //Remove the left label
                self.removeLeftLabel()
                
                //Add the right label
                self.addRightLabel()
                
                //Start the right song tutorial
                let wait = SKAction.wait(forDuration: 0.8)
                let playRight1 = SKAction.playSoundFileNamed("right1.mpeg", waitForCompletion: true)
                let playerRight2 = SKAction.playSoundFileNamed("right2.mpeg", waitForCompletion: true)
                let playerRightAction = SKAction.sequence([wait, playRight1, playerRight2])
                self.run(playerRightAction, withKey: "playerRightAction")
                
                self.isPresentingTutorialLeft = false
                
            } else {
                if(!isPresentingTutorialRight && !isPresentingTutorialLeft){
                    
                    //Sound Game Verification
                    for i in leftNotesInterval {
                        
                        if( timerS>=i.first && timerS<=i.second){
                            
                            //Right Animation
                            orangeBackGround.run(correctAnimation)
                            
                            //Add points
                            score+=100
                        }
                    }
                    
                    for i in rightNotesInterval{
                        if( timerS>=i.first && timerS<=i.second){
                            //Wrong animation
                            orangeBackGround.run(wrongAnimation)
                        }
                    }
                    if(timerS>20.0){
                        textLabelScore?.text = ("\(score)")
                        print(score)
                    }
                    
                }
            }
        }
        
        
        //Rigt Button identificated
        if touchedNode.name == "right"{
            
            if isPresentingTutorialRight {
                if let _ = action(forKey: "playerRightAction") {
                    self.removeAction(forKey: "playerRightAction")
                }
                
                removeRightLabel()
                removeSpeaker()
                removeTutorialLabel()
                isPresentingTutorialRight = false
                
                run(SKAction.wait(forDuration: 0.8), completion: {
                    self.startGame()
                })
                
            } else {
                if (!isPresentingTutorialLeft && !isPresentingTutorialRight) {
                    
                    //Sound verification
                    for i in rightNotesInterval {
                        
                        if( timerS >= i.first && timerS<=i.second){
                            
                            //Right Animation
                            orangeBackGround.run(correctAnimation)
                            
                            //Add points
                            score+=100
                        }
                    }
                    
                    for i in leftNotesInterval{
                        if( timerS>=i.first && timerS<=i.second){
                            //Wrong animation
                            orangeBackGround.run(wrongAnimation)
                        }
                    }
                    if(timerS>20.0){
                        textLabelScore?.text = ("\(score)")
                        print(score)
                    }
                }
            }
        }
    }
}

