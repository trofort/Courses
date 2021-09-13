//
//  ServiceCell.swift
//  CoreDataLesson
//
//  Created by Trofort on 2.09.21.
//

import UIKit

final class ServiceCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    func setup(with service: Service) {
        titleLabel.text = service.name
        infoLabel.text = service.info
    }
}
