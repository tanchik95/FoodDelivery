//
//  ViewCustomizable.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 04.04.2023.
//

import UIKit

protocol ViewCustomizable {
  associatedtype RootView: UIView
}

extension ViewCustomizable where Self: UIViewController {
  func view() -> RootView { self.view as! RootView }
  func optionalView() -> RootView? { self.view as? RootView }
}
