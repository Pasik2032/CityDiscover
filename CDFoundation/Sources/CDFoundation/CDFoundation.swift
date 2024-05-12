// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArchTool
import Swinject

public struct CDFoundationModule: Module {
  public var deepLinkEndpoints: [String : ArchTool.EndPoint.Type] = [:]
  
  public static var shared: ArchTool.Module = CDFoundationModule()

  public var assembly: Swinject.Assembly = Assembly()
}
