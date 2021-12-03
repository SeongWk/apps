//
//  ViewController.swift
//  audioplayer
//
//  Created by seong_wook_lim on 2021/12/03.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnplay(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        playvideo(url: url)
        
    }
    @IBAction func btnplay2(_ sender: UIButton)
    {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playvideo(url: url)
        
    }
    private func playvideo(url:NSURL)
    {
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController,animated: true)
        {
            player.play()
        }
    }
  
}

