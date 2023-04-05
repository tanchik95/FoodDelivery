//
//  DeliveryFoodViewController.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit

public protocol DeliveryFoodDisplayLogic: AnyObject {
    func displayData(viewModel: DeliveryFood.Model.ViewModel)
}

public class DeliveryFoodViewController: UIViewController, ViewCustomizable, DeliveryFoodDisplayLogic {
    typealias RootView = DeliveryFoodView
    
    // MARK: - UI elements
    private var interactor: DeliveryFoodBusinessLogic?
    
    
    // MARK: - Object lifecycle
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func selectCategory(category: String) {
            let model = self.view().collectionViewProduct.viewModel
            if !model.isEmpty {
                let index = model.firstIndex { item in
                    item.category == category
                }
                if let i = index {
                    self.view().collectionViewProduct.scrollToItem(at: IndexPath(item: i, section: 0), at: .top, animated: true)
                }
            }
        }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = DeliveryFoodInteractor()
        let presenter = DeliveryFoodPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
  
    // MARK: - View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.makeRequest(request: .product)
    }
    
    public override func loadView() {
            let view = DeliveryFoodView()
            view.onCategorySelect = { [weak self] category in
            guard let self = self else { return }
                self.selectCategory(category: category)
        }
            self.view = view
        }
    
    // MARK: - Main logic
    public func displayData(viewModel: DeliveryFood.Model.ViewModel) {
        switch viewModel {
        case .displayProduct(let items):
            self.view().collectionViewProduct.setViewModel(viewModel: items)
        }
    }
}





