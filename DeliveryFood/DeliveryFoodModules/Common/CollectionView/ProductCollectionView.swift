//
//  ProductCollectionView.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit

 class ProductCollectionView: UICollectionView {
    
    public var viewModel = [Products]()
    
    // MARK: - Collection view constants
    private let columns: CGFloat = 3.0
    private let inset: CGFloat = 8.0
    private let spacing: CGFloat = 20.0
    private let lineSpacing: CGFloat = 20.0
    
    init() {
        let layout = ProductViewLayout()
        layout.numberOfColumns = 1
     
        super.init(frame: .zero, collectionViewLayout: layout)
        dataSource = self
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseId)
    }
    
    public func setViewModel(viewModel: [Products]) {
        self.viewModel = viewModel
        contentOffset = .zero
        reloadData()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ProductCollectionView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModel[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseId, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
       
        cell.categoryLabel.text = model.category
        cell.nameLabel.text = model.name
        cell.imageView.image = UIImage(named: model.category)
        return cell
    }
}


extension ProductCollectionView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width / columns - (inset + spacing))
        
        return CGSize(width: width, height: width)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
}
