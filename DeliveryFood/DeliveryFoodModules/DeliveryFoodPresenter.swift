//
//  DeliveryFoodPresenter.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import Foundation

public protocol DeliveryFoodPresentationLogic {
    func presentData(response: DeliveryFood.Model.Response)
}

public class DeliveryFoodPresenter: DeliveryFoodPresentationLogic {
    
    public weak var viewController: DeliveryFoodDisplayLogic?
    
    // MARK: - Presenting logic
    public func presentData(response: DeliveryFood.Model.Response) {
        switch response {
        case .presentProduct(let items):
            viewController?.displayData(viewModel: .displayProduct(items))
        }
    }
}
