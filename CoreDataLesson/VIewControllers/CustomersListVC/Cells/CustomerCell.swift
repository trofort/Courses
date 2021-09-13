//
//  CustomerCell.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit

final class CustomerCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    func setup(with customer: Customer) {
        titleLabel.text = customer.name
        infoLabel.text = customer.info
    }
}
