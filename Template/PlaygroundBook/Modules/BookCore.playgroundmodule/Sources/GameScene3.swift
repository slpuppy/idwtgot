//
//  GameScene3.swift
//  BookCore
//
//  Created by Gabriel Puppi on 13/04/21.


import Foundation
import SpriteKit

public class GameScene3: SKScene {
    
    public var completion: (()->())?
    
    var dateText1: SKLabelNode!
    var dateText2A: SKLabelNode!
    var dateText3: SKLabelNode!
    var dateText4 : SKLabelNode!
    
    var closedEye1: SKSpriteNode!
    var stage1: SKSpriteNode!
    var answer1: SKSpriteNode!
    var answer2: SKSpriteNode!
    var imposibleAnswer: SKSpriteNode!
    var cryingEye: SKSpriteNode!
  
    
    var stageState: SceneStage = .stageOne
    
    
    enum SceneStage {
        case stageOne
        case stageTwoA
        case stageTwoB
        case stageThree
        case stageFourA
        case stageFourB
    }
  
    
    

   override public func didMove(to view: SKView) {
        
    dateText1 = (childNode(withName: "dateText1") as! SKLabelNode)
    dateText2A = (childNode(withName: "dateText2A") as! SKLabelNode)
    dateText3 = (childNode(withName: "dateText3") as! SKLabelNode)
    dateText4 = (childNode(withName: "dateText4") as! SKLabelNode)
    closedEye1 = (childNode(withName: "closedEye1") as! SKSpriteNode)
    stage1 = (childNode(withName: "stage1") as! SKSpriteNode)
    answer1 = (childNode(withName: "answer1") as! SKSpriteNode)
    answer2 = (childNode(withName: "answer2") as! SKSpriteNode)
    imposibleAnswer = (childNode(withName: "imposibleAnswer") as! SKSpriteNode)
    cryingEye = (childNode(withName: "cryingEye") as! SKSpriteNode)
    

    let cfURL = Bundle.main.url(forResource: "SourceCodePro-Regular", withExtension: "ttf")! as CFURL
            CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
    
    
    
    dateText2A.alpha = 0
    dateText3.alpha = 0
    dateText4.alpha = 0
    imposibleAnswer.alpha = 0
    cryingEye.alpha = 0
    dateText1.fontName = "SourceCodePro-Regular"
    dateText2A.fontName = "SourceCodePro-Regular"
    dateText4.fontName = "SourceCodePro-Regular"
    dateText3.fontName = "SourceCodePro-Regular"
    
    setupStage1()
      
        
        
   
        }

    
    
    
    
func setupStage1() {
        
        // Colocar na cena e animar o texto inicial
     
      
         
    let typeInterval = SKAction.wait(forDuration: 0.07)
    
    let (nextChar, totalCount) = TypeWriter().createAction(for: dateText1)
    
    dateText1.text = ""
    
    let typeSequence = SKAction.sequence([typeInterval, nextChar])
    
   dateText1.run(.sequence([.wait(forDuration: 0.3),.repeat(typeSequence, count: totalCount)]))
         
         
        

    
    
    
   var eyeList = [SKTexture]()
    var eyeLoopTexture = [SKTexture]()
            
            // Cada imagem é adicionada à lista 1
        eyeList.append(SKTexture(imageNamed: "semiClosedEye1"))
        eyeList.append(SKTexture(imageNamed: "semiClosedEye2"))
        eyeList.append(SKTexture(imageNamed: "almostClosedEye1"))
        eyeList.append(SKTexture(imageNamed: "almostClosedEye2"))
        eyeList.append(SKTexture(imageNamed: "midEye"))

     
      
   
            let eye = SKAction.animate(with: eyeList,
                                       timePerFrame: 0.2,
                                        resize: false,
                                        restore: true)
            
    
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostOpenedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "midEye"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostClosedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostClosedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostClosedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostClosedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "midEye"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostClosedEye1"))
    eyeLoopTexture.append(SKTexture(imageNamed: "almostClosedEye2"))
    eyeLoopTexture.append(SKTexture(imageNamed: "midEye"))
    
    
   
    
    
    
    let eyeOpen = SKAction.animate(with: eyeLoopTexture,
                               timePerFrame: 0.2,
                                resize: true,
                                restore: true)
    let eyeLoop = SKAction.repeatForever(eyeOpen)
    
   
  
    
    
    
    
    closedEye1.run(.sequence([eye,eyeLoop]))
    
   
           
            
        
    
    
    // Entrada do gameBox
    
    let gameBoxFadeIn = SKAction.fadeIn(withDuration: 0.5)
    let gameBoxInterval = SKAction.wait(forDuration: 0.5)
    let gameBoxSequence = SKAction.sequence([gameBoxInterval,gameBoxFadeIn])
    
    
    stage1.run(gameBoxSequence)
    answer1.run(gameBoxSequence)
    answer2.run(gameBoxSequence)
    
    }
    
    
    
