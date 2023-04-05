//
//  ContactViewController.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 04.04.2023.
//


import UIKit


public class ContactViewController: UIViewController {
    
    // MARK: - View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    public override func loadView() {
            let view = ContactView()
            self.view = view
        }
}





