//
//  StringUtility.swift
//  HistoryApp
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import UIKit

extension String {
    
    func getNameWithServiceFormat() -> String {
        var name = self.matches(for: "(.*?)(?=,)").first ?? ""
        if  name.count == 0{
            name = self.matches(for: "(.*?)(?= \\()").first ?? ""
        }
        if  name.count == 0{
            name = self
        }
        return name
    }
    
    func getYearWithServiceFormat() -> String {
        return "Year: " + self 
    }
    
    func getDetailWithServiceFormat() -> String {
        return self.matches(for: "(?<=, ).*(?= \\()").first ?? ""
    }
    
    func getDetailYearWithServiceFormat() -> String {
        return self.matches(for: "\\(.*\\)").first ?? ""
    }
    
    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func openUrlInSafari() {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: self)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL(string: self)!)
        }
    }
    
    func verifyUrl () -> Bool {

        if let url = NSURL(string: self) {
            // check if your application can open the NSURL instance
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
}
