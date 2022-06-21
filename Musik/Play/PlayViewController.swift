//
//  PlayViewController.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit

class PlayViewController: UIViewController {
    //표지
    @IBOutlet weak var lableTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    //슬라이더
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timer: UILabel!
    //버튼
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

extension PlayViewController {
    //버튼 상호작용
    func playMusic() {
        
    }
    
    func stopMusic() {
        
    }
    
    func prevMusic() {
        
    }
    
    func nextMusic() {
        
    }
    
    //슬라이더 조절
    func moveTime() {
        
    }
    
    //시간 업데이트
    func updateTime() {
        
    }
}
