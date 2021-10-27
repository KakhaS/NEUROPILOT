//
//  tableViewClass.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 28.09.21.
//

import Foundation

enum SelectedStatus {
    case isSelected
    case isNotSelected
}

struct CellFunctions {
    var tableviewData: String
    var identification: String?
    var isSelected: SelectedStatus = .isNotSelected
}
