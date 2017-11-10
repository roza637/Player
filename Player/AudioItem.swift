//
//  AudioItem.swift
//  Player
//
//  Created by roza on 2017/11/08.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

protocol ItemListProtocol {
    var title: String {get}
    var itemList: [AudioItem] {get}
}

class AudioItemList: ItemListProtocol {
    var title: String
    var itemList: [AudioItem]
    
    init(title: String, list: [AudioItem]) {
        self.title = title
        self.itemList = list
    }
}

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
    
    var asset: AVAsset {
        return AVAsset(url: URL(fileURLWithPath: path))
    }
    
    var title: String? {
        return asset.commonMetadata.first{ $0.identifier == AVMetadataCommonKeyTitle }?.stringValue
    }
    
    var albumName: String? {
        return asset.commonMetadata.first{ $0.identifier == AVMetadataCommonKeyAlbumName }?.stringValue
    }
    
    var artist: String? {
        return asset.commonMetadata.first{ $0.identifier == AVMetadataCommonKeyArtist }?.stringValue
    }
    
    var artWork: UIImage? {
        return asset.commonMetadata.first{ $0.identifier == AVMetadataCommonKeyArtwork }?.dataValue.flatMap{ UIImage(data: $0) }
    }
    
}
