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
//  var domen: String = "localhost"
  var domen: String = "10.77.13.141"
  var token: String?
}
