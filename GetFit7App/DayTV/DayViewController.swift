//
//  DayViewController.swift
//  GetFit7App
//
//  Created by Venkatram G V on 23/03/22.
//

import UIKit
import SQLite3

class DayViewController: UIViewController {
    
    var workout: Workout
    var db = DatabaseHelper()
    let SQLITE_TRANSITE = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    let defaults = UserDefaults.standard
    
    let completed = Notification.Name(rawValue: doneKey)
    
    init(withWorkout workout: Workout){
        self.workout = workout
        super.init(nibName: "DayViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: DayTableViewCell.identifier)
        return tableView
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "BgColor")
        view.addSubview(tableView)
        self.configureTV()
        self.tableView.rowHeight = 100
        title = self.workout.name
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        self.navigationController?.navigationBar.tintColor = UIColor(named: "BackButtonColor")
        createObserver()
    }
    
    func configureTV() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateCell(notification:)), name: completed, object: nil)
    }
    
    @objc func updateCell(notification: NSNotification){
        
        
        if let nameInfo = notification.userInfo{
            if let workName = nameInfo["name"] as? String{
                let workoutName = self.workout.name
                let name = self.workout.completeWorkOut(planName: workName, workOutName: workoutName)
                print(name)
                defaults.set(true, forKey: name)
            }
            
        }
        
        tableView.reloadData()
        
    }
}


extension DayViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = workout.workoutPlan[indexPath.row]
        let object1 = workout.name
        let vc = DayWorkoutPlanViewController(dayWorkoutPlan: object, workoutName: object1)
        vc.db = db
        //        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DayViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayTableViewCell.identifier, for: indexPath) as! DayTableViewCell
        let object = workout.workoutPlan
        cell.nameLabel.text = object[indexPath.row].name
        let completed = defaults.bool(forKey: object[indexPath.row].id)
        //print("Object Name:- \(object.name)")
        if completed{
            cell.placeHolderView.backgroundColor = .green
        } else {
            cell.placeHolderView.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.workoutPlan.count
    }
}


//extension DayViewController: DayWorkoutPlanViewControllerDelegate{
//    func startDayWorkout(id: String) -> Bool {
//        let index = self.workout.workoutPlan.firstIndex { $0.id == id }!
////        let currentid = workout.workoutPlan[index].id
////        print("index: ",index)
////        print("currentid: ",currentid)
//        if index == 0 {
//            return true
//        }
//        else if index > 0{
//            let lastID = workout.workoutPlan[index - 1].id
//            let isDone = defaults.bool(forKey: lastID)
////            print("status1 : ",lastID)
//            if isDone{
//                return true
//            }
//        }
//        return false
//    }
//
//    func didCompletedWorkoutPlanNamed(_ name: String) {
//        let workoutName = self.workout.name
//        let name = self.workout.completeWorkOut(planName: name, workOutName: workoutName)
////        print("Workout Name:- \(name)")
////        print(workoutName)
//        defaults.set(true, forKey: name)
//        defaults.set(workoutName, forKey: workoutName)
//
//
//        self.tableView.reloadData()
//    }
//
//}
