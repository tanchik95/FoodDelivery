//
//  ContactView.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 04.04.2023.
//

import UIKit


// MARK: - View
final class ContactView: UIView {

  // MARK: View Properties
    
    fileprivate(set) lazy var contactLabel: UILabel = {
      let label = UILabel()
        label.text = "Контакты"
      
      return label
    }()

    
  // MARK: Init
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    func initialSetup() {
      func setupView() {
      }
      
      func addSubviews() {
          addSubview(contactLabel)
      }
        
        func makeConstraints() {
            contactLabel.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
               
            }
        }
        
        addSubviews()
        makeConstraints()
        setupView()
      
    }
    initialSetup()
  }
    
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

