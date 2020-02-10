//
//  ObjectManager.swift
//  FiringBullet
//
//  Created by zino-mac on 2020/02/10.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class ObjectManager: NSObject {
    var objectArray:Array<Bullet>
    
    
    init(objectArray:Array<Bullet>) {
        self.objectArray=objectArray
    }
    
    func addObject(bullet:Bullet){
        objectArray.append(bullet)
    }
    
    func removeObject(bullet:Bullet){
        let index = objectArray.firstIndex(where: {$0 === bullet})
        objectArray.remove(at: index!)
        bullet.imgView.removeFromSuperview()
    }
    
    func tick(){
        for obj in objectArray{
            obj.tick()
        }
    }
    
    func render(){
        for obj in objectArray{
            obj.render()
        }
    }
}
