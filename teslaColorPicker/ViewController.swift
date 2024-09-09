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
    
    @IBOutlet weak var carBody: UIImageView!
    
    @IBOutlet weak var greenChange: UISlider!
    
    
    @IBOutlet weak var blueChange: UISlider!
    
    
    
    @IBOutlet weak var redText: UILabel!
    
    
    @IBOutlet weak var GreenText: UILabel!
    
    
    @IBOutlet weak var BlueText: UILabel!
    
    
    @IBOutlet weak var `switch`: UISegmentedControl!
    
    let pics = ["teslabk-0", "teslabk-1"]
    var index = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置遮罩
        var image = UIImage(named: "carBody")
        let carBodyImageView = UIImageView(image: image)
        carBodyImageView.frame = carBody.bounds
        carBodyImageView.contentMode = .scaleAspectFit
        carBody.mask = carBodyImageView
        carBody.backgroundColor = UIColor(red: 0, green: 222/255, blue: 0, alpha: 1)
        
            // Do any additional setup after loading the view.
        
        
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
