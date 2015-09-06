//
//  GameScene.swift
//  SpritesFromScene
//
//  Created by Lars Bergqvist on 2015-09-02.
//  Copyright (c) 2015 Lars Bergqvist. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let nodeNameToImageNameMap = [ "brick": "brick", "waterball": "waterball", "spaceship": "Spaceship"]
    
    override func didMoveToView(view: SKView) {
        self.enumerateChildNodesWithName("*") {
            node,stop in
            if let name = node.name {
                if let imageName = self.nodeNameToImageNameMap[name] {
                    if let sprite = node as? SKSpriteNode {
                        sprite.texture = SKTexture(imageNamed: imageName)
                    }
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)

            self.enumerateChildNodesWithName("waterball") {
                node,stop in
                if (node.frame.contains(location)) {
                    node.removeFromParent()
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
