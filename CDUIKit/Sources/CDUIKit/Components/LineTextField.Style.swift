//
//  LineTextField.Style.swift
//
//
//  Created by Даниил Пасилецкий on 12.02.2024.
//

import UIKit

extension LineTextField {
  public struct Style {
    var placeholder: String
    var icon: Image?
    var validate: (String?) -> Bool
    var textError: String

    public static let email: Style = .init(
      placeholder: "myemail@city.com",
      icon: .email,
      validate: { email in
        guard let email else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
      },
      textError: "Email не корректный"
    )
  }
}
