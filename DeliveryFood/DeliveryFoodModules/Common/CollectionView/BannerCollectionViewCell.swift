//
//  BannerCollectionViewCell.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit

// MARK: - View Metrics
extension BannerCollectionViewCell {
  struct ViewMetrics {
    
    let vehicleSmallCarImage = UIImage(named: "Image")
    let vehicleSmallCourierImage = UIImage(named: "Image")
  }
}

// MARK: - View
class BannerCollectionViewCell: UICollectionViewCell {
  
  // MARK: Private Properties
  private var isPicked = false
  private let viewMetrics = ViewMetrics()
  
  fileprivate(set) lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    
    return imageView
  }()
  
  // MARK: Init
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    func initialSetup() {
      
      func addSubviews() {
        addSubview(imageView)
      }
        
        func makeConstraints() {
            imageView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
      }
      
      addSubviews()
      makeConstraints()
    }
    
    initialSetup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Public Methods
  func configure(viewModel: ViewModel) {
    
    switch viewModel.service {
    case .auto:
      imageView.image = viewMetrics.vehicleSmallCarImage
    case .courier:
      imageView.image = viewMetrics.vehicleSmallCourierImage
    }
  }
}

// MARK: - View Model
extension BannerCollectionViewCell {
  struct ViewModel {
    let service: OrderingServices
  }
}
