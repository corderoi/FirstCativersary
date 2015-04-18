//
//  CardScene.swift
//  FirstCativersary
//
//  Created by Ian Cordero on 4/18/15.
//  Copyright (c) 2015 Ian Cordero. All rights reserved.
//

import SpriteKit

class CardScene: SKScene {
    
    // Variables
    
    override func didMoveToView(view: SKView)
    {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
 
        let card = SKSpriteNode(imageNamed: "card.png")
        card.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        card.setScale(0.7)
        self.addChild(card)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
    }
        

    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
}