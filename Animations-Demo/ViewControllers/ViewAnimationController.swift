//
//  ViewAnimationController.swift
//  Animations-Demo
//
//  Created by duzhe on 2017/11/22.
//  Copyright © 2017年 Small Du. All rights reserved.
//

import UIKit

class MyView: UIView {
  var swing: Bool = true {
    didSet{
      var p = self.center
      p.x = self.swing ? p.x + 100 : p.x - 100
      UIView.animate(withDuration: 0) {
        self.center = p
      }
    }
  }
}

class MyView1: UIView {
  
  var reverse = false
  override func draw(_ rect: CGRect) {
    let f = self.bounds.insetBy(dx: 10, dy: 10)
    let context = UIGraphicsGetCurrentContext()
    if self.reverse {
      context?.strokeEllipse(in: f)
    }else{
      context?.stroke(f)
    }
  }
  
}

class ViewAnimationController: UIViewController {
  
  @IBOutlet weak var view1: MyView!
  @IBOutlet weak var view2: UIView!
  @IBOutlet weak var view3: UIView!
  @IBOutlet weak var view4: MyView1!
  @IBOutlet weak var view5: UIView!
  @IBOutlet weak var label1: UILabel!
  
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
//    UIView.animateKeyframes(withDuration:, delay:, options:, animations: , completion: )
//    UIView.addKeyframe(withRelativeStartTime: , relativeDuration: , animations: )
//    UIViewKeyframeAnimationOptions.calculationModeLinear
//    UIView.transition(with:, duration:, options:, animations:, completion:)
//    UIView.transition(from: , to:, duration:, options:, completion:)
//    UIViewAnimationOptions.transitionFlipFromLeft
//    UIViewAnimationOptions.transitionFlipFromRight
//    UIViewAnimationOptions.transitionFlipFromTop
//    UIViewAnimationOptions.transitionFlipFromBottom
//    UIViewAnimationOptions.transitionCurlUp
//    UIViewAnimationOptions.transitionCurlDown
//    UIViewAnimationOptions.transitionCrossDissolve
//    UIViewAnimationOptions.showHideTransitionViews
  }
  @IBAction func doSwingAnimation(_ sender: Any) {
    UIView.animate(withDuration: 0.4) {
      self.view1.swing = !self.view1.swing
    }
  }
  @IBAction func doSpringAnimation(_ sender: Any) {
    UIView.animate(withDuration: 1 , delay: 0 , usingSpringWithDamping: 0.3 , initialSpringVelocity: 8 , options: [] , animations: {
      self.view2.center.x -= 100
    }, completion: nil)
  }
  
  
  @IBAction func doKeyFrameAnimation(_ sender: Any) {
    var p = self.view3.center
    let dur = 0.25
    var start = 0.0
    let dx: CGFloat = -100
    let dy: CGFloat = 50
    var dir: CGFloat = 1
    
    UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
        p.x += dx*dir
        p.y += dy
        self.view3.center = p
      })
      start += dur
      dir *= -1
      UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
        p.x += dx*dir
        p.y += dy
        self.view3.center = p
      })
      start += dur
      dir *= -1
      UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
        p.x += dx*dir
        p.y += dy
        self.view3.center = p
      })
      start += dur
      dir *= -1
      UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
        p.x += dx*dir
        p.y += dy
        self.view3.center = p
      })
    }, completion: nil)
  }
  
  @IBAction func doTransitionAnimation(_ sender: Any) {
    UIView.transition(with: self.imageView , duration: 0.6 , options: .transitionFlipFromLeft , animations: {
      if self.imageView.image == #imageLiteral(resourceName: "rabbit") {
        self.imageView.image = #imageLiteral(resourceName: "elephant")
      }else{
        self.imageView.image = #imageLiteral(resourceName: "rabbit")
      }
    }, completion: nil)
  }
  
  @IBAction func doTransitionAnimation1(_ sender: Any) {
    self.view4.reverse = !self.view4.reverse
    UIView.transition(with: self.view4 , duration: 0.6 , options: .transitionFlipFromLeft , animations: {
      self.view4.setNeedsDisplay()
    }, completion: nil)
  }
  
  @IBAction func doTransitionAnimation2(_ sender: Any) {
    let lab2 = UILabel(frame: self.label1.frame)
    lab2.text = self.label1.text == "Hello" ? "World" : "Hello"
    lab2.textColor = UIColor.white
    lab2.sizeToFit()
    UIView.transition(from: self.label1 , to: lab2 , duration: 0.8 , options: .transitionFlipFromLeft , completion: { _ in
      self.label1 = lab2
    })
  }
}

