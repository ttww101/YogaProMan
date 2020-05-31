//
//  LCDatabase.swift
//  FitnessProMan
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 YaorongHuang. All rights reserved.
//

import Foundation
import UIKit
import LeanCloud

class LCDatabase {
    static let shared = LCDatabase()
    let userDefault = UserDefaults.standard
    var objectId = ""
    
    private init() {
        
    }
    
    func configure() {
        do {
            try LCApplication.default.set(
                id:  "EXJDthSVUhl2PusoxwiHNAKO-MdYXbMMI",
                key: "d7apohY4jWeXJFt8faRS4WMC"
            )
        } catch {
            print("")
        }
    }
    
    func getProPri(completion: @escaping ([String:String]?, Error?) -> Void) {
        let query = LCQuery(className: "propri")
        let _ = query.getFirst { (result) in
            switch result {
            case .success(object: let object):
                // get value by string key
                guard let flag = object.get("flag")?.stringValue else {
                    completion(nil, nil)
                    return
                }
                guard let title = object.get("title")?.stringValue else {
                    completion(nil, nil)
                    return
                }
                let model = ["flag": flag,
                             "title": title]
                completion(model, nil)
            case .failure(error: let error):
                completion(nil, nil)
            }
        }
    }
}
