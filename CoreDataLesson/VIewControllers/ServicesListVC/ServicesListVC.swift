//
//  ServicesListVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

protocol ServicesListVCDelegate: AnyObject {
    func didSelect(service: Service)
}

final class ServicesListVC: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate, UITableViewDelegate {
    @IBOutlet weak var new: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    weak var delegate: ServicesListVCDelegate?
    
    private var services = [Service]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var fetchedResultController: NSFetchedResultsController<Service>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFetchedResultController()
        setupNavigationBarItems()
        loadAllServices()
    }
    
    private func setupFetchedResultController() {
        let request = NSFetchRequest<Service>(entityName: "Service")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController<Service>(fetchRequest: request,
                                                                       managedObjectContext: CoreDataService.managedObjectContext,
                                                                       sectionNameKeyPath: nil,
                                                                       cacheName: nil)
        fetchedResultController.delegate = self
    }
    
    private func loadAllServices() {
        try? fetchedResultController.performFetch()
        if let results = fetchedResultController.fetchedObjects {
            services = results
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
            .instantiateViewController(identifier: "AddServiceVC")
        present(nextVC, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        cell.setup(with: services[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let delegate = delegate {
            delegate.didSelect(service: services[indexPath.row])
            navigationController?.popViewController(animated: true)
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        loadAllServices()
    }
}
