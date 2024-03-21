//
//  PreferencesViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit
import SnapKit

protocol PreferencesViewInput: AnyObject {
  func startTag(_ tags: [String])
  func insertTag(_ tags: [String])
  func deleteTag(_ tags: [String])
}

protocol PreferencesViewOutput: AnyObject {
  func viewDidLoad()
  func tagDidPressed(name: String, isSelected: Bool)
  func saveDidPressed()
}

final class PreferencesViewController: ViewController {

  // MARK: - UI

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 25.0)
    label.text = "Выберите понравившиеся категории:"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var tagListView: TagListView = {
    let tagListView = TagListView()
    tagListView.textFont = UIFont.systemFont(ofSize: 18)
    tagListView.alignment = .leading
    tagListView.minWidth = 57
    tagListView.cornerRadius = 12.0
    tagListView.tagSelectedBackgroundColor = .ds(.button)
    tagListView.selectedTextColor = .ds(.textButton)
    tagListView.textColor = .ds(.text)
    tagListView.marginY = 10.0
    tagListView.marginX = 10.0
    tagListView.paddingX = 10.0
    tagListView.paddingY = 5.0
    tagListView.tagBackgroundColor = .ds(.mainBackground2)
    tagListView.delegate = self
    return tagListView
  }()

  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Сохранить", for: .normal)
    button.layer.cornerRadius = 15.0
    button.backgroundColor = .ds(.button)
    button.setTitleColor(.ds(.textButton), for: .normal)
    button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
    return button
  }()

  // MARK: - Properties

  var presenter: PreferencesViewOutput?
  private var bottom: Constraint?

  // MARK: - UIViewController

  override func viewDidLoad() {
    self.navigationItem.backBarButtonItem?.title = "Назад"
    navigationController?.navigationBar.barTintColor = .white
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    setupUI()
    presenter?.viewDidLoad()
  }

  // MARK: - Actions

  @objc private func buttonDidPressed() {
    presenter?.saveDidPressed()
  }

  // MARK: - Setup

  private func setupUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.layer.cornerRadius = 15.0
    view.addSubviews([
      tagListView,
      button,
      titleLabel
    ])

    button.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      bottom = $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(16.0).constraint
      $0.height.equalTo(50.0)
    }

    tagListView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview().inset(16.0)
      $0.top.equalTo(titleLabel.snp.bottom).inset(-10.0)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }
  }

  // MARK: - Keyboard

  override func keyboardWillShow(height: CGFloat) {
    bottom?.update(inset: height)
    view.layoutIfNeeded()
  }

  override func keyboardWillHidden() {
    bottom?.update(inset: 30.0)
    view.layoutIfNeeded()
  }
}

// MARK: - PreferencesViewInput

extension PreferencesViewController: PreferencesViewInput {
  func startTag(_ tags: [String]) {
    tagListView.addTags(tags)
  }
  
  func insertTag(_ tags: [String]) {
    tags.forEach {
      self.tagListView.insertTag($0, at: tagListView.tagViews.count - 1)
    }
  }

  func deleteTag(_ tags: [String]) {
    tags.forEach {
      self.tagListView.removeTag($0)
    }
  }
}

extension PreferencesViewController: TagListViewDelegate {
  func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
    presenter?.tagDidPressed(name: title, isSelected: tagView.isSelected)
  }
}
