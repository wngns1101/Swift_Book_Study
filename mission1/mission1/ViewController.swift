//
//  ViewController.swift
//  mission1
//
//  Created by juhoon lee on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {
    var minNum = 1
    var currentNum = 1
    var maxNum = 6
    
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: String(minNum) + ".png")
        // Do any additional setup after loading the view.
    }

    @IBAction func leftButtonClick(_ sender: UIButton) {
        if currentNum > minNum{
            currentNum -= 1
            imgView.image = UIImage(named: String(currentNum) + ".png")
        }
    }
    
    @IBAction func rightButtonClick(_ sender: Any) {
        if currentNum < maxNum{
            currentNum += 1
            imgView.image = UIImage(named: String(currentNum) + ".png")
        }
    }
}

