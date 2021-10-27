//
//  DemoTableViewCell.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 22.09.21.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellDesign: UIButton!
    @IBOutlet weak var cellView: UIView!

    func setUp(cell: CellFunctions) {
        if cell.isSelected == .isSelected {
            cellDesign.setImage(UIImage(named: "checkMark"), for: .normal)
        } else {
            cellDesign.setImage(UIImage(named: "unCheckMark"), for: .normal)
        }
        cellLabel.text = cell.tableviewData
        cellDesign.accessibilityIdentifier = cell.identification
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
