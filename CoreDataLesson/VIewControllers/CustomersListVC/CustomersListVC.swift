//
//  CustomersListVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

protocol CustomersListVCDelegate: AnyObject {
    func didSelect(customer: Customer)
}

final class CustomersListVC: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate, UITableViewDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    weak var delegate: CustomersListVCDelegate?
    
    private var customers = [Customer]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var fetchedResultController: NSFetchedResultsController<Customer>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customer = Customer(moc: CoreDataService.managedObjectContext)
        
        
        setupFetchedResultController()
        setupNavigationBarItems()
        loadAllCustomers()
    }
    
    private func setupFetchedResultController() {
        let request = NSFetchRequest<Customer>(entityName: "Customer")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController<Customer>(fetchRequest: request,
                                                                       managedObjectContext: CoreDataService.managedObjectContext,
                                                                       sectionNameKeyPath: nil,
                                                                       cacheName: nil)
        fetchedResultController.delegate = self
    }
    
    private func loadAllCustomers() {
        try? fetchedResultController.performFetch()
        if let results = fetchedResultController.fetchedObjects {
            customers = results
        }
    }
    
    private func setupNavigationBarItems() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addTapped() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "AddCustomerVC")
        present(nextVC, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath) as! CustomerCell
        cell.setup(with: customers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let delegate = delegate {
            delegate.didSelect(customer: customers[indexPath.row])
            navigationController?.popViewController(animated: true)
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        guard let customer = anObject as? Customer else { return }
        switch type {
        case .insert: customers.append(customer)
        default: loadAllCustomers()
        }
    }
}
