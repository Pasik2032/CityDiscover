//
//  RadioButton.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import UIKit

public class RadioButton: UIButton {
  public var alternateButton:Array<RadioButton>?

  public var selectColor: UIColor = .ds(.button)
  public var color: UIColor = .ds(.text)

  public override func awakeFromNib() {
    self.layer.cornerRadius = 5
    self.layer.borderWidth = 2.0
    self.layer.masksToBounds = true
  }

  func unselectAlternateButtons() {
    if alternateButton != nil {
      self.isSelected = true

      for aButton:RadioButton in alternateButton! {
        aButton.isSelected = false
      }
    } else {
      toggleButton()
    }
  }

  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    unselectAlternateButtons()
    super.touchesBegan(touches, with: event)
  }

  func toggleButton() {
    self.isSelected = !isSelected
  }

  public override var isSelected: Bool {
    didSet {
      if isSelected {
        self.layer.borderColor = selectColor.cgColor
        self.setTitleColor(selectColor, for: .normal)
      } else {
        self.layer.borderColor = color.cgColor
        self.setTitleColor(color, for: .normal)
      }
    }
  }
}
