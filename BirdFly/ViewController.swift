//
//  ViewController.swift
//  BirdFly
//
//  Created by TTung on 2/16/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var bird = UIImageView()
    var song = AVAudioPlayer()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
       
    }

    func drawJungle(){
        let background = UIImageView(image: UIImage(named: "Jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }
    
    func addBird(){
        bird = UIImageView(frame: CGRect(x: 0, y: 0, width:110, height: 68))
        bird.animationImages = [UIImage(named: "bird0.png")!, UIImage(named: "bird1.png")!, UIImage(named: "bird2.png")!, UIImage(named: "bird3.png")!, UIImage(named: "bird4.png")!, UIImage(named: "bird5.png")!]
        bird.animationDuration = 1
        bird.animationRepeatCount = 0
        bird.startAnimating()
        self.view.addSubview(bird)
        
    }
    
    func flyUpAndDown(){
        let topToBottom = CGPoint(x: self.view.bounds.size.width - 50, y: self.view.bounds.size.height - 50)
        let RightToLeftInBottom = CGPoint(x: 50 , y: self.view.bounds.height - 50)
        let BottomToTop = CGPoint(x: self.view.bounds.width - 50, y: 50)
        let RightToLeftInTop = CGPoint(x: 50, y: 50)

        UIView.animate(withDuration: 4, animations: {self.bird.center = topToBottom})
        { (finished) in
            var rotate = CGAffineTransform(rotationAngle: 0)
            var stretchAndRotate = rotate.scaledBy(x: -1, y: 1)
            self.bird.transform = stretchAndRotate
            
            UIView.animate(withDuration: 3, animations: {self.bird.center = RightToLeftInBottom})
            { (finished) in
                
                rotate = CGAffineTransform(rotationAngle: -1.0)
                stretchAndRotate = rotate.scaledBy(x: 1, y: 1)
                self.bird.transform = stretchAndRotate
                
                UIView.animate(withDuration: 4, animations: {self.bird.center = BottomToTop})
                { (finished) in
                
                rotate = CGAffineTransform(rotationAngle: 0)
                stretchAndRotate = rotate.scaledBy(x: -1, y: 1)
                self.bird.transform = stretchAndRotate
                
                    UIView.animate(withDuration: 3, animations: {self.bird.center = RightToLeftInTop})
                    { (finished) in
                    
                                    self.bird.transform = .identity
                                    self.flyUpAndDown()
            }
        }
    }
}
}
    
    func playSong(){
        song = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")!))
        song.play()
        
    }
    

}

