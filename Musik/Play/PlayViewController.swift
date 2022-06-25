//
//  PlayViewController.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit
import CoreMedia

class PlayViewController: UIViewController {
    //표지
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSinger: UILabel!
    @IBOutlet weak var img: UIImageView!
    //슬라이더
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var curTime: UILabel!
    //버튼
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnControllMusic: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnShuffle: UIButton!
    
    let musicManager = MusicManager()
    let myPlayer = MusicPlayer.shared
    
    var myData : MusicData?
    var timeObserver : Any?
    var isSeeking : Bool = false
    var isRand : Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
               
        //CMTime(seconds: 1, preferredTimescale: 10)
        //1 나누기 10 = 0.1초
        timeObserver = myPlayer.addPeridicTimeObserve(forInterval: CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main, using: updateTime)
        
        Start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        myPlayer.pause()
        myPlayer.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
    }
    
    func Start() {
        slider.value = 0
        setData()
        myPlayer.play()
        updateBtn()
    }
    
    func ChangeRandomData() {
        myData = musicManager.getData(Int.random(in: 0...musicManager.getCount() - 1))
        myPlayer.replaceCurrentItem(with: myData?.song)
    }
    
    func setData() {
        labelTitle.text = myData?.title
        labelSinger.text = myData?.singer
        img.image = myData?.img
        
        myPlayer.replaceCurrentItem(with: myData?.song)
        updateTime(time: CMTime.zero)
    }
}

extension PlayViewController {
    //버튼 상호작용
    @IBAction func cotrollMusic(_ sender: UIButton) {
        if myPlayer.isPlaying {
            myPlayer.pause()
        } else {
            myPlayer.play()
        }
        updateBtn()
    }
    
    func updateBtn() {
        var config : UIImage.Configuration
        var img : UIImage
        
        if myPlayer.isPlaying {
            config = UIImage.SymbolConfiguration(pointSize: 40)
            img = UIImage(systemName: "play.fill", withConfiguration: config)!
        } else {
            config = UIImage.SymbolConfiguration(pointSize: 40)
            img = UIImage(systemName: "pause.fill", withConfiguration: config)!
        }
        
        btnControllMusic.setImage(img, for: .normal)
    }
    
    @IBAction func prevMusic(_ sender: UIButton) {
        changeSong(isPrev: true)
    }
    
    @IBAction func nextMusic(_ sender: UIButton) {
        changeSong(isPrev: false)
    }
    
    func changeSong(isPrev: Bool) {
        if isRand {
            ChangeRandomData()
        } else {
            var index = myData?.index ?? 0
            if index <= 0 {
                index = isPrev ? 0 : index + 1
            } else if index >= musicManager.getCount() - 1  {
                index = isPrev ? index - 1 : musicManager.getCount() - 1
            } else {
                index = isPrev ? index - 1 : index + 1
            }
            
            myData = musicManager.getData(index)
            guard let item = myData?.song else {
                return
            }
            
            isPrev ? myPlayer.prev(with: item) : myPlayer.next(with: item)
        }
        Start()
    }
    
    @IBAction func clickShuffle() {
        isRand = !isRand
        
        if isRand {
            btnShuffle.tintColor = UIColor.darkGray
        } else {
            btnShuffle.tintColor = UIColor.secondaryLabel
        }
    }
    
    //슬라이더 조절
    @IBAction func beginDrag(_ sender: UISlider) {
        isSeeking = true
    }
    
    @IBAction func endDrag(_ sender: UISlider) {
        isSeeking = false
    }
    
    @IBAction func seek(_ sender:UISlider) {
        guard let item = myPlayer.curItem else { return }
        
        let pos = Double(sender.value)
        let sec = pos * item.duration.seconds
        myPlayer.seek(to: CMTime(seconds: sec, preferredTimescale: 100))
    }
    
    //시간 업데이트
    func updateTime(time: CMTime) {
        curTime.text = convertTime(sec: myPlayer.curTime)
        totalTime.text = convertTime(sec: myPlayer.totalTime)
        
        if isSeeking == false {
            slider.value = Float(myPlayer.curTime/myPlayer.totalTime)
            
            if myPlayer.curTime == myPlayer.totalTime {
                btnNext.sendActions(for: .touchUpInside)
            }
        }
    }
    
    func convertTime(sec: Double) -> String {
        guard sec.isNaN == false else { return "00:00" }
        let total = Int(sec)
        //분
        let min = total / 60
        //초
        let seconds = total % 60

        return String(format: "%02d:%02d", min, seconds)
    }
}
