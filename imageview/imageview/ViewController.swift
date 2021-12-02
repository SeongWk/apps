//
//  ViewController.swift
//  imageview
//
//  Created by seong_wook_lim on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnSize: UIButton!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        imgOn = UIImage(named: "littledeep_bulb_style1.png")
        imgOff = UIImage(named: "littledeep_bulb_style2.png")
        imgView.image = imgOn
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale : CGFloat = 1.5
        var newWidth : CGFloat, newHeight : CGFloat
        
        if(isZoom){
            
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnSize.setTitle("확대", for: .normal)
            
        }
        else{
            
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnSize.setTitle("축소", for: .normal)
            
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchimageOnOff(_ sender: UISwitch) {
        
        if sender.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
    
    
}

