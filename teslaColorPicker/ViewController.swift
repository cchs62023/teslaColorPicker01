//
//  ViewController.swift
//  teslaColorPicker
//
//  Created by 林家齊 on 2024/9/8.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var carImage: UIImageView!
    
    
    @IBOutlet weak var redChange: UISlider!
    
    
    @IBOutlet weak var greenChange: UISlider!
    
    
    @IBOutlet weak var blueChange: UISlider!
    
    
    @IBOutlet weak var carMask: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置遮罩
            if let maskImage = carMask.image?.cgImage {
                let maskLayer = CALayer()
                maskLayer.contents = maskImage
                maskLayer.frame = carImage.bounds
                carImage.layer.mask = maskLayer
                carImage.layer.masksToBounds = true
        
        
        
        
        // Do any additional setup after loading the view.
    }




}
}
