//
//  ViewController.swift
//  pageControlMission
//
//  Created by juhoon lee on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var pageCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageCount.text = "1"
        pageControl.pageIndicatorTintColor = UIColor.red
        pageControl.currentPageIndicatorTintColor = UIColor.green
    }

    @IBAction func slidePage(_ sender: UIPageControl) {
        pageCount.text = String(pageControl.currentPage+1)
    }
    
}

