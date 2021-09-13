//
//  AddCustomerVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

final class AddCustomerVC: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var infoTextField: UITextField!
    
    @IBAction func saveDidTap() {
        guard let name = nameTextField.text,
              let info = infoTextField.text else { return }
        //Save new customer
        let newCustomer = Customer(moc: CoreDataService.managedObjectContext)
        newCustomer?.name = name
        newCustomer?.info = info
        CoreDataService.saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
}
