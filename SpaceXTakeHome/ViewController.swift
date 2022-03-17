//
//  ViewController.swift
//  SpaceXTakeHome
//
//  Created by Saturn on 3/13/22.
//

import SwiftUI
import Apollo


final class MainViewController: UIViewController {
    // MARK: VARIABLES
    let dao = DAO.sharedInstance
    
    var launches: [LaunchesQuery.Data.LaunchesPast?]? {didSet {tableView.reloadData()}}
    var launchesSorted: [LaunchesQuery.Data.LaunchesPast?]? {didSet {}}
    
    // MARK: OUTLETS
    @IBOutlet var tableView: UITableView!
    @IBOutlet var filterInfoResetButton: UIButton!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var descendingButton: UIButton!
    
    // MARK: BUTTON ACTIONS
    @IBAction func filterButtonPressed(_ sender: Any) {
        dao.currentYearsShow = [] //clear the filter of years
        let FVC = self.storyboard!.instantiateViewController(withIdentifier: "FilterViewController")
        self.navigationController!.pushViewController(FVC, animated: true)
    }
    @IBAction func filterInfoResetButtonPressed(_ sender: Any) {
        dao.currentFilter = ""
        dao.currentYearsShow = []
        filterInfoResetButton.setTitle("No Filter", for: .normal)
        tableView.reloadData()
    }
    @IBAction func descendingButtonPressed(_ sender: Any) {
        if (dao.descendingOrder) {
            dao.descendingOrder = false
            descendingButton.setTitle("Order:Asc", for: .normal)
        }
        else {
            dao.descendingOrder = true
            descendingButton.setTitle("Order:Des", for: .normal)
        }
        tableView.reloadData()
    }
    
    
    // MARK: VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (dao.currentFilter == "") {
            filterInfoResetButton.setTitle("No Filter", for: .normal)
            descendingButton.setTitle("Order", for: .normal)
        }
        loadData()
        tableView.reloadData()
    }
    
    
    // MARK: DATA
    func loadData() {
        Network.shared.apollo.fetch(query: LaunchesQuery()) { result in
            switch result {
            case .success(let launchResultQL):
                DispatchQueue.main.async {
                    self.launches = (launchResultQL.data!.launchesPast)
                }
            case .failure(let error):
                print("ABORT LIFT OFF! Error: \(error)")
            }
        }
    }
    
    func filterLaunches(filter:String) {
        var sortOrder = "Asc"
        if dao.descendingOrder {
            sortOrder = "Des"
        }
        switch filter {
        case "Year":
//            print("Filter is year")
            filterInfoResetButton.setTitle("\(dao.currentYearsShow)", for: .normal)
        case "Alphabetize":
//            print("Order is Alphab")
            filterInfoResetButton.setTitle("Alpha \(sortOrder)", for: .normal)
            self.launchesSorted = self.launches?.sorted { ($0?.missionName)! < ($1?.missionName)!}
        case "Date":
//            print("Order is Date")
            filterInfoResetButton.setTitle("Date \(sortOrder)", for: .normal)
            self.launchesSorted = self.launches?.sorted { ($0?.launchDateUtc)! < ($1?.launchDateUtc)!}
        case "Clear Filter":
            filterInfoResetButtonPressed(self)
        default:
//            print("No filter yet")
            self.launchesSorted = self.launches
            
        }
        if dao.descendingOrder {
            self.launchesSorted?.reverse()
        }
    }
    
    func editUTCReadability(utcString: String) -> String {
        var utcStringUpdated = utcString.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)
        utcStringUpdated = utcStringUpdated.replacingOccurrences(of: ".000Z", with: "", options: .literal, range: nil)
        return utcStringUpdated
    }
}

// MARK: Table Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(editUTCReadability(utcString:self.launches![indexPath.row]!.launchDateUtc!)) // needs an if let
        var infoContent: [String] = []
        if let label = self.launchesSorted?[indexPath.row] { // ensure data is available
            infoContent.append(label.missionName!)
            infoContent.append(label.launchDateUtc!)
            infoContent.append(label.details ?? "No details to present")
            dao.stringsForInfoContent = infoContent
        }
        let IVC = self.storyboard!.instantiateViewController(withIdentifier: "InfoViewController")
        self.navigationController!.pushViewController(IVC, animated: true)
    }
}

// MARK: Table DATA
extension MainViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // check for Filter [if it exists, split]
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.launches?.count ?? 10 // ensure data is available OR deliver default
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultRowSize: CGFloat = 60 //default and can be changed to impact
        if tableView.numberOfRows(inSection: 1) < 11 { // if empty
            return defaultRowSize
        }
        if let label = self.launchesSorted?[indexPath.row] { // ensure data is available
            if !(dao.currentYearsShow.isEmpty) { // ensure filter is not empty
                filterInfoResetButton.setTitle("\(dao.currentYearsShow)", for: .normal)
                for year in dao.currentYearsShow {
                    if (label.launchDateUtc!.contains("\(year)")) {
                        return defaultRowSize
                    }
                }
            }
            else { // default in case no filter
                return defaultRowSize
            }
        }
        return 0 // hide row due to filter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        filterLaunches(filter: dao.currentFilter)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let label = self.launchesSorted?[indexPath.row] {
            cell.textLabel?.text = label.missionName
            cell.detailTextLabel?.text = "UTC: \(editUTCReadability(utcString: label.launchDateUtc!))"
        }
        else {
            cell.textLabel?.text = "LOADING..."
            cell.detailTextLabel?.text = "loading details..."
            
        }
        // this was in case the data was unavailable entirely
        /*
         if tableView.numberOfRows(inSection: 1) < 2 {
         cell.textLabel?.text = "Database not currently available"
         cell.detailTextLabel?.text = "Please try again later"
         return cell
         }
         */
        return cell
    }
}
