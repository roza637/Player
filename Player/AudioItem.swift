//
//  AudioItem.swift
//  Player
//
//  Created by roza on 2017/11/08.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation
import AVFoundation

class AudioItem {
    var path: String
    
    init(path: String) {
        self.path = path
    }
    
    var audioFile: AVAudioFile? {
        do {
            return try AVAudioFile(forReading: URL(fileURLWithPath: path))
        } catch {
            return nil
        }
    }
}