    func setupStage2A(){
        
        // FadeOut da data e gamebox
        
        stageState = .stageTwoA
        
       
        let FadeOut = SKAction.fadeOut(withDuration: 0.3)
        
        stage1.run(FadeOut)
        answer1.run(FadeOut)
        answer2.run(FadeOut)
        dateText1.run(FadeOut)
        
        let stage2ATexture = SKTexture(imageNamed: "stage2A")
        let answer3Texture = SKTexture(imageNamed: "answer3")
        let answer4Texture = SKTexture(imageNamed: "answer4")
            
            
        let nextStage = SKAction.animate(with: [stage2ATexture], timePerFrame: 0)
        let nextStageInterval = SKAction.wait(forDuration: 0.3)
        
        let nextAnswer1 = SKAction.animate(with: [answer3Texture], timePerFrame: 0)
        
        let nextAnswer2 = SKAction.animate(with: [answer4Texture], timePerFrame: 0)
       
     
        
        stage1.run(.sequence([nextStageInterval,nextStage]))
        answer1.run(.sequence([nextStageInterval,nextAnswer1]))
        answer2.run(.sequence([nextStageInterval,nextAnswer2]))
        
        
        
        
        // Animacao da nova data e game box
        
        dateText2A.alpha = 1
        
        let typeInterval = SKAction.wait(forDuration: 0.07)
        
        let (nextChar, totalCount) = TypeWriter().createAction(for: dateText2A)
        
        dateText2A.text = ""
        
        let typeSequence = SKAction.sequence([typeInterval, nextChar])
        
        dateText2A.run(.sequence([.wait(forDuration: 0.5),.repeat(typeSequence, count: totalCount)]))
        
        
        
        let gameBoxFadeIn = SKAction.fadeIn(withDuration: 0.5)
        let gameBoxInterval = SKAction.wait(forDuration: 0.5)
        let gameBoxSequence = SKAction.sequence([gameBoxInterval,gameBoxFadeIn])
        
        stage1.run(gameBoxSequence)
        answer1.run(gameBoxSequence)
        answer2.run(gameBoxSequence)
        
        
        
     // Nova animação do olho aberto/acordado
        

        var eyeOpenList = [SKTexture]()
     
     
            eyeOpenList.append(SKTexture(imageNamed: "almostOpenedEye1"))
            eyeOpenList.append(SKTexture(imageNamed: "almostOpenedEye2"))
            eyeOpenList.append(SKTexture(imageNamed: "almostOpenedEye1"))
            eyeOpenList.append(SKTexture(imageNamed: "openingEye1"))
            eyeOpenList.append(SKTexture(imageNamed: "openedEye2"))
           



                let openEye = SKAction.animate(with: eyeOpenList,
                                           timePerFrame: 0.2,
                                            resize: false,
                                            restore: true)
        
        
        // Animação do olho aberto
        
        var openedEyeList = [SKTexture]()
     
     
          
           openedEyeList.append(SKTexture(imageNamed: "openedEye1"))
            openedEyeList.append(SKTexture(imageNamed: "openedEye2"))
           



            let openEyeLoop = SKAction.animate(with: openedEyeList,
                                           timePerFrame: 0.3,
                                            resize: false,
                                            restore: true)
        
        
        
        let openEyeLoopGo = SKAction.repeatForever(openEyeLoop)
        
        
        
        
        

       
        closedEye1.run(.sequence([openEye,openEyeLoopGo]))
        
        
        
        
        
        
    }
    
    
    
