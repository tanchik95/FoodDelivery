//
//  CategoriesView.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit
import SnapKit

// MARK: - View Metrics
extension CategoriesView {
  struct ViewMetrics {
      let viewBackgroundColor = UIColor.white
      let sitiLabelText = "Москва"
      let sitiLabelImage = UIImage(systemName: "chevron.down")
      let sitiLabelColor = UIColor.black
      let sitiLabelTextFont = UIFont.systemFont(ofSize: 17)
      let sitiLabelInsets = UIEdgeInsets(top: 32.0, left: 0.0, bottom: 0.0, right: 0.0)
  }
}

// MARK: - View
final class CategoriesView: UIView {
    struct Category {
        var title: String
        var value: String
    }
    
    var categories: [Category] = [
        Category(title: "Кофе", value: "coffee"),
        Category(title: "Fresh", value: "fresh-produce"),
        Category(title: "Мясо", value: "meat-seafood"),
        Category(title: "Десерт", value: "candy"),
        Category(title: "Молоко", value: "dairy"),
        Category(title: "Хлеб", value: "bread-bakery"),
    ]
    
    var onCategorySelect: ((_ category: String) -> Void)?

  // MARK: View Properties
    
    fileprivate(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    fileprivate(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
      
      return stackView
    }()
    
  // MARK: Init
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    func initialSetup() {
      func setupView() {
      }
      
      func addSubviews() {
          addSubview(scrollView)
          scrollView.addSubview(stackView)
          for item in 0...5 {
              let button = UIButton()
              button.tag = item
              
              button.addTarget(self, action: #selector(selectedCategory), for: .allEvents)
              button.layer.borderColor = UIColor(named: "PinkColor")?.cgColor
              button.layer.borderWidth = 1
              button.setTitleColor(UIColor(named: "PinkColor"), for: .normal)
              button.setTitle(categories[item].title, for: .normal)
              button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
              button.layer.cornerRadius = 16
              button.clipsToBounds = true
              stackView.addArrangedSubview(button)
              button.snp.makeConstraints { (make) in
                  make.width.equalTo(88)
                  make.height.equalTo(32)
              }
          }
      }
        
        
        func makeConstraints() {
            scrollView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
               
            }
            
            stackView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
                make.width.equalTo(self).multipliedBy(1.5)
                
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
    
    @objc
    private func selectedCategory(sender: UIButton) {
        onCategorySelect?(categories[sender.tag].value)
        stackView.subviews.forEach { view in
            if let button = view as? UIButton {
                if button.tag == sender.tag {
                    button.backgroundColor = UIColor(named: "PinkColorBackground")
                    button.layer.borderWidth = 0
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
                    button.setTitleColor(UIColor(named: "Pink"), for: .normal)
                } else {
                    button.backgroundColor = UIColor.white
                    button.layer.borderColor = UIColor(named: "PinkColor")?.cgColor
                    button.layer.borderWidth = 1
                    button.setTitleColor(UIColor(named: "PinkColor"), for: .normal)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
                }
            }
        }
        
      }
   }



