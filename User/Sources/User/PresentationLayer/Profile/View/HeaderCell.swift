//
//  HeaderCell.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import UIKit

final class HeaderCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 26.0)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()

  private lazy var emailLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20.0)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()

  private lazy var icon: UIImageView = {
    let icon = UIImageView()
    icon.image = UIImage(systemName: "person.circle")
    icon.tintColor = .white
    return icon
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    backgroundColor = .clear
    addSubview(icon)
    addSubview(label)
    addSubview(emailLabel)

    icon.snp.makeConstraints {
      $0.size.equalTo(100)
      $0.top.equalToSuperview()
      $0.centerX.equalToSuperview()
    }

    label.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.equalTo(icon.snp.bottom).inset(-16.0)
    }

    emailLabel.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.equalTo(label.snp.bottom).inset(-16.0)
      $0.bottom.equalToSuperview()
    }
  }
}
