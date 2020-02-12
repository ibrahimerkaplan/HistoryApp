//
//  HistoryVM.swift
//  HistoryApp
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import Foundation

class HistoryVM {
    
    var reloadViewTitle: (()->())?
    var reloadInfoUrl: ((Bool)->())?
    var reloadTableViewClosure: (()->())?

    enum ModelType {
        case event
        case birth
        case death
    }

    private struct models {
        var headers: [HeaderCVM]
        var events: [DetailDayCVM]
        var births: [DetailDayCVM]
        var deaths: [DetailDayCVM]
    }
    
    private var cellViewModels: models = models(headers: [HeaderCVM](), events: [DetailDayCVM](), births: [DetailDayCVM](), deaths: [DetailDayCVM]()) {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
        
    func initFetch() {
        DateAPI.getDates { (response, error) in
            if (response != nil) {
                self.processFetchedData(dateResponse: response!)
            }
        }
    }

    var title: String? {
        didSet {
            self.reloadViewTitle?()
        }
    }
        
    var infoUrl: String? {
        didSet {
            self.reloadInfoUrl?(self.infoUrl!.verifyUrl())
        }
    }
    
    var numberOfSection: Int {
        return cellViewModels.headers.count
    }
    
    func numberOfCell( at section: Int ) -> Int {
        switch section {
        case 0:
            return cellViewModels.events.count
        case 1:
            return cellViewModels.births.count
        case 2:
            return cellViewModels.deaths.count
        default:
            return 0
        }
    }

    func getCellViewModel( at index: IndexPath ) -> DetailDayCVM {
        switch index.section {
        case 0:
            return cellViewModels.events[index.row]
        case 1:
            return cellViewModels.births[index.row]
        case 2:
            return cellViewModels.deaths[index.row]
        default:
            return DetailDayCVM(name: "", detail: "", year: "", detailYear: "")
        }
    }
    
    func getHeaderViewModel( at section: Int ) -> HeaderCVM {
        return cellViewModels.headers[section]
    }
    
    private func processFetchedData( dateResponse: ApiResponse ) {
        
        self.title = dateResponse.date ?? ""
        self.infoUrl = dateResponse.url ?? ""

        var headers = [HeaderCVM]()
        
        headers.append(HeaderCVM(title: "💭 Events"))
        var events = [DetailDayCVM]()
        for data in (dateResponse.data?.events)! {
            events.append( createCellViewModel(data: data, type: .event) )
        }
        
        headers.append(HeaderCVM(title: "🎂 Births"))
        var births = [DetailDayCVM]()
        for data in (dateResponse.data?.births)! {
            births.append( createCellViewModel(data: data, type: .birth) )
        }
        
        headers.append(HeaderCVM(title: "⚰ Deaths"))
        var deaths = [DetailDayCVM]()
        for data in (dateResponse.data?.deaths)! {
            deaths.append( createCellViewModel(data: data, type: .death) )
        }

        self.cellViewModels = models(headers: headers, events: events, births: births, deaths: deaths)
    }

    private func createCellViewModel( data: Detail, type: ModelType) -> DetailDayCVM {
        
        var name = "", detail = "", year = "", detailYear = ""

        switch type {
        case .event:
            name = data.text ?? ""
        case .birth, .death:
            name = data.text!.getNameWithServiceFormat()
            detail = data.text!.getDetailWithServiceFormat()
            detailYear = data.text!.getDetailYearWithServiceFormat()
        }
        year = data.year!.getYearWithServiceFormat()

        return DetailDayCVM( name: name,
                             detail: detail,
                             year: year,
                             detailYear: detailYear )
    }
        
}
