//
// ___FILENAME___
// ___PROJECTNAME___
//
// Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import Foundation

enum ___VARIABLE_prefix___SectionId: Int {
    case base
}

enum ___VARIABLE_prefix___CellId: Int {
    case base
    case separatorCell
}

class ___FILEBASENAMEASIDENTIFIER___: NSObject {
    var cellIdentifier: String!
    
    init(_ identifier: String) {
        self.cellIdentifier = identifier
    }
}
