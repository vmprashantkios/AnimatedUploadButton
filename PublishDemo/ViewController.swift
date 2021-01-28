//
//  ViewController.swift
//  PublishDemo
//
//  Created by Prashant on 26/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnUpload:AnimatedButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view.
    }

    @IBAction func btnUploadAction(_ sender:UIButton){
        
        btnUpload.startAnimate()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            self.btnUpload.stopAnimate()
        }
    }
    
    

}

