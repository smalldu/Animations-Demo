//
//  ImageViewAnimationController.swift
//  Animations-Demo
//
//  Created by Zoey Shi on 2017/11/22.
//  Copyright © 2017年 Small Du. All rights reserved.
//

import UIKit

class ImageViewAnimationController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var imageView1: UIImageView!
  @IBOutlet weak var button: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let rabbit = #imageLiteral(resourceName: "rabbit")
    UIGraphicsBeginImageContextWithOptions(rabbit.size , false, 0)
    let empty = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    let arr = [rabbit,empty,rabbit,empty,rabbit]
    imageView.animationImages = arr
    imageView.animationDuration = 2
    imageView.animationRepeatCount = 3
//    rabbit.resizableImage(withCapInsets: , resizingMode: )
//    UIImage.animatedImage(with:, duration:)
//    UIImage.animatedImageNamed(, duration: )
//    UIImage.animatedResizableImageNamed(, capInsets: , duration: )
    
    button.addTarget(self, action: #selector(doAnimation3), for: .touchUpInside)
  }
  
  @IBAction func doAnimation1(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction func doAnimation2(_ sender: Any) {
    let im = UIImage.animatedImageNamed("voice", duration: 2)
    imageView1.image = im
  }
  
  @objc func doAnimation3(){
    var arr = [UIImage]()
    let w : CGFloat = 18
    for i in 0 ..< 6 {
      UIGraphicsBeginImageContextWithOptions(CGSize(width: w, height: w), false, 0)
      let context = UIGraphicsGetCurrentContext()!
      context.setFillColor(UIColor.red.cgColor)
      let ii = CGFloat(i)
      let rect = CGRect(x: ii, y:ii, width: w-ii*2, height: w-ii*2)
      context.addEllipse(in: rect)
      context.fillPath()
      let im = UIGraphicsGetImageFromCurrentImageContext()!
      UIGraphicsEndImageContext()
      arr.append(im)
    }
    let im = UIImage.animatedImage(with: arr, duration: 0.5)
    self.button.setImage(im, for: .normal)
  }
}

