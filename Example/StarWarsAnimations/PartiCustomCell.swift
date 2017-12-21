//
//  PartiCustomCell.swift
//  StarWarsDemo
//
//  Created by Mr.Jeen on 2017/12/21.
//  Copyright © 2017年 Yalantis. All rights reserved.
//

import UIKit

class PartiCustomCell: CAEmitterCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSub()
    }
    override init() {
        super.init()
        setupSub()
        startTimer()
    }
    
    func setupSub() {
        self.contents = UIImage(named: "qipao_113")!.cgImage
        self.birthRate = 10
        
        self.lifetime = 50
        self.lifetimeRange = 5
        
        self.velocity = 20
        self.velocityRange = 10
        
        self.scale = 0.02
        self.scaleRange = 0.1
        self.scaleSpeed = 0.02
    }
    
    var partiTimer: Timer?
    var idx:Int = 0
    
    func startTimer() {
        
        if partiTimer == nil {
            partiTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(imageChangedd), userInfo: nil, repeats: true)
        }
        
    }
    
    deinit {
        if partiTimer != nil {
            partiTimer?.invalidate()
            partiTimer = nil
        }
    }
    
    func imageChangedd() {
//        self.contents = UIImage(named: "spark")!.cgImage
//        idx += 1
//        switch idx  {
//        case 1:
//            self.contents = UIImage(named: "video_info_s1")!.cgImage
//        case 2:
//            self.contents = UIImage(named: "video_info_s2")!.cgImage
//
//        default:
//            idx = 0
//            self.contents = UIImage(named: "spark")!.cgImage
//        }
        
    }
}
