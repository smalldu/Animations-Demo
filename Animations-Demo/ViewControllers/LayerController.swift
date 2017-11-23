//
//  LayerController.swift
//  Animations-Demo
//
//  Created by Zoey Shi on 2017/11/23.
//  Copyright © 2017年 Small Du. All rights reserved.
//

import UIKit

class CustomView: UIView {
  
  override class var layerClass: AnyClass {
    return CustomLayer.self
  }
  
}

class CustomLayer: CALayer {
  
}

class LayerController: UIViewController {
  
  @IBOutlet weak var view1: UIView!
  @IBOutlet weak var view2: UIView!
  @IBOutlet weak var view3: UIView!
  @IBOutlet weak var clockView: UIView!
  @IBOutlet weak var arrowView: UIView!
  
  @IBOutlet weak var view4: UIView!
  @IBOutlet weak var view5: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    view1.clipsToBounds
    view1.layer.contents = #imageLiteral(resourceName: "rabbit").cgImage
    view1.layer.contentsGravity = kCAGravityTop
    view1.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
//    view1.layer.contentsScale = UIScreen.main.scale
//    view1.layer.contentsScale = #imageLiteral(resourceName: "rabbit").scale
//    view1.layer.addSublayer(<#T##layer: CALayer##CALayer#>)
//    view1.layer.convert(<#T##p: CGPoint##CGPoint#>, to: <#T##CALayer?#>)
    
    view3.layer.position = CGPoint.zero
    view3.layer.anchorPoint = CGPoint.zero
    
    clockView.backgroundColor = UIColor.clear
    clockView.layer.contents = #imageLiteral(resourceName: "clock").cgImage
    clockView.layer.contentsScale = #imageLiteral(resourceName: "clock").scale
    
    arrowView.layer.contents = #imageLiteral(resourceName: "arrow").cgImage
    arrowView.layer.contentsScale = #imageLiteral(resourceName: "arrow").scale
    arrowView.layer.backgroundColor = UIColor.clear.cgColor
    arrowView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
    let opts: UIViewAnimationOptions = [ .autoreverse , .repeat ]
    UIView.animate(withDuration: 1 , delay: 0, options: opts, animations: {
      self.arrowView.transform = CGAffineTransform.identity.rotated(by: CGFloat( Double.pi/2 ) )
    }, completion: nil)
    
    view4.backgroundColor = UIColor.white
    view4.layer.shadowColor = UIColor.black.cgColor
    view4.layer.shadowOffset = CGSize(width: 0, height: 3)
    view4.layer.shadowOpacity = 0.6
    view4.layer.shadowRadius = 10
    
//    view4.layer.shadowPath
    
    view5.backgroundColor = UIColor.clear
    view5.layer.contents = #imageLiteral(resourceName: "cat").cgImage
    view5.layer.contentsScale = #imageLiteral(resourceName: "cat").scale
    
    
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let layer = CALayer()
    layer.contents = #imageLiteral(resourceName: "star").cgImage
    layer.contentsScale = #imageLiteral(resourceName: "star").scale
    layer.frame = view5.bounds
    view5.layer.mask = layer
  }
  
}

