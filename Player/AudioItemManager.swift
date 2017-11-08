//
//  AudioItemManager.swift
//  Player
//
//  Created by roza on 2017/11/08.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

import Utils


class AudioItemManager {
    
    private(set) var items: [AudioItem] = []
    
    func load() {
        items = DocumentUtil.list(dir: .documents).map{ AudioItem(path: $0) }
    }
}
