//
//  AddRowOfOrder.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

protocol AddRowOfOrderDelegate: AnyObject {
    func didCreate(row: RowOfOrder)
}

final class AddRowOfOrder: UIViewController, ServicesListVCDelegate {
    
    @IBOutlet private weak var priceTextField: UITextField!
    @IBOutlet private weak var serviceButton: UIButton!
    @IBOutlet private weak var serviceButtonTwo: UIButton!
    
    weak var delegate: AddRowOfOrderDelegate?
    
    private var selectedService: Service? {
        didSet {
            serviceButton.setTitle(selectedService?.name, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadInputViews()
    }
    
    private func setupNavigationBarItems() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .save,
                                        target: self,
                                        action: #selector(saveTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func saveTapped() {
        if let row = RowOfOrder(moc: CoreDataService.managedObjectContext) {
            
            if let priceStr = priceTextField.text,
               let price = Float(priceStr) {
                row.sum = price
            }
            
            row.service = selectedService
            delegate?.didCreate(row: row)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func serviceDidTap() {
        if let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "ServicesListVC") as? ServicesListVC {
            nextVC.delegate = self
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func didSelect(service: Service) {
        selectedService = service
    }
}
