//
//  Setting.swift
//  
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

public enum NetworkingModule {}

public protocol SettingProtocol: AnyObject {
  var domen: String { get set }
  var token: String? { get set }
}

final class Setting: SettingProtocol {
  var domen: String = "city-discover.ru"
//  var domen: String = "10.77.12.96"
  var token: String?
}
