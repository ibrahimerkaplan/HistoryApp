//
//  HistoryVC.swift
//  HistoryApp
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import UIKit

private let cellIdentifier = "Cell"
private let cellDetailDayIdentifier = "DetailDayCell"
private let cellHeaderIdentifier = "HeaderCell"

class HistoryVC: BaseVC {

    @IBOutlet weak var tableviewDate: UITableView!
    @IBOutlet weak var labelDate: BaseLabel!
    @IBOutlet weak var buttonInfo: UIButton!
    
    private var viewModelHistory = HistoryVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    @IBAction func buttonInfoPressed(_ sender: Any) {
        self.viewModelHistory.infoUrl!.openUrlInSafari()
    }
    
}

// MARK: UI
extension HistoryVC {
    
    private func setupUI() {
        initVM()
    }
    
    private func initVM() {
        viewModelHistory.reloadViewTitle = { [weak self] () in
            DispatchQueue.main.async {
                self?.labelDate.text = self?.viewModelHistory.title
            }
        }
        
        viewModelHistory.reloadInfoUrl = { [weak self] (isValid) in
            DispatchQueue.main.async {
                self?.buttonInfo.isHidden = !isValid
            }
        }
        
        viewModelHistory.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableviewDate.reloadData()
            }
        }
        
        viewModelHistory.initFetch()
    }

}

// MARK: UITableViewDatasource
extension HistoryVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModelHistory.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelHistory.numberOfCell(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellDetailDayIdentifier, for: indexPath) as! DetailDayCell
        let cellVM = viewModelHistory.getCellViewModel(at: indexPath)
        cell.viewModelDetailDayCell = cellVM
        return cell

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHeaderIdentifier) as! HeaderCell
        let cellVM = viewModelHistory.getHeaderViewModel(at: section)
        cell.viewModelHeaderCell = cellVM
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension HistoryVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}


