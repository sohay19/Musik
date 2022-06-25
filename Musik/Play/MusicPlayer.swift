//
//  MusicPlayer.swift
//  Musik
//
//  Created by 소하 on 2022/06/24.
//

import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    
    private let player = AVPlayer()
    
    var curItem : AVPlayerItem? {
        return player.currentItem
    }
    
    var curTime : Double {
        return player.currentItem?.currentTime().seconds ?? 0.0
    }
    
    var totalTime : Double {
        return player.currentItem?.duration.seconds ?? 0.0
    }
    
    var isPlaying : Bool {
        guard player.currentItem != nil else { return false }
        if player.currentItem?.timebase?.rate != 0 { return true }
        else { return false }
    }
    
    init() { }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    func next(with item: AVPlayerItem) {
        replaceCurrentItem(with: item)
    }
    
    func prev(with item: AVPlayerItem) {
        replaceCurrentItem(with: item)
    }
    
    func seek(to time: CMTime) {
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with item: AVPlayerItem?) {
        player.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
        player.replaceCurrentItem(with: item)
    }
        
    func addPeridicTimeObserve(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
