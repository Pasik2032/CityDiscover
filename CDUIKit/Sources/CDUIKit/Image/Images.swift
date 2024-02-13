//
//  Images.swift
//  
//
//  Created by Даниил Пасилецкий on 12.02.2024.
//

import UIKit

public enum Image {
  case email

  var value: UIImage? {
    switch self {
    case .email: UIImage(systemName: "envelope.fill")
    }
  }
}

