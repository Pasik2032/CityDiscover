//
//  SwipeCardsDataSource.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 22.03.2024.
//

import UIKit

protocol SwipeCardsDataSource {
  func numberOfCardsToShow() -> Int
  func card(at index: Int) -> SwipeCardView
  func emptyView() -> UIView?
}

protocol SwipeCardsDelegate {
  func swipeDidEnd(on view: SwipeCardView)
}
