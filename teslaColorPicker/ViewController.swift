//
//  ViewController.swift
//  teslaColorPicker
//
//  Created by 林家齊 on 2024/9/8.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBOutlet weak var redChange: UISlider!
    
    @IBOutlet weak var carBody: UIImageView!
    
    @IBOutlet weak var greenChange: UISlider!
    
    
    @IBOutlet weak var blueChange: UISlider!
    
    
    @IBOutlet weak var redText: UILabel!
    
    @IBOutlet weak var GreenText: UILabel!
    
    @IBOutlet weak var BlueText: UILabel!
    
    @IBOutlet weak var `switch`: UISegmentedControl!
   
    
    @IBOutlet weak var carView: UIView!
    
    
    let pics = ["teslabk-0", "teslabk-1"]
    var index = 0
    
    var nighttimeColor: UIColor = .white
    var daytimeColor: UIColor = .white
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置遮罩
        let maskImageView = UIImageView(image: .car)
         maskImageView.frame = carView.bounds
         maskImageView.contentMode = .scaleAspectFit
        carView.mask = maskImageView
            // Do any additional setup after loading the view.
        
    }

    
    @IBAction func changeColor(_ sender: Any) {
        carView.backgroundColor = UIColor(red:CGFloat(redChange.value), green: CGFloat(greenChange.value), blue:CGFloat(blueChange.value), alpha: 1)
    }
    
    
    
    
    
    @IBAction func random(_ sender: Any) {
        redChange.value = Float.random(in: 0...1)
        greenChange.value = Float.random(in: 0...1)
        blueChange.value = Float.random(in: 0...1)
        changeColor(self)
        carView.backgroundColor = UIColor(red:CGFloat(redChange.value), green: CGFloat(greenChange.value), blue:CGFloat(blueChange.value), alpha: 1)
        
    }
    
    
    
    
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex

           if index == 0 { // Nighttime
               daytimeColor = carView.backgroundColor ?? .white
               carView.backgroundColor = nighttimeColor
           } else { // Daytime
               nighttimeColor = carView.backgroundColor ?? .white
               carView.backgroundColor = daytimeColor
           }

           // 更新背景圖片
           let name = pics[index]
           background.image = UIImage(named: name)

           // 更新 sliders 的 RGB 值
           if let currentColor = carView.backgroundColor {
               var red: CGFloat = 0
               var green: CGFloat = 0
               var blue: CGFloat = 0
               var alpha: CGFloat = 1

               currentColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

               redChange.value = Float(red)
               greenChange.value = Float(green)
               blueChange.value = Float(blue)
           }
    
        }
// 先留言：這段做不出來
    @IBAction func changeNumbers(_ sender: Any) {
        // 更新顏色
        carView.backgroundColor = UIColor(
            red: CGFloat(redChange.value),
            green: CGFloat(greenChange.value),
            blue: CGFloat(blueChange.value),
            alpha: 1
        )
        
        // 更新數值顯示在對應的 UILabel 上
        redText.text = "Color R: \(Int(redChange.value * 255))"
        GreenText.text = "Color G: \(Int(greenChange.value * 255))"
        BlueText.text = "Color B: \(Int(blueChange.value * 255))"
    }
    
    
    
    
        }
    



