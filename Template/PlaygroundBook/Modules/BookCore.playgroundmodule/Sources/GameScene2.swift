//
//  GameScene2.swift
//  BookCore
//
//  Created by Gabriel Puppi on 13/04/21.
//

import Foundation
import SpriteKit

public class GameScene2: SKScene {
    
    public var completion: (()->())?
    
    var firstText: SKLabelNode!
    var closedEye1: SKSpriteNode!
    var buttonWake: SKSpriteNode!
    
   override public func didMove(to view: SKView) {
        
        firstText = (childNode(withName: "text1") as! SKLabelNode)
        closedEye1 = (childNode(withName: "closedEye1") as! SKSpriteNode)
        buttonWake = (childNode(withName: "buttonWake") as! SKSpriteNode)
        
        
        closedEye1.alpha = 0
    
        buttonWake.alpha = 0
        
        setupGameBegin()
    
        
    let cfURL = Bundle.main.url(forResource: "SourceCodePro-Regular", withExtension: "ttf")! as CFURL
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
    
    
    firstText.fontName = "SourceCodePro-Regular"
        
        

    
    
    
    }

    
    
    
    
    func setupGameBegin() {
        
        // Colocar na cena e animar o texto inicial
     
      
         
         let typeInterval = SKAction.wait(forDuration: 0.07)
         
         let (nextChar, totalCount) = TypeWriter().createAction(for: firstText)
         
         firstText.text = ""
         
         let typeSequence = SKAction.sequence([typeInterval, nextChar])
         
         firstText.run(.sequence([.wait(forDuration: 0.3),.repeat(typeSequence, count: totalCount)]))
         
         
        
     
         
        
         
          //Criar o fade in para o olho e o botão
         
         let assetsFadeIn = SKAction.fadeIn(withDuration: 0.5)

         let assetsInterval = SKAction.wait(forDuration: 0.5)
        
         let eyeInterval = SKAction.wait(forDuration: 0.33)

         let assetsSequence = SKAction.sequence([assetsFadeIn,assetsInterval])

         let closedEye1Texture = SKTexture(imageNamed: "closedEye1")

         closedEye1.texture = closedEye1Texture
         
         
          //Textura e animacao para os olhos fechados
         
         
         
         let closedEye2Texture = SKTexture(imageNamed: "closedEye2")
         let changeClosedEye = SKAction.animate(with: [closedEye2Texture], timePerFrame: 0)
         let backToEye1 = SKAction.animate(with: [closedEye1Texture], timePerFrame: 0)
        
        
        
         buttonWake.run(assetsSequence)
     
         closedEye1.run(assetsSequence)
        
         closedEye1.run(.repeatForever(.sequence([eyeInterval,backToEye1,eyeInterval,changeClosedEye])))
        
         
         
         
         
         
 //        // Textura e animacao para olhos semiabertos
 //        let semiOpenedEye1Texture = SKTexture(imageNamed: "semiClosedEye1")
 //        let changeToSemi1 = SKAction.animate(with: [semiOpenedEye1Texture], timePerFrame: 0)
 //
 //        let semiOpenedEye2Texture = SKTexture(imageNamed: "semiOpenedEye2")
 //        let changeToSemi2 = SKAction.animate(with:[semiOpenedEye2Texture], timePerFrame: 0)
 //
         
         
         
         
         
         
         // Assignar as imagens aos olhos
         
         
         
         
         
         
         
         
         
         
         
         
         
       
        
    }


   



    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }







    func touchDown(atPoint pos : CGPoint) {
        
        if  buttonWake.contains(pos) {

            self.completion?()

         }

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







    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


