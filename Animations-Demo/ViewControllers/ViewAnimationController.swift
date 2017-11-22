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

class ViewAnimationController: UIViewController {
  
  @IBOutlet weak var view1: MyView!
  @IBOutlet weak var view2: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @IBAction func doSwingAnimation(_ sender: Any) {
    UIView.animate(withDuration: 0.4) {
      self.view1.swing = !self.view1.swing
    }
  }
  @IBAction func doSpringAnimation(_ sender: Any) {
    UIView.animate(withDuration: 0.5 , delay: 0 , usingSpringWithDamping: 0.7 , initialSpringVelocity: 20 , options: [] , animations: {
      self.view2.center.x -= 100
    }, completion: nil)
  }
}

