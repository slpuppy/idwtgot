import SpriteKit

public class GameScene: SKScene {

    var doorGroundLeft : SKSpriteNode!
    var doorGroundRight : SKSpriteNode!
    var doorLineLeft : SKSpriteNode!
    var doorLineRight: SKSpriteNode!
   
    var door: SKSpriteNode!
    var doorWay: SKSpriteNode!
    var light: SKSpriteNode!
    var titleLabel: SKLabelNode!
    var buttonLabel: SKLabelNode!
    var cutLabel: SKSpriteNode!
    
    public var completion: (()->())?
    
    
    

    override public func didMove(to view: SKView) {
        
        door = (childNode(withName: "door") as! SKSpriteNode)
        doorWay = (childNode(withName: "doorWay") as! SKSpriteNode)
        light = (childNode(withName: "light") as! SKSpriteNode)
        titleLabel = (childNode(withName: "title") as! SKLabelNode)
        buttonLabel = (childNode(withName: "click") as! SKLabelNode)
        cutLabel = (childNode(withName: "cutLabel") as! SKSpriteNode)
        doorLineLeft = (childNode(withName: "doorLineLeft") as! SKSpriteNode)
        doorLineRight = (childNode(withName: "doorLineRight") as! SKSpriteNode)
        doorGroundLeft = (childNode(withName: "doorGroundLeft") as! SKSpriteNode)
        doorGroundRight = (childNode(withName: "doorGroundRight") as! SKSpriteNode)

        // Setar o alpha das imagens iniciais em 0
        light.alpha = 0
        door.alpha = 0
        doorWay.alpha = 0
        titleLabel.alpha = 0
        buttonLabel.alpha = 0
        cutLabel.alpha = 0
      
        let cfURL = Bundle.main.url(forResource: "Schoolbell-Regular", withExtension: "ttf")! as CFURL
                CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
        titleLabel.fontName = "Schoolbell-Regular"
        
       
       
        
        
        
        //  setar o Scale das linhas para zero
        doorLineRight.xScale = 0
        doorLineLeft.xScale = 0
        doorGroundLeft.xScale = 0
        doorGroundRight.xScale = 0
        
        // Chama a animação da StartScreeb
        setupStartAnimation()
    }

