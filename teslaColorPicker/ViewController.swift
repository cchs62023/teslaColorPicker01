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
    
    
    @IBOutlet weak var redText: UILabel!
    
    @IBOutlet weak var GreenText: UILabel!
    
    
    @IBOutlet weak var BlueText: UILabel!
    
    
    @IBOutlet weak var `switch`: UISegmentedControl!
    
    let pics = ["teslabk-0", "teslabk-1"]
    var index = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置遮罩
        if let maskImage = carMask.image?.cgImage {
            let maskLayer = CALayer()
            maskLayer.contents = maskImage
            maskLayer.frame = carImage.bounds  // 确保遮罩层与车身图片大小相同
            maskLayer.contentsGravity = .resizeAspectFill  // 保持宽高比填充
            
            carImage.layer.mask = maskLayer
            carImage.layer.masksToBounds = true
            
            // 隐藏遮罩图片视图，因为我们只需要它的图像数据
            carMask.isHidden = true
            
            carImage.layer.compositingFilter = "sourceAtop"
            // Do any additional setup after loading the view.
        }
        
        
    }
    
    
    @IBAction func changeColor(_ sender: Any) {
        let color = UIColor(red: CGFloat(redChange.value),
                            green: CGFloat(greenChange.value),
                            blue: CGFloat(blueChange.value),
                            alpha: 1)
        carImage.backgroundColor = color
    }
    
    
    @IBAction func random(_ sender: Any) {
        redChange.value = Float.random(in: 0...1)
        greenChange.value = Float.random(in: 0...1)
        blueChange.value = Float.random(in: 0...1)
        changeColor(self)
        
        
    }
    
    
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        let name = pics[index]
        background.image = UIImage(named: name)
        
        
    }
    
}
