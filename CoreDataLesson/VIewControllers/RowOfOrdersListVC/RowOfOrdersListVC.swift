//
//  RowOfOrdersListVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

final class RowOfOrdersListVC: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var rows = [RowOfOrder]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var fetchedResultController: NSFetchedResultsController<RowOfOrder>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFetchedResultController()
        loadAllRows()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupFetchedResultController() {
        let request = NSFetchRequest<RowOfOrder>(entityName: "RowOfOrder")
        let sortDescriptor = NSSortDescriptor(key: "order.date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController<RowOfOrder>(fetchRequest: request,
                                                                       managedObjectContext: CoreDataService.managedObjectContext,
                                                                       sectionNameKeyPath: nil,
                                                                       cacheName: nil)
        fetchedResultController.delegate = self
    }
    
    private func loadAllRows() {
        try? fetchedResultController.performFetch()
        if let results = fetchedResultController.fetchedObjects {
            rows = results
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowOfOrderCell", for: indexPath) as! RowOfOrderCell
        cell.setup(with: rows[indexPath.row])
        return cell
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        loadAllRows()
    }
}
