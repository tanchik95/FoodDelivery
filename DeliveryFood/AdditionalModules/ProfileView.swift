//
//  ProfileView.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 04.04.2023.
//

import UIKit


// MARK: - View
final class ProfileView: UIView {

  // MARK: View Properties
    
    fileprivate(set) lazy var profileLabel: UILabel = {
      let label = UILabel()
        label.text = "Профиль"
      
      return label
    }()
    
  // MARK: Init
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    func initialSetup() {
      func setupView() {
      }
      
      func addSubviews() {
          addSubview(profileLabel)
      }
        
        func makeConstraints() {
            profileLabel.snp.makeConstraints { (make) in
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

