//
//  MainVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit

final class MainVC: UIViewController {
    // Vadim was hele 11/09/2023
    
    @IBAction func customerDidTap() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "CustomersListVC")
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func orderDidTap() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "OrdersListVC")
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func serviceDidTap() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "ServicesListVC")
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction func rowOfOrderDidTap() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "RowOfOrdersListVC")
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    @IBAction func newOfOrderDidTap() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "RowOfOrdersListVC")
        navigationController?.pushViewController(nextVC, animated: true)
        
        // Vadim was hele 11/09/2023
    }

}
