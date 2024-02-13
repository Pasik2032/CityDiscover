//
//  LineTextField.swift
//
//
//  Created by Даниил Пасилецкий on 12.02.2024.
//

import UIKit
import SnapKit

public final class LineTextField: UITextField {

  private lazy var bottomLine: UIView = {
    let view = UIView()
    view.backgroundColor = .ds(.mainTint)
    return view
  }()

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.tintColor = accentColor
    return imageView
  }()

  public var accentColor: UIColor = .ds(.mainTint) {
    didSet {
      bottomLine.backgroundColor = accentColor
      imageView.tintColor = accentColor
    }
  }

  private lazy var labelError: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.fontSize = 10.0
    label.textColor = .systemRed
    label.isHidden = true
    return label
  }()

  private let style: Style

  public init(style: Style) {
    self.style = style
    super.init(frame: .zero)
    configUI()
    setStyle(style)
    delegate = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LineTextField {
  public func validate() -> Bool {
    if !style.validate(text) {
      labelError.isHidden = false
      bottomLine.backgroundColor = .red
      return false
    }
    return true
  }
}

extension LineTextField {
  private func setStyle(_ style: Style) {
    placeholder = style.placeholder
    if let image = style.icon?.value {
      configImage(image: image)
    }
  }

  private func configUI() {
    font = .systemFont(ofSize: 20.0)
    addSubview(bottomLine)
    bottomLine.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(5.0)
      $0.height.equalTo(2.0)
    }
    configError()
  }

  private func configError() {
    addSubview(labelError)
    labelError.text = style.textError
    labelError.snp.makeConstraints {
      $0.top.equalTo(bottomLine.snp.bottom).inset(-5.0)
      $0.leading.trailing.equalToSuperview()
    }
  }

  private func configImage(image: UIImage) {
    let leftView = UIView()
    imageView.image = image.withRenderingMode(.alwaysTemplate)
    leftView.addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.leading.top.bottom.equalToSuperview()
      $0.trailing.equalToSuperview().inset(10.0)
    }
    self.leftView = leftView
    leftViewMode = .always
  }
}

extension LineTextField: UITextFieldDelegate {
  public func textFieldDidEndEditing(_ textField: UITextField) {
    if !style.validate(textField.text) {
      labelError.isHidden = false
      bottomLine.backgroundColor = .red
    }
  }

  public func textFieldDidBeginEditing(_ textField: UITextField) {
    labelError.isHidden = true
    bottomLine.backgroundColor = accentColor
  }
}
