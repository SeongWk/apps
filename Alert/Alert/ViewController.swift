//
//  ViewController.swift
//  Alert
//
//  Created by seong_wook_lim on 2021/11/26.
//

import UIKit

class ViewController: UIViewController
{
    
    let imgOn = UIImage(named: "littledeep_bulb_style1.png")
    let imgOff = UIImage(named: "littledeep_bulb_style2.png")
    let imgRemove = UIImage(named: "aempty.png")
    
    var isLampOn = true
    @IBOutlet var lamping: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lamping.image = imgOn
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLampOn(_ sender: UIButton)
    {
        
        if(isLampOn == true)
        {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 on 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
            
        }
        else
        {
            lamping.image = imgOn
            isLampOn=true
            
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton)
    {
        if(isLampOn)
        {
            let lampOffAlert = UIAlertController(title: "끄기", message: "off 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler:{ Action in self.lamping.image = self.imgOff
                self.isLampOn = false}
            )
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert,animated: true,completion: nil)
            
        }
        
    }
    @IBAction func btnLampRemove(_ sender: UIButton)
    {
        let lampRemoveAlert = UIAlertController(title: "제거", message: "제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)

        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lamping.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다 (on).", style: UIAlertAction.Style.default) {
            ACTION in self.lamping.image = self.imgOn
            self.isLampOn=true
        }
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lamping.image = self.imgRemove
            self.isLampOn=false
        })

        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)

        present(lampRemoveAlert, animated: true, completion: nil)
        
    }

}

