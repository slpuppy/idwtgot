//
//  TypewriterAction.swift
//  BookCore
//
//  Created by Gabriel Puppi on 13/04/21.
//

import Foundation
import SpriteKit

class TypeWriter {
    
    
    
    func createAction(for labelNode:SKLabelNode) -> (SKAction, Int) {
        
        var textOriginal = labelNode.text ?? ""
        var textAnimationIndex = 0
        
        let nextChar = SKAction.customAction(withDuration: 0) { (node, time) in
            let label = node as! SKLabelNode
        
            let text = textOriginal
            let start = text.startIndex
            let end = text.index(text.startIndex, offsetBy: textAnimationIndex)
            let newText = String(text[start...end])
            
            
            label.text = newText
            
            textAnimationIndex += 1
            
        }
        
        return (nextChar, textOriginal.count)
        
    }
    
    
    
}
