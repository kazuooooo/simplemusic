//
//  ViewController.swift
//  SimpleMusic
//
//  Created by 松本和也 on 2016/05/14.
//  Copyright © 2016年 kazuya.matsumoto. All rights reserved.
//

import UIKit //基本ライブラリ
import AVFoundation //音声再生
//import ReplayKit //画面キャプチャ

class ViewController: UIViewController {

    let soundManager = SoundManager()
    let soundArray:[Int] = [1,2,3,4,5,6,7]
    let timeArray:[Double] = [1.0, 1.5, 2.0, 3.0, 2.0, 1.5, 1.0]
    var count = 0
    
    @IBAction func buttonTapped(sender:UIButton){
        soundManager.play("\(sender.tag).mp3")
        doAnimation(sender)
    }
    
    
    func doAnimation(view:UIView){
        UIView.animateWithDuration(0.5,
                                   delay: 0,
                                   options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                   view.center = CGPointMake(view.center.x, view.center.y - 20)
        }) { (_) in
            UIView.animateWithDuration(0.5,
                                       delay: 0,
                                       options: UIViewAnimationOptions.CurveEaseInOut,
                                       animations: {
                                       view.center = CGPointMake(view.center.x, view.center.y + 20)
            }) { (_) in
                
            }
            
        }
    }
//    @IBAction func recordTapped(sender: UIButton){
//        print("Start Record");
//        RPScreenRecorder.sharedRecorder().startRecordingWithMicrophoneEnabled(true, handler: nil)
//    }
//    
//    @IBAction func stopTapped(sender: UIButton){
//        print("Stop Record");
//        RPScreenRecorder.sharedRecorder().stopRecordingWithHandler{ (previewController: RPPreviewViewController?, error:NSError?) in
//            self.presentViewController(previewController!, animated: true, completion: nil)
//        }
//    }
    
    @IBAction func startAutoPlay(sender:AnyObject){
        count = 0
        autoPlay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func autoPlay(){
        if count >= soundArray.count {
            return
        }
        soundManager.play("\(soundArray[count])" + ".mp3")
        let button = self.view.viewWithTag(soundArray[count])
        doAnimation(button!)
        
        let interval:NSTimeInterval = timeArray[count]
        NSTimer.scheduledTimerWithTimeInterval(interval,
                                               target: self, //自分自身をメッセージを送るターゲットにする
                                               selector: #selector(autoPlay), // #selector(メソッド名で)ターゲットにメッセージを送る
                                               userInfo: nil, //ターゲットに渡す情報
                                               repeats: false) // repeat
        count += 1
//        for (index, element) in soundArray.enumerate() {
//            print("Item \(index): \(element)")
//            soundManager.play(element + ".mp3")
//            let interval:NSTimeInterval = timeArray[count]
//                    NSTimer.scheduledTimerWithTimeInterval(interval,
//                                                           target: self,
//                                                           selector: #selector(autoPlay),
//                                                           userInfo: nil,
//                                                           repeats: false)
//        }
    }
}

