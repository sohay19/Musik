//
//  MusicModel.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit
import AVFoundation

struct MusicData {
    var title : String = ""
    var singer : String = ""
    var song : AVPlayerItem?
    var imgPath : String = ""
    
    var img : UIImage? {
        print("SPLIT============ \(imgPath.split(separator: ".")[0])")
        return UIImage(named: "\(imgPath.split(separator: ".")[0]).jpeg")
    }
    var totalTime : String {
        let timer = song?.duration.seconds
        let printTime = DateFormatter()
        
        return printTime.string(from: Date(timeIntervalSinceNow: timer ?? 0))
    }
    
    init (_ title: String, _ singer: String, _ song: AVPlayerItem, _ imgPath: String) {
        self.title = title
        self.singer = singer
        self.song = song
        self.imgPath = imgPath
    }
}
