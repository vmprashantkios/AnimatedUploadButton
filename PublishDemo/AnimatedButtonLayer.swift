//
//  AnimatedButtonLayer.swift
//  PublishDemo
//
//  Created by Prashant on 27/01/21.
//

import UIKit

class AnimatedButtonLayer: CALayer {
    
    
    private  var cloudLayer1 = CAShapeLayer()
    private  var arrowLayer = CAShapeLayer()
    private  var circleLayer = CAShapeLayer()
    private  var tickLayer = CAShapeLayer()
    private  var frameSize = CGRect()

    init(frame:CGRect) {
        super.init()
        
        
        frameSize = frame
        self.frame = frameSize
        self.drawShapes()
    
    }
    
    
    
    private func drawShapes(){
        
        cloudLayer1 = drawCloud(scale: 0.0)
        arrowLayer = drawArrow()
        self.addSublayer(arrowLayer)
        self.insertSublayer(cloudLayer1, below: arrowLayer)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateLayer(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.animateArrow()
           self.animateCloud(layer: self.cloudLayer1)
        }
        
    }
    
    func finalAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.arrowLayer.removeAllAnimations()
            self.arrowLayer.removeFromSuperlayer()
            self.cloudLayer1.removeAllAnimations()
            self.cloudLayer1.removeFromSuperlayer()
            self.circleLayer = self.drawCircle()
            self.addSublayer(self.circleLayer)
            self.tickLayer = self.drawTick()
            self.addSublayer(self.tickLayer)
            self.animateTick(layer: self.tickLayer)
        }
    }
    
    func reset(){
        self.circleLayer.removeAllAnimations()
        self.circleLayer.removeFromSuperlayer()
        self.tickLayer.removeAllAnimations()
        self.tickLayer.removeFromSuperlayer()
        drawShapes()
        
    }
    
    private  func drawCircle(scale:CGFloat=0.0)->CAShapeLayer{
        
        
        var calcualtedScale = scale
        let aspectScale = self.frame.height/100
        
        if scale == 0.0{
            
            calcualtedScale = aspectScale
        }
        
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2), radius: 40*calcualtedScale, startAngle: deg2rad(0), endAngle: deg2rad(360), clockwise: true)
        
        layer.path = circlePath.cgPath
        layer.fillColor = UIColor.white.withAlphaComponent(0.4).cgColor
        return layer
        
    }
    
    private func drawTick(scale:CGFloat=0.0)->CAShapeLayer{
        
        var calcualtedScale = scale
        let aspectScale = self.frame.height/100
        
        if scale == 0.0{
            
            calcualtedScale = aspectScale
        }
        
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2-15*calcualtedScale, y:self.frame.height/2))
        path.addLine(to: CGPoint(x: self.frame.width/2-5*calcualtedScale, y:self.frame.height/2+10*calcualtedScale))
        path.addLine(to: CGPoint(x: self.frame.width/2+15*calcualtedScale, y:self.frame.height/2-10*calcualtedScale))
        layer.path = path.cgPath
        layer.lineWidth = 3.0*calcualtedScale
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor
        return layer
        
    }
    
    private func animateTick(layer:CALayer){
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1.0
        layer.add(animation, forKey: "strokeEnd")
    }
    
    private func drawCloud(scale:CGFloat=0.0) -> CAShapeLayer{
    
     //   let scale = self.frame.width/100
        var calcualtedScale = scale
        let aspectScale = self.frame.height/100
        
        if scale == 0.0{
            
            calcualtedScale = aspectScale
        }
        
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        let height = (40 * calcualtedScale)
        let path = UIBezierPath(roundedRect: CGRect(x: self.frame.width/2-(35 * calcualtedScale), y: self.frame.height/2-(15 * calcualtedScale), width: (70 * calcualtedScale), height: height), cornerRadius: height/2)
        path.move(to: CGPoint(x: self.frame.width/2-(20 * calcualtedScale), y: self.frame.height/2-(10 * calcualtedScale)))
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2-(10 * calcualtedScale)), radius: (20*calcualtedScale), startAngle: deg2rad(180), endAngle: deg2rad(360), clockwise: true)
        layer.path = path.cgPath
        layer.fillColor = UIColor.white.withAlphaComponent(0.4).cgColor
       
        return layer
      
    }
    
  
    private func deg2rad(_ number: Double) -> CGFloat {
           return CGFloat(number * .pi / 180)
       }
    
    private func drawArrow(scale:CGFloat=0.0)->CAShapeLayer{
        
        var calcualtedScale = scale
        let aspectScale = self.frame.height/100
        
        if scale == 0.0{
            
            calcualtedScale = aspectScale
        }
        
        let layer = CAShapeLayer()
        let lineWidth = 5 * calcualtedScale
        layer.frame = self.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2 , y: self.frame.height/2))
        path.addLine(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2+(35*calcualtedScale)))
        path.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path.addLine(to: CGPoint(x: self.frame.width/2-(10*calcualtedScale), y: self.frame.height/2+(10*calcualtedScale)))
        path.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path.addLine(to: CGPoint(x: self.frame.width/2+(10*calcualtedScale), y: self.frame.height/2+(10*calcualtedScale)))
        layer.path = path.cgPath
        layer.lineWidth = lineWidth
        layer.lineCap = .round
        layer.strokeColor = UIColor.white.cgColor
        layer.anchorPoint = CGPoint(x: 0.0, y: 1.0)
      //  layer.backgroundColor  = UIColor.green.cgColor
        layer.position = CGPoint(x:0, y: self.frame.height)
       
        return layer
        
    }
    
    
    private  func animateCloud(layer:CALayer){
        
        let positionAnimation = CABasicAnimation(keyPath: "position.y")
        positionAnimation.duration = 1.0
        positionAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        positionAnimation.fillMode = .forwards
        positionAnimation.fromValue = -self.frame.height
        positionAnimation.repeatCount = HUGE
       //  positionAnimation.isRemovedOnCompletion = false
        positionAnimation.toValue = 2 * self.frame.height
        //positionAnimation.beginTime = 1.0
        layer.add(positionAnimation, forKey: "anim1")
        
    }
    
    private func animateArrow(){
        
        let layerAnimation = CABasicAnimation(keyPath: "transform.scale.y")
        layerAnimation.duration = 1.0
        layerAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        layerAnimation.fillMode = .forwards
        layerAnimation.fromValue = 1.0
        layerAnimation.toValue = 1.4
        layerAnimation.repeatCount = HUGE
        layerAnimation.autoreverses = true
         arrowLayer.add(layerAnimation, forKey: "anim")
        
//        let positionAnimation = CABasicAnimation(keyPath: "frame.y")
//        positionAnimation.duration = 0.5
//        positionAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
//        positionAnimation.fillMode = .forwards
//        positionAnimation.fromValue = self.frame.height/2
//        positionAnimation.toValue = self.frame.height/2-50
//        positionAnimation.beginTime = 1.0
//
        let group = CAAnimationGroup()
        group.animations = [layerAnimation]
        group.repeatCount = HUGE
        group.duration = 2.0
        group.autoreverses = true
        //arrowLayer.add(group, forKey: nil)
        
        
    }
}
