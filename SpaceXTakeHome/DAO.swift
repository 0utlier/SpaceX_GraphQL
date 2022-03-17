//
//  DAO.swift
//  SpaceXTakeHome
//
//  Created by Saturn on 3/14/22.
//

import Foundation
import UIKit
import Apollo

final class DAO: NSObject {
   static let sharedInstance = DAO()

   private override init() { }
    var currentFilter = ""
    var currentYearsShow = [String]()
    var descendingOrder = false
    var stringsForInfoContent: [String] = []
//    var launchE = launchEx.init(missionEx: "", utcDateEx: )
//    var launches: [LaunchesQuery.Data.LaunchesPast?]? {
//        didSet {
//        }
//    }
//    
//    func loadData() {
//        Network.shared.apollo.fetch(query: LaunchesQuery()) { result in
//            switch result {
//            case .success(let launchResultQL):
//                DispatchQueue.main.async {
//                    self.launches = (launchResultQL.data!.launchesPast)
//                    let vc = MainViewController()
//                    vc.launches = self.launches
//                }
//            case .failure(let error):
//                print("ABORT LIFT OFF! Error: \(error)")
//            }
//        }
//    }

    struct launchEx {
        var missionEx: String
        var utcDateEx: Date
        
        init(missionEx: String, utcDateEx: Date) {
            self.missionEx = missionEx
            self.utcDateEx = utcDateEx
            
        }
    }
}
