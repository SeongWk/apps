//
//  ViewController.swift
//  PageControl
//
//  Created by seong_wook_lim on 2021/11/30.
//

import UIKit

class ViewController: UIViewController {
    var images = ["2.jpg", "4.jpg","5.jpg","6.jpg","7.jpg"]
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.red
        pageControl.currentPageIndicatorTintColor = UIColor.green
        imgView.image = UIImage(named: images[0])
        // Do any additional setup after loading the view.
    }

    @IBAction func PageNext(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

