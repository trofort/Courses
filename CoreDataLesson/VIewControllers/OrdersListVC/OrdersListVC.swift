//
//  OrdersListVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

final class OrdersListVC: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate { :))))
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var orders = [Order]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var fetchedResultController: NSFetchedResultsController<Order>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFetchedResultController()
        setupNavigationBarItems()
        loadAllOrders()
    }
    
    private func setupFetchedResultController() {
        let request = NSFetchRequest<Order>(entityName: "Order")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController<Order>(fetchRequest: request,
                                                                       managedObjectContext: CoreDataService.managedObjectContext,
                                                                       sectionNameKeyPath: nil,
                                                                       cacheName: nil)
        fetchedResultController.delegate = self
    }
    
    private func loadAllOrders() {
        try? fetchedResultController.performFetch()
        if let results = fetchedResultController.fetchedObjects {
            orders = results
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
            .instantiateViewController(identifier: "AddOrderNC")
        present(nextVC, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.setup(with: orders[indexPath.row])
        return cell
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        loadAllOrders()
    }
}
