//
//  ViewController.swift
//  Player
//
//  Created by roza on 2017/11/08.
//  Copyright © 2017年 roza. All rights reserved.
//

import UIKit

import Utils

class ViewController: UIViewController {
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var pause: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        debugPrint(DocumentUtil.Directory.documents.path)
        play.onTouchUpInside{ _ in
            AudioPlayerModel.instance.play()
        }
        
        pause.onTouchUpInside{ _ in
            AudioPlayerModel.instance.pause()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

