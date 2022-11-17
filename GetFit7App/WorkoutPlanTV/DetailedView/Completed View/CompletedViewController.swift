//
//  CompletedViewController.swift
//  GetFit7App
//
//  Created by Venkatram G V on 12/10/22.
//

import UIKit

class CompletedViewController: UIViewController {
    
    @IBOutlet weak var nightTime: UILabel!
    @IBOutlet weak var morningTime: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var suggestDayLabel: UILabel!
    
    let day:String
    
    init(day: String) {
        self.day = day
        super.init(nibName: "CompletedViewController", bundle: nil)
    }
    
    let timesuggestion = TimeSuggestion()
    let tomorrow = Calendar.current.date(byAdding: DateComponents(day: 1), to: Date())
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tomorrowDate = timesuggestion.dateFormatterTomorrow().string(from: tomorrow ?? Date())
        let morning = timesuggestion.morningTime(time: tomorrowDate)
        let night = timesuggestion.nightTime(time: tomorrowDate)
        morningTime.text = "6AM - in " + String(round((Double(morning.timeIntervalSinceNow) / 3600) * 100) / 100) + "Hrs"
        nightTime.text = "6PM - in " + String(round((Double(night.timeIntervalSinceNow) / 3600) * 100) / 100) + "Hrs"
        dayLabel.text = "Completed \(day)"
    }
    @IBAction func HomeButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
        let name = Notification.Name(rawValue: completedKey)
        NotificationCenter.default.post(name: name, object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
