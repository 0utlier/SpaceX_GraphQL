//
//  InfoViewController.swift
//  SpaceXTakeHome
//
//  Created by Saturn on 3/16/22.
//

import Foundation
import SwiftUI

class InfoViewController: UIViewController {
    
    let dao = DAO.sharedInstance
    
    @IBOutlet weak var detailsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dao.stringsForInfoContent)
        self.title = self.dao.stringsForInfoContent[0]
        detailsText.text = "\(dao.stringsForInfoContent[2])"
    }
    
}
