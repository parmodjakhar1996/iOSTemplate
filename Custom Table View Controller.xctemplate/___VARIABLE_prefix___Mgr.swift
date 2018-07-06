//
// ___FILENAME___
// ___PROJECTNAME___
//
// Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: NSObject {
    func getSections() -> [___VARIABLE_prefix___SectionId] {
        return [.base]
    }
    
    func getRowsForSection(_ sectionId: ___VARIABLE_prefix___SectionId) -> [___VARIABLE_prefix___CellId]? {
        switch sectionId {
        case .base:
            return [.base, .separatorCell, .base, .separatorCell, .base, .separatorCell, .base, .separatorCell]
        }
    }
    
    func getDataModelFor(_ cellId: ___VARIABLE_prefix___CellId) -> ___VARIABLE_prefix___BaseModel {
        switch cellId {
        case .base:
            return ___VARIABLE_prefix___BaseModel(___VARIABLE_prefix___BaseCell.identifier)
        case .separatorCell:
            return ___VARIABLE_prefix___BaseModel(___VARIABLE_prefix___SeparatorCell.identifier)
        default:
            return ___VARIABLE_prefix___BaseModel(___VARIABLE_prefix___BaseCell.identifier)
        }
    }
    
}
