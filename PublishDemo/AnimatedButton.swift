//
//  AnimatedButton.swift
//  PublishDemo
//
//  Created by Prashant on 26/01/21.
//

import UIKit

class AnimatedButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    private var animatedButtonLayer:AnimatedButtonLayer!
    private var animatedButtonText:AnimatedButtonText!
    
    func startAnimate(uloadingText:String = "Uploading"){
        
       
        animatedButtonLayer.animateLayer()
        animatedButtonText.setText(text: uloadingText)
        
    }
    func stopAnimate(completionText:String = "Done"){
        
    
        animatedButtonLayer.finalAnimation()
        animatedButtonText.setText(text: completionText)
    }
    
    func reset(){
        
        animatedButtonLayer.reset()
    }
    
    override func draw(_ rect: CGRect) {
        self.imageView?.image = nil
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        let cornerRadius = self.layer.cornerRadius
        
        animatedButtonLayer = AnimatedButtonLayer(frame:CGRect(x:cornerRadius + 5, y: 5, width: rect.size.height-10, height: rect.size.height-10))
        
        self.layer.addSublayer(animatedButtonLayer)
        
        drawText(rect)
    }
    

    
    func drawText(_ rect: CGRect){
        
        let frame = CGRect(x: animatedButtonLayer.frame.origin.x+animatedButtonLayer.frame.width, y:self.titleLabel!.frame.origin.y, width: rect.width-(2*(animatedButtonLayer.frame.origin.x)+animatedButtonLayer.frame.width), height: self.titleLabel!.frame.height)
        animatedButtonText = AnimatedButtonText(frame:frame, font: self.titleLabel!.font, text: self.currentTitle ?? "", allignment: self.contentHorizontalAlignment, color: self.currentTitleColor)
        self.setTitle(nil, for: .normal)
        self.layer.addSublayer(animatedButtonText)
    }
    
   
    
}
