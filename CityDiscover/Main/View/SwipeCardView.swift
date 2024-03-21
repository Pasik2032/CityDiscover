//
//  SwipeCardView.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 22.03.2024.
//


import UIKit

class SwipeCardView : UIView {

  // MARK: - Properties

  private lazy var swipeView: UIView = {
    let swipeView = UIView()
    swipeView.layer.cornerRadius = 15
    swipeView.clipsToBounds = true
    return swipeView
  }()

  private lazy var shadowView: UIView = {
    let shadowView = UIView()
    shadowView.backgroundColor = .clear
    shadowView.layer.shadowColor = UIColor.black.cgColor
    shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
    shadowView.layer.shadowOpacity = 0.8
    shadowView.layer.shadowRadius = 4.0
    return shadowView
  }()

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .red
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var backDataView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 15
    view.clipsToBounds = true
    view.backgroundColor = .ds(.mainBackground).withAlphaComponent(0.5)
    return view
  }()

  private lazy var label: UILabel = {
    let label = UILabel()
    label.textColor = .ds(.text)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()

  private lazy var addresLabel: UILabel = {
    let label = UILabel()
    label.textColor = .ds(.text)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15)
    label.text = "1-й Саратовский проезд, д7"
    return label
  }()

  private lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "arrowshape.forward.fill")
    imageView.tintColor = .ds(.text)
    return imageView
  }()

  var moreButton = UIButton()

  var delegate : SwipeCardsDelegate?

  var divisor : CGFloat = 0
  let baseView = UIView()

  var dataSource : CardsDataModel? {
    didSet {
      label.text = dataSource?.text
      addresLabel.text = dataSource?.address
      guard let image = dataSource?.image else { return }
      imageView.image = UIImage(named: image)
    }
  }


  //MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: .zero)
    configureShadowView()
    addPanGestureOnCards()
    configureTapGesture()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Configuration

  func configureShadowView() {
    addSubview(shadowView)
    shadowView.addSubview(swipeView)
    swipeView.addSubview(imageView)
    swipeView.addSubview(backDataView)
    backDataView.addSubviews([iconImageView, label, addresLabel])

    addresLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(16.0)
      $0.width.equalTo(200)
      $0.top.equalTo(backDataView.snp.top).inset(16.0)
      $0.bottom.equalTo(label.snp.top).inset(-10.0)
    }

    label.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(16.0)
      $0.width.equalTo(200)
      $0.bottom.equalToSuperview().inset(16)
    }

    iconImageView.snp.makeConstraints {
      $0.size.equalTo(50.0)
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(16.0)
    }

    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    backDataView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
    }

    shadowView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    swipeView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  func configureTapGesture() {
    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }

  func addPanGestureOnCards() {
    self.isUserInteractionEnabled = true
    addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
  }

  //MARK: - Handlers
  
  @objc func handlePanGesture(sender: UIPanGestureRecognizer){
    let card = sender.view as! SwipeCardView
    let point = sender.translation(in: self)
    let centerOfParentContainer = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)

    let distanceFromCenter = ((UIScreen.main.bounds.width / 2) - card.center.x)
    divisor = ((UIScreen.main.bounds.width / 2) / 0.61)

    switch sender.state {
    case .ended:
      if (card.center.x) > 400 {
        delegate?.swipeDidEnd(on: card)
        UIView.animate(withDuration: 0.2) {
          card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
          card.alpha = 0
          self.layoutIfNeeded()
        }
        return
      }else if card.center.x < -65 {
        delegate?.swipeDidEnd(on: card)
        UIView.animate(withDuration: 0.2) {
          card.center = CGPoint(x: centerOfParentContainer.x + point.x - 200, y: centerOfParentContainer.y + point.y + 75)
          card.alpha = 0
          self.layoutIfNeeded()
        }
        return
      }
      UIView.animate(withDuration: 0.2) {
        card.transform = .identity
        card.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        self.layoutIfNeeded()
      }
    case .changed:
      let rotation = tan(point.x / (self.frame.width * 2.0))
      card.transform = CGAffineTransform(rotationAngle: rotation)

    default:
      break
    }
  }

  @objc func handleTapGesture(sender: UITapGestureRecognizer){
  }
}
