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
    
    @IBOutlet weak var background: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setBg()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backTo(_ sender: UIButton) {
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
}

