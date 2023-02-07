//
//  WinVC.swift
//  CoreDataLesson
//
//  Created by Treschik on 7.02.23.
//

import Foundation
import UIKit

class WinVC: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var label1: UILabel!
    var record: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "\(record!) sec"
    }
}
