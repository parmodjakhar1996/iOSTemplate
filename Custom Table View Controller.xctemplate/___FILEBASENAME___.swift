//
// ___FILENAME___
// ___PROJECTNAME___
//
// Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    class func controller() -> ___FILEBASENAMEASIDENTIFIER___? {
        let vc = ___FILEBASENAMEASIDENTIFIER___(nibName: "___FILEBASENAMEASIDENTIFIER___", bundle: nil)
        return vc
    }

    @IBOutlet private weak var tableView: UITableView!
    private var viewManager: ___VARIABLE_prefix___Mgr?
    private var sectionTypeIds: [___VARIABLE_prefix___SectionId]!
    private var sectionRowsMapping: [___VARIABLE_prefix___SectionId: [___VARIABLE_prefix___CellId]]!
    private var dataModelMapping: [___VARIABLE_prefix___CellId: ___VARIABLE_prefix___BaseModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initilize()
    }
    
    
    private func initilize() {
        viewManager = ___VARIABLE_prefix___Mgr()
        self.tableView.estimatedRowHeight = 44
        self.fillDataModel()
        self.registerXibs()
    }
    
    private func updateDataModel() {
        sectionTypeIds = []
        sectionRowsMapping = [:]
        dataModelMapping = [:]
        
        guard let viewManager = self.viewManager else {
            return
        }
        
        let viewSections = viewManager.getSections()
        for sectionTypeId in viewSections {
            sectionTypeIds?.append(sectionTypeId)
            if let sectionRows = viewManager.getRowsForSection(sectionTypeId) {
                sectionRowsMapping?[sectionTypeId] = sectionRows
                for cellTypeId in sectionRows {
                    dataModelMapping[cellTypeId] = viewManager.getDataModelFor(cellTypeId)
                }
            } else {
                sectionRowsMapping?[sectionTypeId] = []
            }
        }
    }
    
    private func fillDataModel() {
        self.updateDataModel()
    }
    
    private func registerXibs() {
        self.tableView.register(___VARIABLE_prefix___BaseCell.nib, forCellReuseIdentifier: ___VARIABLE_prefix___BaseCell.identifier)
        self.tableView.register(___VARIABLE_prefix___SeparatorCell.nib, forCellReuseIdentifier: ___VARIABLE_prefix___SeparatorCell.identifier)
    }
    
    private func defaultCell() -> ___VARIABLE_prefix___BaseCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: ___VARIABLE_prefix___BaseCell.identifier) as! ___VARIABLE_prefix___BaseCell
        return cell
    }
}
//MARK:-UITableViewDataSource
extension ___FILEBASENAMEASIDENTIFIER___: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sectionTypeIds = self.sectionTypeIds else {
            return 0
        }
        return sectionTypeIds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionTypeIds = self.sectionTypeIds, let sectionRowsMapping = self.sectionRowsMapping, let sectionRowsTypeIds = sectionRowsMapping[sectionTypeIds[section]]  else {
            return 0
        }
        return sectionRowsTypeIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionTypeIds = self.sectionTypeIds, let sectionRowsMapping = self.sectionRowsMapping, let sectionRowsTypeIds = sectionRowsMapping[sectionTypeIds[indexPath.section]]  else {
            return defaultCell()
        }

        let cellTypeId = sectionRowsTypeIds[indexPath.row]
        let dataModel = dataModelMapping[cellTypeId]
        if let dataModel = dataModel, let cellidentifier = dataModel.cellIdentifier, let cell =  tableView.dequeueReusableCell(withIdentifier: cellidentifier) as? ___VARIABLE_prefix___BaseCell {
            cell.setDataModel(dataModel)
            cell.setDelegate(self)
            return cell
        }
        
        return defaultCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
//MARK:-UITableViewDelegate
extension ___FILEBASENAMEASIDENTIFIER___: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
