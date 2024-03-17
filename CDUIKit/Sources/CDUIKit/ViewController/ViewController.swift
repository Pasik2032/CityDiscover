//
//  ViewController.swift
//  
//
//  Created by Даниил Пасилецкий on 11.03.2024.
//

import UIKit

open class ViewController: UIViewController {

  open override func viewDidLoad() {
    keyboardObserver()
    super.viewDidLoad()
  }

  public func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(tap)
  }

  open func keyboardWillShow(height: CGFloat) {}

  open func keyboardWillHidden() {}

  private func keyboardObserver() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillDisappear),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillAppear),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
  }

  @objc private func keyboardWillDisappear() {
    keyboardWillHidden()
  }

  @objc private func keyboardWillAppear(_ notification: Notification) {
    guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    let keyboarHeight = keyboardFrame.cgRectValue.height
    keyboardWillShow(height: keyboarHeight)
  }

  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
}
