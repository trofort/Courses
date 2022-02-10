//
//  AddOrderVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit
import CoreData

// Harnashevich Andrei comment
// Harnashevich Andrei new comment

final class AddOrderVC: UIViewController, CustomersListVCDelegate, AddRowOfOrderDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var madeSwitch: UISwitch!
    @IBOutlet private weak var paidSwitch: UISwitch!
    @IBOutlet private weak var customerButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    private var selectedCustomer: Customer? {
        didSet {
            customerButton.setTitle(selectedCustomer?.name, for: .normal)
        }
    }
    
    private var rows = [RowOfOrder]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func selectDidTap() {
        if let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "CustomersListVC") as? CustomersListVC {
            nextVC.delegate = self
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func didSelect(customer: Customer) {
        selectedCustomer = customer
    }
    
    @IBAction func cancelDidTap() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveDidTap() {
        let order = Order(moc: CoreDataService.managedObjectContext)
        order?.date = datePicker.date
        order?.made = !madeSwitch.isOn
        order?.paid = !paidSwitch.isOn
        order?.customer = selectedCustomer
        order?.rowsOfOrder = NSSet(array: rows)
        
        CoreDataService.saveContext()
        
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addRowTapped() {
        if let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "AddRowOfOrder") as? AddRowOfOrder {
            nextVC.delegate = self
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func didCreate(row: RowOfOrder) {
        rows.append(row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = rows[indexPath.row].service?.name
        return cell
    }
}
