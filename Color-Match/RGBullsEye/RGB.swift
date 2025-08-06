//
//  RGB.swift
//  lab6_task5
//
//  Created by Екатерина Алейник on 20.04.25.
//
import Foundation
import UIKit

extension UIColor {
  convenience init(rgbStruct rgb: RGB) {
    let r = CGFloat(rgb.r) / 255.0
    let g = CGFloat(rgb.g) / 255.0
    let b = CGFloat(rgb.b) / 255.0
    self.init(red: r, green: g, blue: b, alpha:1.0)
  }
}

struct RGB {
  var r = 127
  var g = 127
  var b = 127
  
  func difference(target: RGB) -> Double {
    let rDiff = Double(r - target.r)
    let gDiff = Double(g - target.g)
    let bDiff = Double(b - target.b)
    return sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 256.0
  }
}
