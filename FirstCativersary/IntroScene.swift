//
//  IntroScene.swift
//  FirstCativersary
//
//  Created by Ian Cordero on 4/18/15.
//  Copyright (c) 2015 Ian Cordero. All rights reserved.
//

import SpriteKit

let Script = ["You are about to embark on a journey...",//[0]
                "...a dangerous one so far completed by none." //page turns
, "We set out to find...", "...the hidden One."//distant thunder and light rain
,"..."
, "All to answer a question.." //[5]
, "A legendary question passed through the generations..."
, "..."//thunder
, "Where..."
, "...is...."
, "...WALDO???????"]//THUNDERRRRR maybe [10]


class IntroScene: SKScene {
    
    // Variables
       var animatedText: [SKLabelNode] = []
       var touched = 1
       var currentText: SKLabelNode?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        //
        //self.addChild(myLabel)

     
        
        for i in 0..<11
        {
            let node = SKLabelNode(text: Script[i])
            node.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
            node.fontSize = 30
            node.fontColor = SKColor.whiteColor()
            //self.addChild(node)
            node.alpha = 0.0
            
            animatedText.append(node)
        }

        animatedText[0].alpha = 1.0
        self.addChild(animatedText[0])
        currentText = animatedText[0]
        
        self.runAction(SKAction.repeatActionForever(SKAction.playSoundFileNamed("rain.wav", waitForCompletion: true)))
        
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
        
        /*for touch in (touches as! Set<UITouch>)
        {
            let location = touch.locationInNode(self)
            if location = self.
        }*/
        if touched<11
        {
            let oldText = currentText!
            oldText.runAction(SKAction.fadeAlphaTo(0.0, duration: 1.0), completion: { oldText.removeFromParent() })
            self.addChild(animatedText[touched])
            animatedText[touched].runAction(SKAction.fadeAlphaTo(1.0, duration: 1.0))
            currentText = animatedText[touched]
            self.runAction(SKAction.playSoundFileNamed("page.wav", waitForCompletion: false))
            
            switch(touched)
            {
            case 10:
                self.runAction(SKAction.playSoundFileNamed("thunder.wav", waitForCompletion: false))
            default:
                break
            }
            
            touched++
        }
        else
        {
            if let myView = self.view as SKView!
            {
                let scene = CardScene()
                scene.size = myView.bounds.size
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFill
                
                myView.presentScene(scene, transition: SKTransition.fadeWithDuration(2.0))

            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}


