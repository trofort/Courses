//
//  AddServiceVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

class AddServiceVC: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var infoTextField: UITextField!
    
    @IBAction func saveDidTap() {
        guard let name = nameTextField.text,
              let info = infoTextField.text else { return }
        //Save new customer
        let newService = Service(moc: CoreDataService.managedObjectContext)
        newService?.name = name
        newService?.info = info
        CoreDataService.saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
}
