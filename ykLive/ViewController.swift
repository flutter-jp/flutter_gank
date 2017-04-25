//
//  ViewController.swift
//  ykLive
//
//  Created by xiaomo on 2017/04/25.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var live: YKCell!
    var playerView : UIView!
    @IBOutlet weak var loadingLabel: UILabel!
    var ijkPlayer : IJKMediaPlayback!
    
    @IBOutlet weak var background: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setBg()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadingLabel.isHidden = true
        
        if(!self.ijkPlayer.isPlaying()) {
            self.ijkPlayer.prepareToPlay()   // 播放
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backTo(_ sender: UIButton) {
        // 停止播放
        self.ijkPlayer.shutdown()
        
        _ = navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /// 添加模糊背景
    func setBg() {
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = background.frame
        background.addSubview(effectView)
    }
    
    func setPlayerView() {
        // 用于显示播放器的视图
        self.playerView = UIView(frame : view.bounds)
        view.addSubview(self.playerView)
        
        // 创建播放器
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkPlayer.view!
        
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        
        // 将播放的view添加到视图中
        playerView.addSubview(pv)
        
        // 自适应缩放
        ijkPlayer.scalingMode = .aspectFill
    }
}

