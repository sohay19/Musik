//
//  MusicManager.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit
import AVFoundation

class MusicManager {
    var songDataList : [MusicData] = []
    
    init() {
        loadMusic()
    }
    
    func loadMusic() {
        let urlList = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        
        for (i, url) in urlList.enumerated() {
            let item = AVPlayerItem(url: url)
            
            let title = item.loadMetaData().title
            let singer = item.loadMetaData().singer
            songDataList.append(MusicData(index: i, title ?? "", singer ?? "", item, url.pathComponents[url.pathComponents.count - 1]))
        }
    }
        
    func getData(_ index: Int) -> MusicData {
        return songDataList[index]
    }
    
    func getCount() -> Int {
        return songDataList.count
    }
}
