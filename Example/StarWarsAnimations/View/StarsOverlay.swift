//
//  StarsOverlay.swift
//  StarWarsAnimations
//
//  Created by Artem Sidorenko on 9/11/15.
//  Copyright © 2015 Yalantis. All rights reserved.
//

import UIKit

class StarsOverlay: UIView {

    override class var layerClass : AnyClass {
        return CAEmitterLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    fileprivate var emitter: CAEmitterLayer {
        return layer as! CAEmitterLayer
    }
    
    fileprivate var particle: CAEmitterCell!
    
    func setup() {
        emitter.emitterMode = kCAEmitterLayerOutline
        /* emitter.emitterShape = kCAEmitterLayerCircle */
        /* emitter.renderMode = kCAEmitterLayerOldestFirst */
        emitter.preservesDepth = true
        
        particle = PartiCustomCell()
        particle.birthRate = 0.6
        particle.lifetimeRange = 5
        
        
        /*
//        particle = CAEmitterCell()
//
//        particle.contents = UIImage(named: "spark")!.cgImage
//        particle.birthRate = 10
//
//        particle.lifetime = 50
//        particle.lifetimeRange = 5
//        
//        particle.velocity = 20
//        particle.velocityRange = 10
//        
//        particle.scale = 0.02
//        particle.scaleRange = 0.1
        particle.scaleSpeed = 0.02
        */
        particle.scale = 0.03
        particle.scaleSpeed = 0.002
        
        emitter.emitterCells = [particle]
    }
    
    var emitterTimer: Timer?
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        if self.window != nil {
            if emitterTimer == nil {
                emitterTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(StarsOverlay.randomizeEmitterPosition), userInfo: nil, repeats: true)
            }
        } else if emitterTimer != nil {
            emitterTimer?.invalidate()
            emitterTimer = nil
        }
    }
    
    func randomizeEmitterPosition() {
        let sizeWidth = max(bounds.width, bounds.height)
        let radius = CGFloat(arc4random()).truncatingRemainder(dividingBy: sizeWidth)
        //// 发射源尺寸大小
        /* emitter.emitterSize = CGSize(width: radius, height: radius) */
        /* particle.birthRate = 0 + sqrt(Float(radius)) */
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        /* emitter.emitterPosition = self.center */
        /* emitter.emitterSize = self.bounds.size */
        //
        emitter.emitterPosition = CGPoint.init(x: self.center.x, y: self.bounds.height)
        emitter.emitterSize = CGSize.init(width: 200, height: 100)
        emitter.backgroundColor = UIColor.init(red: 0.043, green: 1.000, blue: 0.984, alpha: 0.6).cgColor
        // 发射源的形状
        emitter.emitterShape      = kCAEmitterLayerLine;
        // 渲染模式
        emitter.renderMode        = kCAEmitterLayerAdditive;
        // 发射方向
        emitter.velocity          = Float(Double.pi/2);
        // 随机产生粒子
        //emitter.seed              = (arc4random() % 100) + 1;
        // 不超出范围
        emitter.frame = self.bounds;
        emitter.masksToBounds = true;
        
    }
}
