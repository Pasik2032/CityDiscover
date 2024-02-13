//
//  SUIAdapter.swift
//
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import SwiftUI

public final class SUIAdapter<Content> where Content: View {

  private(set) var view: Content!
  weak private(set) var parent: UIViewController!
  public private(set) var uiView: WrappedView
  private var hostingController: UIHostingController<Content>

  public init(view: Content, parent: UIViewController) {
    self.view = view
    self.parent = parent
    hostingController = UIHostingController(rootView: view)
    parent.addChild(hostingController)
    hostingController.didMove(toParent: parent)
    uiView = WrappedView(view: hostingController.view)
  }

  deinit {
    hostingController.removeFromParent()
    hostingController.didMove(toParent: nil)
  }
}
