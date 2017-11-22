//
//  ViewController.swift
//  Animations-Demo
//
//  Created by Zoey Shi on 2017/11/21.
//  Copyright © 2017年 Small Du. All rights reserved.

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var view1: UIView!
  var effectView: UIVisualEffectView!
  @IBOutlet weak var view2: UIView!
  @IBOutlet weak var view3: UIView!
  @IBOutlet weak var view4: UIView!
  var pOrig: CGPoint = CGPoint.zero
  var pFinal: CGPoint = CGPoint.zero
  
  @IBOutlet weak var view5: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    UIView.animate(withDuration: 0.4) {
//      self.view.backgroundColor = UIColor.red
//      UIView.performWithoutAnimation {
//        self.view.alpha = 0
//      }
//    }
//    UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: UIViewAnimationOptions, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//    UIViewAnimationOptions.curveEaseIn
//    UIViewAnimationOptions.curveEaseOut
//    UIViewAnimationOptions.curveEaseInOut
//    UIViewAnimationOptions.curveLinear
//
//    UIViewAnimationOptions.repeat
//    UIViewAnimationOptions.autoreverse
//    UIViewAnimationOptions.beginFromCurrentState
//    UIViewAnimationOptions.overrideInheritedDuration
//    UIViewAnimationOptions.overrideInheritedCurve
    
    effectView = UIVisualEffectView()
    view1.addSubview(effectView)
    effectView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      effectView.topAnchor.constraint(equalTo: view1.topAnchor) ,
      effectView.leftAnchor.constraint(equalTo: view1.leftAnchor) ,
      effectView.rightAnchor.constraint(equalTo: view1.rightAnchor) ,
      effectView.bottomAnchor.constraint(equalTo: view1.bottomAnchor)
    ])
  }
  
  
  @IBAction func doEffect(_ sender: Any) {
    let effect = UIBlurEffect(style: .dark)
    effectView.effect = nil
    UIView.animate(withDuration: 1) {
      self.effectView.effect = effect
    }
  }
  
  @IBAction func doAutoreverse(_ sender: Any) {
    let xorig = self.view2.center.x
    let opts: UIViewAnimationOptions = UIViewAnimationOptions.autoreverse
    UIView.animate(withDuration: 1, delay: 0, options: opts, animations: {
      UIView.setAnimationRepeatCount(5)
      self.view2.center.x -= 100
    }, completion: { _ in
      self.view2.center.x = xorig
    })
  }
  
  @IBAction func doAnimationState(_ sender: Any) {
    UIView.animate(withDuration: 0.5) {
      self.view3.center.x -= 100
    }
    UIView.animate(withDuration: 0.5) {
      self.view3.center.y += 100
    }
  }
  
  @IBAction func doAnimationWithStart(_ sender: Any) {
    self.pOrig = self.view4.center
    self.pFinal = self.view4.center
    self.pFinal.x -= 100
    UIView.animate(withDuration: 4) {
      self.view4.center = self.pFinal
    }
  }
  
  @IBAction func doAnimationWithCancel(_ sender: Any) {
    // 1
//    self.view4.layer.removeAllAnimations()
    // 2
    self.view4.layer.position = self.view4.layer.presentation()!.position
    self.view4.layer.removeAllAnimations()
    UIView.animate(withDuration: 0.1) {
      self.view4.center = self.pFinal
    }
  }
  
  @IBAction func doTransform(_ sender: Any) {
    
    UIView.animate(withDuration: 1.2) {
      self.view5.transform = CGAffineTransform.identity
        .translatedBy(x: -100, y: 0)
        .rotated(by:CGFloat(Double.pi/4))
        .scaledBy(x: 0.5, y: 0.5)
    }
  }
}


