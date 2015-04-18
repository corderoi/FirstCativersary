//
//  GameScene.swift
//  FirstCativersary
//
//  Created by Ian Cordero on 4/17/15.
//  Copyright (c) 2015 Ian Cordero. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Variables
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        //
        //self.addChild(myLabel)
        
        let questionDialogue = SKLabelNode(text: "Play?")
        questionDialogue.fontColor = SKColor.whiteColor()
        questionDialogue.fontSize = 65
        questionDialogue.verticalAlignmentMode = .Center
        questionDialogue.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) + 0.5*CGRectGetMidY(self.frame))
        self.addChild(questionDialogue)
        
        let playButton = SKSpriteNode(imageNamed: "play.png")
        playButton.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        playButton.setScale(0.25)
        playButton.name = "playButton"
        
        self.addChild(playButton)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        //for touch in (touches as! Set<UITouch>) {
        //    let location = touch.locationInNode(self)
        //    
        //    let sprite = SKSpriteNode(imageNamed:"Spaceship")
        //    
        //    sprite.xScale = 0.5
        //    sprite.yScale = 0.5
        //    sprite.position = location
        //    
        //    let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //    
        //    sprite.runAction(SKAction.repeatActionForever(action))
        //    
        //    self.addChild(sprite)
        //}
        
        for touch in (touches as! Set<UITouch>){
            let location = touch.locationInNode(self)
            
            if let check = self.childNodeWithName("playButton"){
                if check.containsPoint(location){
                    if let myView = self.view as SKView! {
                        let scene = IntroScene()
                        scene.size = myView.bounds.size
                        /* Set the scale mode to scale to fit the window */
                        scene.scaleMode = .AspectFill
                        
                        myView.presentScene(scene, transition: SKTransition.fadeWithDuration(2.0))
                    }
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
