//
//  RowOfOrderCell.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit

final class RowOfOrderCell: UITableViewCell {
    
    @IBOutlet private weak var customerLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    func setup(with row: RowOfOrder) {
        customerLabel.text = row.order?.customer?.name
        priceLabel.text = "\(row.sum)"
        if let date = row.order?.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MMMM/yyyy"
            
            dateLabel.text = formatter.string(from: date)
        }
    }
}
