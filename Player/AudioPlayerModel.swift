//
//  AudioPlayerModel.swift
//  Player
//
//  Created by roza on 2017/11/08.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation
import AVFoundation

import Utils

class AudioPlayerModel {
    static let instance = AudioPlayerModel()
    private init() { }
    
    private var playQueue: [AudioItem] = []
    
    var isShuffle: Bool = false
    var isLoop: Bool = false
    
    private var player: AVAudioPlayer?
    
    func play() {
        player?.pause()
        //TODO
        AudioItemManager.shared.load()
        playQueue = AudioItemManager.shared.items
        if let url = playQueue.first?.path.fileUrl {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.prepareToPlay()
                player?.play()
            } catch {
                return
            }
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func next() {
        //TODO
    }
    
    func previous() {
        //TODO
    }
    
    func shuffle() {
        //TODO
    }

}
