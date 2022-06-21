//
//  MainModel.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit

//MARK: - MainModel
struct MainViewData {
    var singer : String = ""
    var songName : String = ""
    var imgPath : UIImage? {
        get {
            return UIImage(named: "\(songName).jpeg")
        }
    }
    
    init(_ name: String, _ song: String) {
        self.singer = name
        self.songName = song
    }
}