    func setupStartAnimation() {

        //  Conjunto de animações da StartScreen
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


        let cutLabelTexture = SKTexture(imageNamed: "cutLabel")

        // Cria a animação de FadeIn da pota
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        let lineScale = SKAction.scaleX(to: 1, duration: 0.5)
        let lineInterval = SKAction.wait(forDuration: 0.2)
        
        let groundInterval = SKAction.wait(forDuration: 1.2)
        
        let interval1 = SKAction.wait(forDuration: 1)
        
        let interval0 = SKAction.wait(forDuration: 0.5)
        // Anima para a proxima imagem da porta semiabrindo

        let door2Texture = SKTexture(imageNamed: "door2")
        let changeToDoor2 = SKAction.animate(with: [door2Texture], timePerFrame: 0)

        let doorInterval2 = SKAction.wait(forDuration: 0.3)

      // Anima para a proxima imagem da porta aberta

        let door3Texture = SKTexture(imageNamed: "door3")
        let changeToDoor3 = SKAction.animate(with: [door3Texture], timePerFrame: 0)


      // Animação dos raios de luz saindo da porta

        let lightInterval = SKAction.wait(forDuration: 2.5)
        let lightFadeIn = SKAction.fadeIn(withDuration: 0.05)
        let lightInterval2 = SKAction.wait(forDuration: 0.3)
        let cutLabelInterval = SKAction.wait(forDuration: 3)



      // Criacao do texto que fica atras da luz


        // Animação de entrada dos textos


        let labelInterval = SKAction.wait(forDuration: 2.6)
        let labelFadein = SKAction.fadeIn(withDuration: 1)



       // Animação que troca o feixo de luz

        let light1Texture = SKTexture(imageNamed: "light1")
        let changeToLight1 = SKAction.animate(with: [light1Texture], timePerFrame: 0
        )

        let light2Texture = SKTexture(imageNamed: "light2")
        let changeToLight2 = SKAction.animate(with: [light2Texture], timePerFrame: 0)



        // Animação do botão piscando

        let buttonBlinkIn = SKAction.fadeIn(withDuration: 0.5)
        let buttonBlinkOut = SKAction.fadeOut(withDuration: 0.5)
        let buttonBlinkWait = SKAction.wait(forDuration: 2.6)



        // Alguns parametros da Animação da luz piscando e da porta mexendo

        let changeInterval = SKAction.wait(forDuration: 4)
        let blinkInterval = SKAction.wait(forDuration: 0.1)


        // RODA A SEQUENCIA DE ANIMAÇÕES

        door.run(.sequence([interval0, fadeIn, interval1, changeToDoor2, doorInterval2, changeToDoor3]))

        doorWay.run(.sequence([interval0, fadeIn]))

        doorGroundLeft.run(.sequence([lineInterval,groundInterval, lineScale]))
        doorGroundRight.run(.sequence([lineInterval, groundInterval, lineScale]))
        doorLineRight.run(.sequence([lineInterval, groundInterval, lineInterval, lineScale]))
        doorLineLeft.run(.sequence([lineInterval, groundInterval,lineInterval,lineScale]))


        light.run(.sequence([lightInterval, lightFadeIn, lightInterval2, changeToLight2]))

        titleLabel.run(.sequence([labelInterval, labelFadein]))

        cutLabel.run(.sequence([cutLabelInterval, labelFadein]))

        buttonLabel.run(.sequence([labelInterval, labelFadein]))

        cutLabel.texture = cutLabelTexture

      // Cria um loop infinito do botão piscando

        buttonLabel.run(.sequence([buttonBlinkWait, .repeatForever(.sequence([buttonBlinkIn, buttonBlinkOut]))]))


        // Cria um loop infinito da porta piscando e fechando


        door.run(.repeatForever(.sequence([changeInterval, changeToDoor2, blinkInterval, changeToDoor3, blinkInterval, changeToDoor2, blinkInterval, changeToDoor3])))

        light.run(.repeatForever(.sequence([changeInterval,changeToLight1, blinkInterval, changeToLight2, blinkInterval, changeToLight1, blinkInterval, changeToLight2 ])))


        }



    func setupCloseDoorAnimation() {

        // Animação que roda quando clica pra começar a exp, tem que fechar a porta e apagar a luz.
        
        let cutInterval = SKAction.wait(forDuration:3.5)
        let cutFadeout = SKAction.fadeOut(withDuration: 1)
        door.removeAllActions()
        light.removeAllActions()
        buttonLabel.removeAllActions()

        let door1Texture = SKTexture(imageNamed: "door1")

        let changeToDoor1 = SKAction.animate(with: [door1Texture], timePerFrame: 0)


        let door2Texture = SKTexture(imageNamed: "door2")
        let changeToDoor2 = SKAction.animate(with: [door2Texture], timePerFrame: 0)

        let light1Texture = SKTexture(imageNamed: "light1")
        let changeToLight1 = SKAction.animate(with: [light1Texture], timePerFrame: 0)

        let lightFadeOut = SKAction.fadeOut(withDuration: 0.3)

        let labelFadeOut = SKAction.fadeOut(withDuration: 0.2)


        light.run(.sequence([changeToLight1, lightFadeOut]))

        door.run(.sequence([changeToDoor2, changeToDoor1]))

        titleLabel.run(labelFadeOut)

        buttonLabel.run(labelFadeOut)
        
        doorWay.run(.sequence([cutInterval,cutFadeout])) {
            
            self.completion?()
            
            }
        
        
        
        door.run(.sequence([cutInterval, cutFadeout]))
        doorGroundLeft.run(.sequence([cutInterval,cutFadeout]))
        doorGroundRight.run(.sequence([cutInterval,cutFadeout]))
        doorLineLeft.run(.sequence([cutInterval,cutFadeout]))
        doorLineRight.run(.sequence([cutInterval,cutFadeout]))
        cutLabel.run(.sequence([cutInterval,cutFadeout]))
    }



@objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }







    func touchDown(atPoint pos : CGPoint) {

       
        
        
        if  buttonLabel.contains(pos) {


            setupCloseDoorAnimation()

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

