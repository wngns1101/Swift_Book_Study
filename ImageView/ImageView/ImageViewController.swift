//
//  ViewController.swift
//  ImageView
//
//  Created by juhoon lee on 2023/02/14.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imgView: UIImageView!
    
    // 내가 만든 뷰를 불러왔을 때 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

    // 확대와 축소를 하는 버튼을 눌렀을 때 작동하는 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom{
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    // 스위치 킬 때와 꺼질 때 작동하는 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
}

