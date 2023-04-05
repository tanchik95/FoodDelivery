//
//  ProductCollectionViewCell.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit

// MARK: - View Metrics
extension ProductCollectionViewCell {
  struct ViewMetrics {
    
    let vehicleSmallCarImage = UIImage(named: "Image")
    let vehicleSmallCourierImage = UIImage(named: "Image")
  }
}

// MARK: - View
class ProductCollectionViewCell: UICollectionViewCell {
    
    public static let reuseId = "ProductCollectionViewCell"
    
    // MARK: Private Properties
    private var isPicked = false
    private let viewMetrics = ViewMetrics()
    
    fileprivate(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    fileprivate(set) lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    fileprivate(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.tintColor = UIColor(named: "customGray")
        label.numberOfLines = 0
        
        return label
    }()
    
    fileprivate(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.layer.borderColor = UIColor(named: "Pink")?.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 10
        label.textColor = UIColor(named: "Pink")
        label.text = "от 345 р"
        label.textAlignment = .center
        
        return label
    }()
    
    
    // MARK: Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        func initialSetup() {
            
            func addSubviews() {
                addSubview(imageView)
                addSubview(categoryLabel)
                addSubview(nameLabel)
                addSubview(priceLabel)
            }
            
            func makeConstraints() {
                imageView.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(16)
                    make.top.equalToSuperview().offset(6)
                    make.height.equalTo(132)
                    make.width.equalTo(132)
                }
                
                categoryLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(imageView.snp.top)
                    make.left.equalTo(imageView.snp.right).offset(32)
                    make.height.equalTo(20)
                }
                
                nameLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(categoryLabel.snp.bottom).offset(8)
                    make.left.equalTo(categoryLabel.snp.left)
                    make.right.equalToSuperview().offset(-24)
                    make.height.equalTo(38)
                }
                
                priceLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(nameLabel.snp.bottom).offset(16)
                    make.right.equalTo(nameLabel.snp.right)
                    make.height.equalTo(32)
                    make.width.equalTo(87)
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
}

