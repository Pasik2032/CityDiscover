//
//  Alert.swift
//
//
//  Created by Даниил Пасилецкий on 20.03.2024.
//

import Foundation
import UIKit

public final class Alert {
  public static func show(title: String, descriptions: String?) {
    let alert = UIAlertController(title: title, message: descriptions, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    UIApplication.getPresentedViewController()?.present(alert, animated: true)
  }
}
