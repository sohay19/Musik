//
//  MusicModel.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit
import AVFoundation

struct MusicData {
    var index : Int = 0
    var title : String = ""
    var singer : String = ""
    var song : AVPlayerItem?
    var imgPath : String = ""
    
    var img : UIImage? {
        return UIImage(named: "\(imgPath.split(separator: ".")[0]).jpeg")
    }
    
    init (index: Int, _ title: String, _ singer: String, _ song: AVPlayerItem, _ imgPath: String) {
        self.index = index
        self.title = title
        self.singer = singer
        self.song = song
        self.imgPath = imgPath
    }
}
