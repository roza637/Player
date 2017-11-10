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
    
    private(set) var index: Int = 0
    private(set) var playing: AudioItem?
    var isShuffle: Bool = false
    var isLoop: Bool = false
    
    let queueModel = PlayQueueModel.instance
    
    private var player: AVAudioPlayer?
    
    func play() {
        if let player = player {
            playRevert(player: player)
        } else {
            playNew()
        }
    }
    
    private func playNew() {
        AudioItemManager.shared.load()
        playQueue = AudioItemManager.shared.items
        if let url = playQueue.first?.path.fileUrl {
            do {
                playing = playQueue.first
                player = try AVAudioPlayer(contentsOf: url)
                player?.prepareToPlay()
                player?.play()
            } catch let error {
                debugPrint("play error:\(error.localizedDescription)")
                return
            }
        }
    }
    
    private func playRevert(player: AVAudioPlayer) {
        player.play()
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
    
    func shufflePlay() {
        queueModel.shuffle()
    }
    
}

class PlayQueueModel {
    static let instance = PlayQueueModel()
    private init() { }
    
    private(set) var queue: [AudioItem] = []
    private(set) var index: Int = 0
    
    func current() -> AudioItem? {
        return queue.dropFirst(index).first
    }
    
    func toNext() -> AudioItem? {
        index = min(index + 1, queue.count - 1)
        return current()
    }
    
    func toPrevious() -> AudioItem? {
        index = max(0, index - 1)
        return current()
    }
    
    func shuffle() {
        var tmp = queue.shuffled
        let playing = queue.dropFirst(index).first
        if let playing = playing, let index = tmp.map({ $0.path }).index(of: playing.path) { //なぜかmapの()を省略するとエラーになる
            tmp.move(from: index, to: 0)
        }
    }
    
}
