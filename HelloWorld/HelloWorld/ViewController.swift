//
//  ViewController.swift
//  HelloWorld
//
//  Created by juhoon lee on 2023/02/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var lblHello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello " + txtName.text!
    }
    
}

