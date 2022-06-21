//
//  AVExtension.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit
import AVFoundation

extension AVPlayerItem {
    func loadMetaData() -> (title: String?, singer: String?) {
        let metaDataList = asset.metadata
        
        var myTitle : String?
        var mySinger : String?
        
        for meta in metaDataList {
            if !meta.title.isEmpty {
                myTitle = meta.title
            }
            
            if !meta.singer.isEmpty {
                mySinger = meta.singer
            }
        }
        
        return (title: myTitle, singer: mySinger)
    }
}

extension AVMetadataItem {
    var title : String {
        guard let key = commonKey?.rawValue, key == "title" else {
            return ""
        }
        return stringValue ?? ""
    }
    
    var singer : String {
        guard let key = commonKey?.rawValue, key == "artist" else {
            return ""
        }
        return stringValue ?? ""
    }
}
