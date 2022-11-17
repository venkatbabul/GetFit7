//
//  DayWorkoutPlanViewController.swift
//  GetFit7App
//
//  Created by Venkatram G V on 25/03/22.
//

import UIKit

//protocol DayWorkoutPlanViewControllerDelegate{
//    func startDayWorkout(id: String) -> Bool
//    func didCompletedWorkoutPlanNamed(_ name: String)
//}


class DayWorkoutPlanViewController: UIViewController{
        var db = DatabaseHelper()
    //    var delegate: DayWorkoutPlanViewControllerDelegate?
    var dayWorkoutPlan: DayWorkoutPlan
    var workoutName: String
    let asyncQueue = DispatchQueue(label: "AsyncQueue", qos: .userInitiated)
    let defaults = UserDefaults.standard
    
    init(dayWorkoutPlan dayWorkoutplan: DayWorkoutPlan, workoutName: String){
        self.dayWorkoutPlan = dayWorkoutplan
        self.workoutName = workoutName
        super.init(nibName: "DayWorkoutPlanViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UINib(nibName: "DayWorkoutPlanTableViewCell", bundle: nil), forCellReuseIdentifier: DayWorkoutPlanTableViewCell.identifier)
        return tableView
    }()
    
    let completed = Notification.Name(rawValue: completedKey)
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "BgColor")
        view.addSubview(tableView)
        configureTV()
        title = self.dayWorkoutPlan.name
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 190
        self.tableView.sectionFooterHeight = 50
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        createObservers()
    }
    
    func configureTV(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        let button = UIButton()
        func addConstrains(){
            button.translatesAutoresizingMaskIntoConstraints = false
            
            let constrains = [button.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
                              button.widthAnchor.constraint(equalTo: footerView.widthAnchor, multiplier: 0.6),
                              button.heightAnchor.constraint(equalTo: footerView.heightAnchor,multiplier: 1.0),
                              button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)]
            
            NSLayoutConstraint.activate(constrains)
        }
        
        button.setTitle("Start", for: .normal )
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(UIColor(named: "CompleteButtonTintColor"), for: .normal)
        button.backgroundColor = UIColor(named: "CompleteButtonViewBg")
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5.0
        
        footerView.addSubview(button)
        addConstrains()
        button.addTarget(self, action: #selector(starting), for: .touchUpInside)
        return footerView
    }
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Button Disabled", message: "Complete previous day workout to enable this workout.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func createObservers() {
        // Completed
        NotificationCenter.default.addObserver(self, selector: #selector(updateCell(notification:)), name: completed, object: nil)
        
    }
    
    @objc func updateCell(notification: NSNotification){
        
        self.navigationController?.popViewController(animated: true)
        let name = Notification.Name(rawValue: doneKey)
        NotificationCenter.default.post(name: name, object: self, userInfo: ["name": "\(self.dayWorkoutPlan.name)"])
        
    }
    
    @objc func starting(sender: UIButton){
        
        let object = dayWorkoutPlan
        let object1 = workoutName
        //        let id = dayWorkoutPlan.id
        //        let buttonEnable = self.delegate?.startDayWorkout(id: id)
        //        if buttonEnable == false{
        //            showSimpleAlert()
        //        }
        let vc = DetailedViewController(dayWorkOut: object.dayWorkoutList, dayWorkoutPlanName: object.name, workoutName: object1, isCompleted: object.isCompleted)
        //        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DayWorkoutPlanViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DayWorkoutPlanViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayWorkoutPlanTableViewCell.identifier, for: indexPath) as! DayWorkoutPlanTableViewCell
//        let object = dayWorkoutPlan.dayWorkoutList[indexPath.row]
//        cell.nameLabel.text = object.name
//        cell.countLabel.text = object.summary
        //        let obj = db.show(part: workoutName, day: dayWorkoutPlan.name)
        //        cell.nameLabel.text = obj[indexPath.row].name
        //        cell.countLabel.text = obj[indexPath.row].summary
        //        asyncQueue.async {
        //            let img = UIImage.gifImageWithName(object.imageName)
        //            DispatchQueue.main.async {
        //                if cell.nameLabel.text == object.name {
        //                    cell.gifImage.image = img
        //                }
        //            }
        //        }
        let obj = db.read(part: workoutName, day: dayWorkoutPlan.name)
        cell.nameLabel.text = obj[indexPath.row].name
        cell.countLabel.text = obj[indexPath.row].summary
        
        return cell
    }
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayWorkoutPlan.dayWorkoutList.count
    }
}

//extension DayWorkoutPlanViewController: DetailedViewControllerDelegate{
//    
//    func workoutCompleted() {
//        self.navigationController?.popViewController(animated: true)
//        self.delegate?.didCompletedWorkoutPlanNamed(self.dayWorkoutPlan.name)
//    }
//}
