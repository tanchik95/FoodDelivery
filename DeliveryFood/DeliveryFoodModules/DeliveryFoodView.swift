//
//  DeliveryFoodView.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit
import SnapKit

// MARK: - View Metrics
extension DeliveryFoodView {
  struct ViewMetrics {
      let viewBackgroundColor = UIColor.white
      let sitiLabelText = "Москва"
      let sitiLabelImage = UIImage(named: "chevron.down")
      let sitiLabelColor = UIColor.black
      let sitiLabelTextFont = UIFont.systemFont(ofSize: 17)
      let sitiLabelInsets = UIEdgeInsets(top: 32.0, left: 0.0, bottom: 0.0, right: 0.0)
  }
}

// MARK: - View
final class DeliveryFoodView: UIView {
  
  // MARK: Private Properties
    private let viewMetrics = ViewMetrics()
    private var orderingService: OrderingServices?
    private var viewModels: [BannerCollectionViewCell.ViewModel] = [
      BannerCollectionViewCell.ViewModel(service: .auto),
      BannerCollectionViewCell.ViewModel(service: .courier)
    ]
    
    // MARK: Output
    
    var onCategorySelect: ((_ category: String) -> Void)?
  
  // MARK: View Properties
    
    fileprivate(set) lazy var sitiView: UIView = {
        let view = UIView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeSiti))
        view.addGestureRecognizer(tapGesture)
      
      return view
    }()
  
  fileprivate(set) lazy var sitiLabel: UILabel = {
    let label = UILabel()
      label.text = viewMetrics.sitiLabelText
      label.textColor = viewMetrics.sitiLabelColor
      label.font = viewMetrics.sitiLabelTextFont
    
    return label
  }()
    
    fileprivate(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = viewMetrics.sitiLabelImage
        return imageView
    }()
    
    fileprivate(set) lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.backgroundColor = .clear
      collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")
      
      layout.scrollDirection = .horizontal
      
      collectionView.delegate = self
      collectionView.dataSource = self
      
      return collectionView
    }()
    
    fileprivate(set) lazy var categoriesScroll: CategoriesView = {
      let button = CategoriesView()
        button.onCategorySelect = { [weak self] category in
            guard let self = self else { return }
            self.onCategorySelect?(category)
        }
      
      return button
    }()
    
    fileprivate(set) lazy var collectionViewProduct: ProductCollectionView = {
        let collectionView = ProductCollectionView()
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
            
      return collectionView
    }()
  
  
  // MARK: Init
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    func initialSetup() {
      func setupView() {
        backgroundColor = viewMetrics.viewBackgroundColor
      }
      
      func addSubviews() {
          addSubview(sitiView)
          sitiView.addSubview(sitiLabel)
          sitiView.addSubview(imageView)
          addSubview(collectionView)
          addSubview(categoriesScroll)
          addSubview(collectionViewProduct)
      }
  
        func makeConstraints() {
            sitiView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(31)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(24)
                make.width.equalTo(70)
            }
            
            sitiLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.left.equalToSuperview()
                make.height.equalTo(24)
            }
            
            imageView.snp.makeConstraints { (make) in
                make.centerY.equalTo(sitiLabel.snp.centerY)
                make.left.equalTo(sitiLabel.snp.right).offset(8)
            }
            
            collectionView.snp.makeConstraints { (make) in
                make.top.equalTo(sitiLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview()
                make.height.equalTo(112.0)
            }
            
            categoriesScroll.snp.makeConstraints { (make) in
                make.top.equalTo(collectionView.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(12)
                make.height.equalTo(32)
            }
            
            collectionViewProduct.snp.makeConstraints { (make) in
                make.top.equalTo(categoriesScroll.snp.bottom).offset(10)
                make.left.right.bottom.equalToSuperview()

            }
        }
      
      setupView()
      addSubviews()
      makeConstraints()
    }
    
    initialSetup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
    @objc func didTapChangeSiti() {
        print("Выбрать город")
    }
}

extension DeliveryFoodView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      self.orderingService = viewModels[indexPath.row].service
      self.updateState()
    }
  
  private func updateState() {
    collectionView.indexPathsForVisibleItems.forEach { indexPath in
      let viewModel = viewModels[indexPath.row]
      (collectionView.cellForItem(at: indexPath) as? BannerCollectionViewCell)?.configure(viewModel: viewModel)
    }
  }
}

extension DeliveryFoodView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
    
    let viewModel = viewModels[indexPath.row]
    cell.configure(viewModel: viewModel)
    
    return cell
  }
}

extension DeliveryFoodView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height: CGFloat = 112.0
    let width: CGFloat = 300.0
    
    return CGSize(width: width, height: height)
  }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 4.0
       }
    }

enum OrderingServices {
  case auto
  case courier
}
