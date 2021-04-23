//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//



import PlaygroundSupport
import SpriteKit
import UIKit
import BookCore
import AVFoundation

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
let scene = GameScene(fileNamed: "GameScene")!
scene.scaleMode = .aspectFit


let scene2 = GameScene2(fileNamed:"GameScene2")!
scene2.scaleMode = .aspectFit

let scene3 = GameScene3(fileNamed:"GameScene3")!
scene3.scaleMode = .aspectFit

let scene4 = GameScene4(fileNamed:"GameScene4")!
scene4.scaleMode = .aspectFit

let scene5 = GameScene5(fileNamed:"GameScene5")!
scene5.scaleMode = .aspectFit



var musicPlayer: AVAudioPlayer!

musicPlayer = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "idwtgo", withExtension: "mp3")!)
        

        musicPlayer.play()
        musicPlayer.volume = 0.2



scene.completion = {
    sceneView.presentScene(scene2)
}

scene2.completion = {
    sceneView.presentScene(scene3)
}

scene3.completion = {
    sceneView.presentScene(scene4)
}

scene4.completion = {
    sceneView.presentScene(scene5)
}






sceneView.presentScene(scene)

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true












//#-end-hidden-code


/*:
 # I don't want to go outside today

 **A depressing experience...or an experience about depression?**
 I don`t want to go outside today (IDWTGOT) is a indie-rpg-game like interactive experience that puts you in the place of someone who started dealing with Major Depressive Disorder symptoms through daily life. The game story aims to show how the diasese can affect so deeply into someone's life and how treatment can be an important **key** in helping individuals live through their lives with depression.
 

 

 **An important statement**
 
 One thing that needs to be very clear is that because of the very nature of depression, it is experienced differently by every individual who suffers from it, This Playground Experience is not trying to say that this is the best or most accuratte representation of depression, it pretends to merely be an amalgamation of my experience, the experience of several people close to me, and some years of research about it. The situations os the story were written based on the most common and relatable symptoms of depression and do not intend to cover all sides and facets of the disease.
 
 - Experiment:  To have a better and more immersive experience please run this Playground on Full Screen mode(Hide Editor) and remember to use headphones (:


 */
