//
//  MainCell.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit

class MainViewCell : UICollectionViewCell {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var singer : UILabel!
        
    func updateData(_ data: Song) {
        imgView.image = data.imgPath
        title.text = data.songName
        singer.text = data.singer
    }
}
