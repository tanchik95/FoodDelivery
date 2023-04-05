//
//  DeliveryFoodDataFlow.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 03.04.2023.
//

import UIKit

public enum DeliveryFood {
    public enum Model {
        public enum Request {
            case product
        }
        public enum Response {
            case presentProduct(_ items: [Products])
        }
        public enum ViewModel {
            case displayProduct(_ items: [Products])
        }
    }
}
