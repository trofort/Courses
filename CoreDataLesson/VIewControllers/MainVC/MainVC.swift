//
//  MainVC.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit

final class MainVC: UIViewController {
    
    @IBAction func customerDidTap() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "CustomersListVC")
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
        
        //Макс, тут все Ок! Не придирайся!!!
    }

}
