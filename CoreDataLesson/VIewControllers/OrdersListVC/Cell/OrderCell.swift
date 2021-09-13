//
//  OrderCell.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit

final class OrderCell: UITableViewCell {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var customerLabel: UILabel!
    
    func setup(with order: Order) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MMM.yy"
        if let date = order.date {
            dateLabel.text = dateFormatter.string(from: date)
        }
        customerLabel.text = order.customer?.name
    }
    
}
