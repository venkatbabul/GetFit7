//
//  HomePageViewController.swift
//  GetFit7App
//
//  Created by Venkatram G V on 23/03/22.
//

import UIKit
import UserNotifications

let completedKey = "CompletedKey"
let doneKey = "DoneKey"

class HomePageViewController: UIViewController{
//    let db = DBHelper()
    let db = DatabaseHelper()
    var workout = Workout.createObjects()
    var partCount = ""
    var dayCount = ""
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "HomePageTableViewCell", bundle: nil), forCellReuseIdentifier: HomePageTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        //Database
        //        db.createDataBaseConnection()
        //        db.createWorkoutListTable()
        //        db.createDayWorkoutListTable()
        //        db.createPartWorkoutListTable()
        //
        //        for i in workout{
        //            print(i.name)
        //            partCount = i.name
        //            db.insertPartWorkoutList(partName: i.name)
        //            for j in i.workoutPlan{
        //                dayCount = j.name
        //                print(j.name)
        //                db.insertDayWorkoutList(dayName: j.name)
        //                for k in j.dayWorkoutList{
        //                    print(k.name)
        //                    db.insertWorkoutList(workoutName: k.name, workoutSummary: k.summary, part: partCount, day: dayCount)
        //                }
        //            }
        //        }
        //        db.showDayWorkoutList()
        //        db.showPartWorkoutList()
        //        db.showWorkoutList()
        //        db.showWorkoutList()
        //        db.showResult()
        db.createTablePartWorkout()
        db.createTableDayWorkout()
        db.createTableWorkout()
        for i in workout{
            db.insertPartWorkout(part: i.name)
            for j in i.workoutPlan{
                db.insertDaytWorkout(day: j.name)
                for k in j.dayWorkoutList{
                    db.inserttWorkout(name: k.name, summary: k.summary, day: j.name, part: i.name)
                }
            }
        }
        
        //Notification
        sendNotification()
        
        tableView.backgroundColor = UIColor(named: "BgColor")
        self.tableView.rowHeight = 160
        view.addSubview(tableView)
        configureTV()
        title = "Work Out"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "BackButtonColor")!]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    func sendNotification(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in }
        let content = UNMutableNotificationContent()
        content.title = "Hey, It's 6am!"
        content.body = "Let us start our day with workout."
        content.sound = UNNotificationSound.default
        let date = Date().addingTimeInterval(10)
        let dateComponent = Calendar.current.dateComponents([.day ,.hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        center.add(request)
    }
    
    func configureTV() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension HomePageViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = workout[indexPath.row]
        let vc = DayViewController(withWorkout: object)
        vc.db = db
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomePageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.identifier, for: indexPath) as! HomePageTableViewCell
        
        let object = workout[indexPath.row]
        cell.nameLabel.text = object.name
        cell.imagesView.image = object.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.count
    }
    
}