    func setupStage2B(){
        // FadeOut da data e gamebox
        
        stageState = .stageTwoB
        
        
        
        
    
        
        
        let FadeOut = SKAction.fadeOut(withDuration: 0.3)
        
        stage1.run(FadeOut)
        answer1.run(FadeOut)
        answer2.run(FadeOut)
        dateText1.run(FadeOut)
        
        
        
        
        let stage2BTexture = SKTexture(imageNamed: "stage2B")
        let answer5Texture = SKTexture(imageNamed: "answer5")
        let answer6Texture = SKTexture(imageNamed: "answer6")
       
        let imposibleAnswerTexture = SKTexture(imageNamed: "imposibleAnswer")
        
        imposibleAnswer.texture = imposibleAnswerTexture
        
       
        
        
        
        
     
            
            
        let nextStage = SKAction.animate(with: [stage2BTexture], timePerFrame: 0)
        let nextStageInterval = SKAction.wait(forDuration: 0.3)
        
        let nextAnswer1 = SKAction.animate(with: [answer5Texture], timePerFrame: 0)
        
        let nextAnswer2 = SKAction.animate(with: [answer6Texture], timePerFrame: 0)
       
     
        
        stage1.run(.sequence([nextStageInterval,nextStage]))
        answer1.run(.sequence([nextStageInterval,nextAnswer1]))
        answer2.run(.sequence([nextStageInterval,nextAnswer2]))
        
        // Animacao da nova data
        
        dateText2A.alpha = 1
        
        let typeInterval = SKAction.wait(forDuration: 0.07)
        
        let (nextChar, totalCount) = TypeWriter().createAction(for: dateText2A)
        
        dateText2A.text = ""
        
        let typeSequence = SKAction.sequence([typeInterval, nextChar])
        
        dateText2A.run(.sequence([.wait(forDuration: 0.5),.repeat(typeSequence, count: totalCount)]))
        
       
        
        
        
        // Nova animação do olho fechando
           

           var eyeClosureList = [SKTexture]()
        
        
                eyeClosureList.append(SKTexture(imageNamed: "midEye"))
                eyeClosureList.append(SKTexture(imageNamed: "almostClosedEye2"))
                eyeClosureList.append(SKTexture(imageNamed: "almostClosedEye1"))
                eyeClosureList.append(SKTexture(imageNamed: "semiClosedEye2"))
                eyeClosureList.append(SKTexture(imageNamed: "semiClosedEye1"))
                           
                      



                   let closeEye = SKAction.animate(with: eyeClosureList,
                                              timePerFrame: 0.2,
                                               resize: false,
                                               restore: true)
           
           
           // Animação do olho fechado
           
           var closedEyeList = [SKTexture]()
        
        
            closedEyeList.append(SKTexture(imageNamed: "closedEye1"))
            closedEyeList.append(SKTexture(imageNamed: "closedEye2"))
        
        
             
            
              
        let closedEyeLoop = SKAction.animate(with: closedEyeList,
                                              timePerFrame: 0.3,
                                               resize: false,
                                               restore: true)
           
           
           
           let closedEyeLoopGo = SKAction.repeatForever(closedEyeLoop)
           
           
           
           
           

          
        closedEye1.run(.sequence([closeEye , closedEyeLoopGo]))
        
        
        
        
        
        
        
        let gameBoxFadeIn = SKAction.fadeIn(withDuration: 0.5)
        let gameBoxInterval = SKAction.wait(forDuration: 0.5)
        let gameBoxSequence = SKAction.sequence([gameBoxInterval,gameBoxFadeIn])
        
        stage1.run(gameBoxSequence)
        answer1.run(gameBoxSequence)
        answer2.run(gameBoxSequence)
        imposibleAnswer.run(gameBoxSequence)
        
        
    
        
    }
    
    
    
