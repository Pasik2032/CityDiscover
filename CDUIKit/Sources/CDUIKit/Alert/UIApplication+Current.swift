//
//  UIApplication+Current.swift
//
//
//  Created by Даниил Пасилецкий on 20.03.2024.
//

import UIKit

public extension UIApplication {
  class func getPresentedViewController() -> UIViewController? {
    var presentViewController = UIApplication.shared.keyWindow?.rootViewController
    while let pVC = presentViewController?.presentedViewController {
      presentViewController = pVC
    }

    return presentViewController
  }
}
