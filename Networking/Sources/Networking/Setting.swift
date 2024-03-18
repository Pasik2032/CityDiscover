//
//  Setting.swift
//  
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

enum Networking {}

public protocol SettingProtocol {
  var domen: String { get set }
  var token: String { get set }
}

final class Setting: SettingProtocol {
  var domen: String = "localhost"
  var token: String = ""
}