    func setupStage3(){
        
        stageState = .stageThree
        
        let FadeOut = SKAction.fadeOut(withDuration: 0.3)
        
        stage1.run(FadeOut)
        answer1.run(FadeOut)
        answer2.run(FadeOut)
        dateText2A.run(FadeOut)
        closedEye1.run(FadeOut)
        imposibleAnswer.run(FadeOut)
        
        
        
        
        // Animacao do olho comecando a lacrimejar
        
        cryingEye.alpha = 1
        
        cryingEye.texture = SKTexture(imageNamed: "cry0")
        
        var cryBegin = [SKTexture]()
        var cryLoop1 = [SKTexture]()
                 
                 // Cada imagem é adicionada à lista 1
        cryBegin.append(SKTexture(imageNamed: "cry0"))
        cryBegin.append(SKTexture(imageNamed: "cry01"))
        cryBegin.append(SKTexture(imageNamed: "cry02"))
        cryBegin.append(SKTexture(imageNamed: "cry03"))
        cryBegin.append(SKTexture(imageNamed: "cry04"))
        cryBegin.append(SKTexture(imageNamed: "cry05"))
        cryBegin.append(SKTexture(imageNamed: "cry06"))
        

          
           
        
                 let startCry = SKAction.animate(with: cryBegin,
                                            timePerFrame: 0.2,
                                             resize: false,
                                             restore: true)
        
        
        
                 
         
        cryLoop1 .append(SKTexture(imageNamed: "cry05"))
        cryLoop1 .append(SKTexture(imageNamed: "cry06"))
        
        let cryLoop = SKAction.animate(with: cryLoop1,
                                   timePerFrame: 0.2,
                                    resize: false,
                                    restore: true)

        
        let cryLoop1Go = SKAction.repeatForever(cryLoop)
        
        cryingEye.run(.sequence([startCry, cryLoop1Go]))
    

      
        
        
        // Animacao da nova data e game box
        
        dateText3.alpha = 1
        
        let typeInterval = SKAction.wait(forDuration: 0.07)
        
        let (nextChar, totalCount) = TypeWriter().createAction(for: dateText3)
        
        dateText3.text = ""
        
        let typeSequence = SKAction.sequence([typeInterval, nextChar])
        
        dateText3.run(.sequence([.wait(forDuration: 0.5),.repeat(typeSequence, count: totalCount)]))
        
        
        
        let stage3Texture = SKTexture(imageNamed: "stage3")
        let answer7Texture = SKTexture(imageNamed: "answer7")
        let answer8Texture = SKTexture(imageNamed: "answer8")
        
        
        let nextStage = SKAction.animate(with: [stage3Texture], timePerFrame: 0)
        let nextStageInterval = SKAction.wait(forDuration: 0.3)
        
        let nextAnswer1 = SKAction.animate(with: [answer7Texture], timePerFrame: 0)
        
        let nextAnswer2 = SKAction.animate(with: [answer8Texture], timePerFrame: 0)
        
        
        stage1.run(.sequence([nextStageInterval,nextStage]))
        answer1.run(.sequence([nextStageInterval,nextAnswer1]))
        answer2.run(.sequence([nextStageInterval,nextAnswer2]))
        
        
        
        
        
        
        let gameBoxFadeIn = SKAction.fadeIn(withDuration: 0.5)
        let gameBoxInterval = SKAction.wait(forDuration: 0.5)
        let gameBoxSequence = SKAction.sequence([gameBoxInterval,gameBoxFadeIn])
        
        stage1.run(gameBoxSequence)
        answer1.run(gameBoxSequence)
        answer2.run(gameBoxSequence)
        
        
        
        
        
        
    }


   



    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    
    
    
    
