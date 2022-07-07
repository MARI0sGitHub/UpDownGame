//
//  ViewController.swift
//  UpDownGame
//
//  Created by MAC BOOK PRO 2013 EARLY on 2022/07/01.
//  Copyright © 2022 cpp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue : Int = 0
    var tryCount : Int = 0
    //변수명 수정시에 우클릭 Refactor -> Rename
    //IBOutlet은 스토리 보드에 있는 요소와 연결이 되는 어노테이션
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel : UILabel!
    @IBOutlet weak var sliderValueLabel : UILabel!
    @IBOutlet weak var minimumValueLabel : UILabel!
    @IBOutlet weak var maximumValueLabel : UILabel!
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30) //0 ~ 30까지 맞추어야할 랜덤 숫자를 저장하는 변수
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal) //슬라이더 이미지 설정, 아무때나
        reset()
    }
    
    //IBAction 은 동작, 이벤트에 반응하는 액션
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil) //화면에 보여주기 위함
    }

    @IBAction func touchUpHitButton (_ sender: UIButton) {
        print(slider.value)
        let hitValue : Int = Int(slider.value)
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        if randomValue == hitValue {
            showAlert(message: "YOU HIT!!")
            reset()
        }
        else if tryCount >= 5{
            showAlert(message: "YOU LOSE...")
            reset()
        }
        else if randomValue > hitValue{
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        }
        else if randomValue < hitValue {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("touch up reset button")
        reset()
    }
    
}

