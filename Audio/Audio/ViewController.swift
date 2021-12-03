//
//  ViewController.swift
//  Audio
//  음악은 "over the horizon -SUGA"를 참조함
//  Created by seong_wook_lim on 2021/12/03.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!
    var audiofile : URL!
    let MAX_volume : Float = 10.0
    var progresstimer : Timer!
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    @IBOutlet var ProgressBar: UIProgressView!
    
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var ChangVolume: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        audiofile = Bundle.main.url(forResource: "1", withExtension: "mp3")
        initPlay()
        // Do any additional setup after loading the view.
    }
    func initPlay()
    {
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audiofile)
        }
        catch let error as NSError{
                print("Error-play: \(error)")
        }
        ChangVolume.maximumValue = MAX_volume
        ChangVolume.value = 1.0
        ProgressBar.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = ChangVolume.value
        
        lblEndTime.text = convertNsTimeInterval(audioPlayer.duration)
        lblCurrentTime.text = convertNsTimeInterval(0)
        setbuttons(true, pause: false, stop: false)
        
        
        
    }
    func setbuttons( _ play:Bool, pause:Bool, stop:Bool)
    {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
        
        
        
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progresstimer.invalidate()
        setbuttons(true, pause: false, stop: false)
    }
    @objc func updatePlayTime()
    {
        lblCurrentTime.text = convertNsTimeInterval(audioPlayer.currentTime)
        ProgressBar.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    func convertNsTimeInterval(_ time:TimeInterval) -> String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min,sec)
        return strTime
    }
    
    @IBAction func btnPlayaudio(_ sender: UIButton) {
        audioPlayer.play()
        setbuttons(false, pause: true, stop: true)
        progresstimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        
    }
    @IBAction func btnPauseaudio(_ sender: UIButton) {
        audioPlayer.pause()
        setbuttons(true, pause: false, stop: true)
        
    }
    @IBAction func btnStopaudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNsTimeInterval(0)
        setbuttons(true, pause: true, stop: false)
        progresstimer.invalidate()
        
    }
    @IBAction func slCHvolume(_ sender: UISlider) {
        audioPlayer.volume = ChangVolume.value
    }
    
}