    func setupStageFourA() {
        
        
        
        
        stageState = .stageFourA
        
        let FadeOut = SKAction.fadeOut(withDuration: 0.3)
        
        stage1.run(FadeOut)
        answer1.run(FadeOut)
        answer2.run(FadeOut)
        dateText3.run(FadeOut)
        
        dateText4.alpha = 1
        
        let typeInterval = SKAction.wait(forDuration: 0.07)
        
        let (nextChar, totalCount) = TypeWriter().createAction(for: dateText4)
        
        dateText4.text = ""
        
        let typeSequence = SKAction.sequence([typeInterval, nextChar])
        
        dateText4.run(.sequence([.wait(forDuration: 0.5),.repeat(typeSequence, count: totalCount)]))
        
        
        // Trocamos as texturas dos botoes e da fase
        
        
        let stage4ATexture = SKTexture(imageNamed: "stage4A")
        let answer9Texture = SKTexture(imageNamed:"answer9")
        let answer10Texture = SKTexture(imageNamed: "answer10")

        let nextStage = SKAction.animate(with: [stage4ATexture], timePerFrame: 0)
        let nextStageInterval = SKAction.wait(forDuration: 0.3)

        let nextAnswer1 = SKAction.animate(with: [answer9Texture], timePerFrame: 0)

        let nextAnswer2 = SKAction.animate(with: [answer10Texture], timePerFrame: 0)
        
        
        
        
        // Trocamos a animacao do olho
        
        cryingEye.texture = SKTexture(imageNamed: "cry0")
        
        var cryBegin = [SKTexture]()
        var cryLoop1 = [SKTexture]()
                 
                 // Cada imagem é adicionada à lista 1
        cryBegin.append(SKTexture(imageNamed: "cry05"))
        cryBegin.append(SKTexture(imageNamed: "cry06"))
        cryBegin.append(SKTexture(imageNamed: "cry07"))
        cryBegin.append(SKTexture(imageNamed: "cry08"))
        cryBegin.append(SKTexture(imageNamed: "cry09"))
       

          
           
        
                 let startCry = SKAction.animate(with: cryBegin,
                                            timePerFrame: 0.2,
                                             resize: false,
                                             restore: true)
        
        
        
                 
         
        cryLoop1 .append(SKTexture(imageNamed: "cry09"))
        cryLoop1 .append(SKTexture(imageNamed: "cry10"))
        
        let cryLoop = SKAction.animate(with: cryLoop1,
                                   timePerFrame: 0.2,
                                    resize: false,
                                    restore: true)

        
        let cryLoop1Go = SKAction.repeatForever(cryLoop)
        
        cryingEye.run(.sequence([startCry, cryLoop1Go]))
    
        
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        stage1.run(.sequence([nextStageInterval,nextStage]))
        answer1.run(.sequence([nextStageInterval,nextAnswer1]))
        answer2.run(.sequence([nextStageInterval,nextAnswer2]))
        
        
        let gameBoxFadeIn = SKAction.fadeIn(withDuration: 0.5)
        let gameBoxInterval = SKAction.wait(forDuration: 0.5)
        let gameBoxSequence = SKAction.sequence([gameBoxInterval,gameBoxFadeIn])
        
        stage1.run(gameBoxSequence)
        answer1.run(gameBoxSequence)
        answer2.run(gameBoxSequence)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    func setupStageFourB(){
        
        stageState = .stageFourA
        
        let FadeOut = SKAction.fadeOut(withDuration: 0.3)
        
        stage1.run(FadeOut)
        answer1.run(FadeOut)
        answer2.run(FadeOut)
        dateText3.run(FadeOut)
        
        dateText4.alpha = 1
        
        let typeInterval = SKAction.wait(forDuration: 0.07)
        
        let (nextChar, totalCount) = TypeWriter().createAction(for: dateText4)
        
        dateText4.text = ""
        
        let typeSequence = SKAction.sequence([typeInterval, nextChar])
        
        dateText4.run(.sequence([.wait(forDuration: 0.5),.repeat(typeSequence, count: totalCount)]))
        
        
        // Trocamos as texturas dos botoes e da fase
        
        
        let stage4BTexture = SKTexture(imageNamed: "stage4B")
        let answer11Texture = SKTexture(imageNamed:"answer11")
        let answer12Texture = SKTexture(imageNamed: "answer12")

        let nextStage = SKAction.animate(with: [stage4BTexture], timePerFrame: 0)
        let nextStageInterval = SKAction.wait(forDuration: 0.3)

        let nextAnswer1 = SKAction.animate(with: [answer11Texture], timePerFrame: 0)

        let nextAnswer2 = SKAction.animate(with: [answer12Texture], timePerFrame: 0)
        
        
        
        
        // Trocamos a animacao do olho
        
        cryingEye.texture = SKTexture(imageNamed: "cry0")
        
        var cryBegin = [SKTexture]()
        var cryLoop1 = [SKTexture]()
                 
                 // Cada imagem é adicionada à lista 1
        cryBegin.append(SKTexture(imageNamed: "cry05"))
        cryBegin.append(SKTexture(imageNamed: "cry06"))
        cryBegin.append(SKTexture(imageNamed: "cry07"))
        cryBegin.append(SKTexture(imageNamed: "cry08"))
        cryBegin.append(SKTexture(imageNamed: "cry09"))
       

          
           
        
                 let startCry = SKAction.animate(with: cryBegin,
                                            timePerFrame: 0.2,
                                             resize: false,
                                             restore: true)
        
        
        
                 
         
        cryLoop1 .append(SKTexture(imageNamed: "cry09"))
        cryLoop1 .append(SKTexture(imageNamed: "cry10"))
        
        let cryLoop = SKAction.animate(with: cryLoop1,
                                   timePerFrame: 0.2,
                                    resize: false,
                                    restore: true)

        
        let cryLoop1Go = SKAction.repeatForever(cryLoop)
        
        cryingEye.run(.sequence([startCry, cryLoop1Go]))
    
        
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        stage1.run(.sequence([nextStageInterval,nextStage]))
        answer1.run(.sequence([nextStageInterval,nextAnswer1]))
        answer2.run(.sequence([nextStageInterval,nextAnswer2]))
        
        
        let gameBoxFadeIn = SKAction.fadeIn(withDuration: 0.5)
        let gameBoxInterval = SKAction.wait(forDuration: 0.5)
        let gameBoxSequence = SKAction.sequence([gameBoxInterval,gameBoxFadeIn])
        
        stage1.run(gameBoxSequence)
        answer1.run(gameBoxSequence)
        answer2.run(gameBoxSequence)
        
        
    }







    func touchDown(atPoint pos : CGPoint) {
        
        
        
        
        
        
        if  answer1.contains(pos) {

            switch stageState {
            
                case .stageOne:
                    setupStage2A()
                    
                case .stageTwoA:
                    setupStage3()
                    
                    
                case.stageTwoB:
                    setupStage3()
                    
            case.stageThree:
                setupStageFourA()
                
            case.stageFourA:
                
                let changeSceneWait = SKAction.wait(forDuration: 0.5)
                let changeScenefadeOut = SKAction.fadeOut(withDuration: 0.5)
                
                answer1.run(changeSceneWait)
                answer1.run(changeScenefadeOut)
                answer2.run(changeSceneWait)
                answer2.run(changeScenefadeOut)
                stage1.run(changeSceneWait)
                stage1.run(changeScenefadeOut)
                dateText1.run(changeScenefadeOut)
               
                
                self.completion?()
                
            case.stageFourB:
               
                let changeSceneWait = SKAction.wait(forDuration: 0.5)
                let changeScenefadeOut = SKAction.fadeOut(withDuration: 0.5)
                
                answer1.run(changeSceneWait)
                answer1.run(changeScenefadeOut)
                answer2.run(changeSceneWait)
                answer2.run(changeScenefadeOut)
                stage1.run(changeSceneWait)
                stage1.run(changeScenefadeOut)
                dateText1.run(changeScenefadeOut)
                
                self.completion?()
                
           
                
               
            }
            
            
        }
        
        if  answer2.contains(pos) {

            switch stageState {
            
                case .stageOne:
                    setupStage2B()
                    
                case .stageTwoA:
                    setupStage3()
                    
                    
                case.stageTwoB:
                    setupStage3()
                
            
            case .stageThree:
                setupStageFourB()
            
            case.stageFourA:
             
                let changeSceneWait = SKAction.wait(forDuration: 0.5)
                let changeScenefadeOut = SKAction.fadeOut(withDuration: 0.5)
                
                answer1.run(changeSceneWait)
                answer1.run(changeScenefadeOut)
                answer2.run(changeSceneWait)
                answer2.run(changeScenefadeOut)
                stage1.run(changeSceneWait)
                stage1.run(changeScenefadeOut)
                dateText1.run(changeScenefadeOut)
                self.completion?()
                
            case.stageFourB:
               
                let changeSceneWait = SKAction.wait(forDuration: 0.5)
                let changeScenefadeOut = SKAction.fadeOut(withDuration: 0.5)
                
                answer1.run(changeSceneWait)
                answer1.run(changeScenefadeOut)
                answer2.run(changeSceneWait)
                answer2.run(changeScenefadeOut)
                stage1.run(changeSceneWait)
                stage1.run(changeScenefadeOut)
                dateText1.run(changeScenefadeOut)
               
                self.completion?()
                
                
            }
            
            
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








    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



