//
//  MainHeaderView.swift
//  Musik
//
//  Created by 소하 on 2022/06/24.
//

import UIKit

class MainHeaderView : UICollectionReusableView {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var labelMusic : UILabel!
    
    var myData : MusicData?
    var myHandler : ((MusicData) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 5
    }
    
    func updateData(_ data: MusicData, handler: @escaping (MusicData) -> Void)
    {
        self.myData = data
        
        guard let curData = myData else {
            return
        }
        
        imgView.image = curData.img
        labelMusic.text = "\(curData.singer) - \(curData.title)"
        
        self.myHandler = handler
    }
    
    @IBAction func clickHeader(_ sender: UIButton) {
        guard let curData = myData else {
            return
        }
        myHandler?(curData)
    }
}
