//
//  DeliveryFoodInteractor.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import Foundation

// MARK: - Business Logic Protocol
public protocol DeliveryFoodBusinessLogic {
    func makeRequest(request: DeliveryFood.Model.Request)
}

public protocol DeliveryFoodDataStore {
    var product: [Products] { get }
}

public class DeliveryFoodInteractor: DeliveryFoodBusinessLogic, DeliveryFoodDataStore {
    
    // MARK: - Data
    public var product = [Products]()
    
    // MARK: - Services
    public var presenter: DeliveryFoodPresentationLogic?
    
    // MARK: - Main logic
    public func makeRequest(request: DeliveryFood.Model.Request) {
        switch request {
        case .product:
            loadProduct()
             
            }
        }

    
    private func loadProduct() {
        let filepath = "https://simple-grocery-store-api.glitch.me/products"
        let fileUrl = URL(string: filepath)!
        guard let data = try? Data(contentsOf: fileUrl, options: .mappedIfSafe) else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let productDecoded = try? decoder.decode([Products].self, from: data) else { return }
        product = productDecoded
        presenter?.presentData(response: .presentProduct(productDecoded))
    }
}

