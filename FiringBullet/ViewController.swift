//
//  ViewController.swift
//  FiringBullet
//
//  Created by zino-mac on 2020/02/08.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class Bullet{
    var x:Int
    var y:Int
    var url:String
    var imgView:UIImageView!
    var parent:UIView!
    let objectManager:ObjectManager
    
    init(x:Int,y:Int,url:String,parent:UIView, objectManager:ObjectManager) {
        self.x = x
        self.y = y
        self.url = url
        self.imgView = UIImageView(image: UIImage(named: url))
        self.imgView.frame = CGRect(x: x, y: y, width: 15, height: 15)
        self.parent = parent
        self.objectManager = objectManager
        parent.addSubview(imgView)
    }
    func tick(){
        self.x += 2
        
        if self.x > 750 {
            objectManager.removeObject(bullet: self)
        }
    }
    
    func render(){
        self.imgView.frame.origin = CGPoint(x: self.x, y: 200)
    }
}


class ViewController: UIViewController {

    var objectArray:Array = Array<Bullet>()
    var objectManager:ObjectManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        
        objectManager = ObjectManager(objectArray: objectArray)
    }

    @IBAction func btnClick(_ sender: Any) {
        fire()
    }
    
    func fire(){
        //create Image dynamically
        let bullet:Bullet = Bullet(x: 0, y: 150, url: "red_ball.png", parent:self.view,objectManager:objectManager)
        objectManager.addObject(bullet: bullet)
    }
    
    @objc func gameLoop(){
        objectManager.tick()
        objectManager.render()
    }
}

