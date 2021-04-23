//
//  GameScene5.swift
//  BookCore
//
//  Created by Gabriel Puppi on 16/04/21.
//

import Foundation
import SpriteKit
import SpriteKit



public class GameScene5: SKScene {
   
    
    
    var lastSceneText: SKSpriteNode!
    
    
    var lastSceneBackGround: SKSpriteNode!
  


   
   

   
    
    
    

    override public func didMove(to view: SKView) {
        
        lastSceneText = (childNode(withName: "lastSceneText") as! SKSpriteNode)
        lastSceneBackGround = (childNode(withName: "lastSceneBackground") as! SKSpriteNode)
        
     
        
        
        
        
        
        setupLastScene()
      
   
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    }


    
    
    
    func setupLastScene() {
        
        
       
        
        lastSceneText.alpha = 0

        
    
        let lastScene2Texture = SKTexture(imageNamed: "lastSceneText2")
        let lastScene3Texture = SKTexture(imageNamed: "lastSceneText3")
        let lastScene4Texture = SKTexture(imageNamed: "lastSceneText4")
        
        
        
        
        
        
        let lastInterval = SKAction.wait(forDuration: 0.5)
        let lastFadeIn = SKAction.fadeIn(withDuration: 0.5)
        let lastFadeOut = SKAction.fadeOut(withDuration: 0.5)
        let lastChange1 = SKAction.animate(with: [lastScene2Texture], timePerFrame: 0)
        let lastChange2 = SKAction.animate(with: [lastScene3Texture], timePerFrame: 0)
        let lastChange3 = SKAction.animate(with: [lastScene4Texture], timePerFrame: 0)
        let midInterval = SKAction.wait(forDuration: 5)
        
        
        
        let lastSequence = SKAction.sequence([lastInterval,lastFadeIn,midInterval,lastFadeOut,lastChange1,lastFadeIn, midInterval, lastFadeOut, lastChange2, lastFadeIn, midInterval, lastFadeOut,lastChange3,lastFadeIn])
        
        
        
        lastSceneText.run(lastSequence)
        
        
        
        
        
        
        
    
    
    
    
   
        
        
        
        
        
        
        
        
        
        
        
        
        
    }



   



@objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }







    func touchDown(atPoint pos : CGPoint) {

       
        





    }

    func touchMoved(toPoint pos : CGPoint) {

    }

    func touchUp(atPoint pos : CGPoint) {

    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
  }
}


