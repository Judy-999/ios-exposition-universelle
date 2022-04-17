//
//  Expo1900 - ExpoViewController.swift
//  Created by Taeangel, dudu on 2022/04/11.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

private extension Int {
  
  func decimalStyleFormat() -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    guard let formattedNumber = numberFormatter.string(for: self) else {
      return "0"
    }
    
    return formattedNumber
  }
}

private extension String {
  
  func add(text: String) -> String? {
    return self + text
  }

  func divideLine(with target: Character) -> String? {
    return self.split(separator: target).joined(separator: "\n\(target)")
  }
}

final class ExpoViewController: UIViewController {
  
  private lazy var baseView = ExpoView(frame: view.bounds)
  private var expo: Expo? {
    didSet {
      DispatchQueue.main.async {
        self.bind()
        self.baseView.layoutIfNeeded()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    requestData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = false
  }
  
  private func attribute() {
    view = baseView
    navigationItem.backButtonTitle = "메인"
  }
  
  private func requestData() {
    let data = ParseManager<Expo>.parse(name: "exposition_universelle_1900")
    expo = data
  }
  
  private func bind() {
    baseView.titleLabel.text = expo?.title?.divideLine(with: "(")
    baseView.posterImageView.image = UIImage(named: "poster")
    baseView.visitorValueLabel.text = expo?.visitors?.decimalStyleFormat()?.add(text: " 명")
    baseView.locationValueLabel.text = expo?.location
    baseView.durationValueLabel.text = expo?.duration
    baseView.descriptionLabel.text = expo?.description
    
    baseView.koreaHeritageButton.addTarget(
      self,
      action: #selector(didTapKoreaHeritageButton(_:)),
      for: .touchUpInside
    )
  }
  
  @objc private func didTapKoreaHeritageButton(_ sender: UIButton) {
    let heritageViewController = HeritageViewController()
    navigationController?.pushViewController(heritageViewController, animated: true)
  }
}
