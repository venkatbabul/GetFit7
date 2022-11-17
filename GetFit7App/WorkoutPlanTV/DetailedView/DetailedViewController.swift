//
//  DetailedViewController.swift
//  GetFit7App
//
//  Created by Venkatram G V on 04/04/22.
//

import UIKit
import WebKit
import AVFoundation
//protocol DetailedViewControllerDelegate: AnyObject{
//    func workoutCompleted()
//}
class DetailedViewController: UIViewController {
    
    var dayWorkOutList: [DayWorkout]
    let dayWorkoutPlanName: String
    let workoutName: String
    var isCompletedWorkout: Bool
    var audioArr: [String] = ["Believer_320(PagalWorld)", "Thenmozhi-MassTamilan.dev", "Senorita" ]
    var currentIndex = 0 {
        didSet {
            self.updateUI()
        }
    }
    var counter = 0
    let timer = Timer()
    
    init(dayWorkOut dayWorkout: [DayWorkout], dayWorkoutPlanName: String, workoutName: String, isCompleted: Bool){
        self.dayWorkOutList = dayWorkout
        self.dayWorkoutPlanName = dayWorkoutPlanName
        self.workoutName = workoutName
        self.isCompletedWorkout = isCompleted
        super.init(nibName: "DetailedViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    weak var delegate: DetailedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        playSongs()
        guard !self.dayWorkOutList.isEmpty else {
            assertionFailure("DayWorkOutList shouldn't be empty")
            return
        }
        self.updateUI()
    }
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var countField: UILabel!
    var webPlayer: WKWebView!
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func doneButton(_ sender: UIButton){
        self.currentIndex += 1
        if self.currentIndex == self.dayWorkOutList.count-1{
            sender.setTitle("Complete", for: .normal)
        }
    }
    
    func playSongs(){
        for i in audioArr{
            playSound(sound: i)
        }
    }
    
    func updateUI() {
        
        guard self.currentIndex < self.dayWorkOutList.count else {
            //            self.delegate?.workoutCompleted()
            
            //            let name = Notification.Name(rawValue: completedKey)
            //            NotificationCenter.default.post(name: name, object: nil)
            //            self.navigationController?.popViewController(animated: true)
            
            let vc = CompletedViewController(day: dayWorkoutPlanName)
            vc.isModalInPresentation = true
            self.present(vc, animated: true)
            return
        }
        let dayWorkout = self.dayWorkOutList[self.currentIndex]
        nameField.text = dayWorkout.name
        playView(url: "https://www.youtube.com/embed/HwzzGvKc3c0?playsinline=1")
        //        playSound(sound: "Whistle Sound Effect")
        //        imageField.image = UIImage.gifImageWithName(dayWorkout.imageName)
        countField.text = dayWorkout.summary
    }
    
    func playView(url: String){
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        DispatchQueue.main.async {
            self.webPlayer = WKWebView(frame: self.videoView.bounds, configuration: webConfiguration)
            self.videoView.addSubview(self.webPlayer)
            guard let videoURL = URL(string: url) else { return }
            let request = URLRequest(url: videoURL)
            self.webPlayer.load(request)
        }
    }
    
    func playSound(sound: String){
        guard let path = Bundle.main.path(forResource: sound, ofType: "mp3") else {
            print("no sound")
            return }
        let url = URL(fileURLWithPath: path)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print(error)
        }
    }
}

