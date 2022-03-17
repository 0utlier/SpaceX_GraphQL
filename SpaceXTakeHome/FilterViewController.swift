//
//  DescriptionViewController.swift
//  SpaceXTakeHome
//
//  Created by Saturn on 3/14/22.
//

import Foundation
import SwiftUI

class FilterViewController: UIViewController {
    
    var arrayOfFilters = ["Year", "Alphabetize", "Date", "Clear Filter", "Other"]
    let dao = DAO.sharedInstance
    let popUp = Popup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtons()
    }
    
    @objc func buttonAction(_ sender:UIButton!)
    {
        if sender.titleLabel?.text! == "Year" {
            view.addSubview(popUp)
        }
        else {
            self.navigationController?.popViewController(animated: true)
            //            print("User Tapped \(sender.titleLabel?.text! ?? "Mysterious Button")")
            dao.currentFilter = sender.titleLabel?.text! ?? "Wrong"
        }
    }
    
    
    func createButtons() { // adaptable to "screen size" AND "array count" for future filter additions
        let view = UIView()
        view.backgroundColor = .white
        let heightDivided:Int = Int(self.view.frame.height)/(arrayOfFilters.count+1)
        let middlePoint = Int(self.view.frame.width)/2
        let widthOfButton = 100
        for i in 1...arrayOfFilters.count {
            let currentButton = UIButton(type: .system)
            currentButton.frame = CGRect(x: middlePoint-(widthOfButton/2), y: heightDivided*i, width: widthOfButton, height: 50)
            currentButton.setTitle(arrayOfFilters[i-1], for: .normal)
            currentButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
            currentButton.backgroundColor = UIColor.lightGray
            view.addSubview(currentButton)
            self.view = view
        }
    }
}
