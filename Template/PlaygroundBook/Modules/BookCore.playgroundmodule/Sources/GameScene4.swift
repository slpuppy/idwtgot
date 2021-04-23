//
//  GameScene4.swift
//  BookCore
//
//  Created by Gabriel Puppi on 15/04/21.
//

import Foundation
import SpriteKit

public class GameScene4: SKScene {

    var doorGroundLeft : SKSpriteNode!
    var doorGroundRight : SKSpriteNode!
    var doorLineLeft : SKSpriteNode!
    var doorLineRight: SKSpriteNode!
    var cryingEye: SKSpriteNode!
    var goOutside: SKSpriteNode!
    var exitText: SKLabelNode!
   
    var door: SKSpriteNode!
    var doorWay: SKSpriteNode!
    var dayLight: SKSpriteNode!
    
    public var completion: (()->())?
    
    
    

    override public func didMove(to view: SKView) {
        
       
        let cfURL = Bundle.main.url(forResource: "SourceCodePro-Regular", withExtension: "ttf")! as CFURL
                CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
        
        
        
        door = (childNode(withName: "door") as! SKSpriteNode)
        doorWay = (childNode(withName: "doorWay") as! SKSpriteNode)
        cryingEye = (childNode(withName: "cryingEye") as! SKSpriteNode)
        goOutside = (childNode(withName: "goOutside") as! SKSpriteNode)
        exitText = (childNode(withName: "exitText") as! SKLabelNode)
        dayLight = (childNode(withName: "dayLight") as! SKSpriteNode)
        
        
      
       
        doorLineLeft = (childNode(withName: "doorLineLeft") as! SKSpriteNode)
        doorLineRight = (childNode(withName: "doorLineRight") as! SKSpriteNode)
        doorGroundLeft = (childNode(withName: "doorGroundLeft") as! SKSpriteNode)
        doorGroundRight = (childNode(withName: "doorGroundRight") as! SKSpriteNode)

        // Setar o alpha das imagens iniciais em 0
        //light.alpha = 0
        goOutside.alpha = 0
        door.alpha = 0
        doorWay.alpha = 0
        exitText.alpha = 1
        dayLight.alpha = 0
        exitText.fontName = "SourceCodePro-Regular"
        
        
        
        
        //titleLabel.alpha = 0
        // buttonLabel.alpha = 0
      

        // setar o Scale das linhas para zero
        doorLineRight.xScale = 0
        doorLineLeft.xScale = 0
        doorGroundLeft.xScale = 0
        doorGroundRight.xScale = 0
        
        // Chama a animação da StartScreeb
        setupEndAnimation()
   
    
    
    }


    
    
    
    func setupEndAnimation() {
        
        
        
        
        
        
        var cryBegin = [SKTexture]()
        var cryLoop1 = [SKTexture]()
                 
                 
        cryBegin.append(SKTexture(imageNamed: "cry08"))
        cryBegin.append(SKTexture(imageNamed: "cry09"))
        cryBegin.append(SKTexture(imageNamed: "cry10"))
        cryBegin.append(SKTexture(imageNamed: "cry11"))
        cryBegin.append(SKTexture(imageNamed: "cry12"))
        cryBegin.append(SKTexture(imageNamed: "cry13"))
        cryBegin.append(SKTexture(imageNamed: "cry14"))
        cryBegin.append(SKTexture(imageNamed: "cry15"))
        cryBegin.append(SKTexture(imageNamed: "cry16"))
        cryBegin.append(SKTexture(imageNamed: "cry17"))
        cryBegin.append(SKTexture(imageNamed: "cry18"))
        cryBegin.append(SKTexture(imageNamed: "cry19"))
        cryBegin.append(SKTexture(imageNamed: "cry20"))
        cryBegin.append(SKTexture(imageNamed: "cry21"))
        cryBegin.append(SKTexture(imageNamed: "cry22"))
        cryBegin.append(SKTexture(imageNamed: "cry23"))
        cryBegin.append(SKTexture(imageNamed: "cry24"))
        cryBegin.append(SKTexture(imageNamed: "cry25"))
        cryBegin.append(SKTexture(imageNamed: "cry26"))
        cryBegin.append(SKTexture(imageNamed: "cry27"))
        cryBegin.append(SKTexture(imageNamed: "cry28"))
        cryBegin.append(SKTexture(imageNamed: "cry28"))
        cryBegin.append(SKTexture(imageNamed: "cry30"))
        cryBegin.append(SKTexture(imageNamed: "cry31"))
        cryBegin.append(SKTexture(imageNamed: "cry32"))
        cryBegin.append(SKTexture(imageNamed: "cry33"))
        cryBegin.append(SKTexture(imageNamed: "cry34"))
        cryBegin.append(SKTexture(imageNamed: "cry35"))
        

          
           
        
                 let startCry = SKAction.animate(with: cryBegin,
                                            timePerFrame: 0.1,
                                             resize: false,
                                             restore: true)
        
        
        
        cryLoop1.append(SKTexture(imageNamed: "cry34"))
        cryLoop1.append(SKTexture(imageNamed: "cry35"))
        
        
        let cryLoop = SKAction.animate(with: cryLoop1,
                                   timePerFrame: 0.2,
                                    resize: false,
                                    restore: true)
        
        let cryLooper = SKAction.repeatForever(cryLoop)
        
        
        cryingEye.run(.sequence([startCry ,cryLooper]))
        
        
        
        // Fade in da porta e do botao go outside
        
        
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let fadeInInterval = SKAction.wait(forDuration: 4)
        
        let fadeInSequence = SKAction.sequence([fadeInInterval, fadeIn])
        
        
        
        door.run(fadeInSequence)
        doorWay.run(fadeInSequence)
        goOutside.run(fadeInSequence)
        
        
        let typeInterval = SKAction.wait(forDuration: 0.07)
        
        let (nextChar, totalCount) = TypeWriter().createAction(for: exitText)
        
        exitText.text = ""
        
        let typeSequence = SKAction.sequence([typeInterval, nextChar])
        
       exitText.run(.sequence([.wait(forDuration: 4),.repeat(typeSequence, count: totalCount)]))
        
        
     
        
      
        
        
        let doorLineRightTexture = SKTexture(imageNamed: "doorLineRight")
        doorLineRight.texture = doorLineRightTexture
        doorLineRight.zPosition = 20
        

        let doorLineLeftTexture = SKTexture(imageNamed: "doorLineLeft")
        doorLineLeft.texture = doorLineLeftTexture
        doorLineLeft.zPosition = 20

        let doorGroundRightTexture = SKTexture(imageNamed: "doorGroundRight")
        doorGroundRight.texture = doorGroundRightTexture
        doorGroundRight.zPosition = 20

        let doorGroundLeftTexture = SKTexture(imageNamed: "doorGroundLeft")
        doorGroundLeft.texture = doorGroundLeftTexture
        doorGroundLeft.zPosition = 20
        
        
        let doorXScale = SKAction.scaleX(to: 1, y: 1, duration: 1)
        
        
        
        doorGroundLeft.run(.sequence([fadeInInterval,doorXScale]))
        doorGroundRight.run(.sequence([fadeInInterval,doorXScale]))
        doorLineRight.run(.sequence([fadeInInterval,doorXScale]))
        doorLineLeft.run(.sequence([fadeInInterval,doorXScale]))
        
        }
    
    
    
    
    
    
    func setupGameEnd() {
        
        
        dayLight.alpha = 1
        dayLight.zPosition = 21
       
        
        
        
        var dayLightTexture = [SKTexture]()
        
        
        dayLightTexture.append(SKTexture(imageNamed: "dayLight0"))
        dayLightTexture.append(SKTexture(imageNamed: "dayLight1"))
        dayLightTexture.append(SKTexture(imageNamed: "dayLight2"))
        dayLightTexture.append(SKTexture(imageNamed: "dayLight3"))
        dayLightTexture.append(SKTexture(imageNamed: "dayLight4"))
       
       
        
        let dayStart = SKAction.animate(with: dayLightTexture,
                                   timePerFrame: 0.150,
                                    resize: false,
                                    restore: true)
        
        
        let dayLightFinal = SKTexture(imageNamed: "dayLight5")
        let changeToFinal = SKAction.animate(with: [dayLightFinal], timePerFrame: 0)
        
        
     
        dayLight.run(.sequence([dayStart, changeToFinal])) {
           
            self.completion?()
            
        }
        
        
      
        
        
        
    
        
        
        
        
        
        
        
        
        
        
        
        
    }



   



@objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }







    func touchDown(atPoint pos : CGPoint) {

       
        
        
        setupGameEnd()





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

