///
/// Здесь содержаться ссылки на все файлы модулей.
///

import ArchTool
import Authorization
import CDFoundation
import Place
import SecretStore
import Game
import User
import Map

let modules: [Module] = [
  AuthorizationModule.shared,
  CDFoundationModule.shared,
  PlaceModule.shared,
  SecreteStoreModule.shared,
  GameModule.shared,
  UserModule.shared,
  MapModule.shared,
]
