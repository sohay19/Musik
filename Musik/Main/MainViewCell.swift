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
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.backgroundColor = UIColor.gray.cgColor
            }
            else {
                self.layer.backgroundColor = nil
            }
        }
    }
    
    func updateData(_ data: MusicData) {
        imgView.image = data.img
        title.text = data.title
        singer.text = data.singer
    }
}
