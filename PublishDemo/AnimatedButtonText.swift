//
//  AnimatedButtonText.swift
//  PublishDemo
//
//  Created by Prashant on 27/01/21.
//

import UIKit

class AnimatedButtonText: CATextLayer {
    
    init(frame:CGRect,font:UIFont,text:String,allignment:UIControl.ContentHorizontalAlignment,color:UIColor) {
        super.init()
        
        self.frame = frame
        self.string = text
        self.font = CGFont(font.fontName as CFString)
        self.fontSize = font.pointSize
        self.alignmentMode = alignment(allignment: allignment)
        self.isWrapped = true
        self.foregroundColor = color.cgColor
        
    }
    
    
    func alignment(allignment:UIControl.ContentHorizontalAlignment)->CATextLayerAlignmentMode{
        
        switch allignment {
       
        case .left:
            return .left
        case .center:
            return .center
        case .right:
            return .right
        default:
            return .center
       
        }
    }
    
    func setText(text:String){
        
        self.string = text
    }
    
    override init(layer: Any) {
        
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
