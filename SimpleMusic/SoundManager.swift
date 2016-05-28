//
//  SoundManager.swift
//  SimpleMusic
//
//  Created by 松本和也 on 2016/05/14.
//  Copyright © 2016年 kazuya.matsumoto. All rights reserved.
//

import UIKit
import AVFoundation

class SoundManager: NSObject {
    //    ?はオプショナル型
    var player:AVAudioPlayer? = nil
    var soundVolume = 1.0
    //    sender は押されたボタン自身のこと
    func play(fileName:String){
        print("Tapped!");
        
        //        letは定数
        //        パスの読み込み(NSBundle.mainBundleにアセットが置かれている
        //        stringByAppendingPathComponentメソッドでファイル名を指定
        let soundPath = (NSBundle.mainBundle().bundlePath as NSString).stringByAppendingPathComponent(fileName)
        
        //        明示的に型を指定したい場合は変数名:型で指定する
        //        ?部分はオプショナル型
        //        nilを入れることができるのがoptional型できないのが通常型
        let url:NSURL? = NSURL.fileURLWithPath(soundPath)
        //        player?で
        player?.stop()
        player = nil
        //        !はオプショナル変数のアンラップ
        player = try? AVAudioPlayer(contentsOfURL: url!)
        //        playerが存在していれば処理を行う
        if let player = player{
            player.prepareToPlay()
            player.play()
        }
    }
}
