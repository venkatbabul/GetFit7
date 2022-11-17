//
//  Workouts.swift
//  GetFit7App
//
//  Created by Venkatram G V on 23/03/22.


import Foundation
import UIKit
// DB Data
struct Details{
    let name: String
    let summary: String
}

//MyData
struct Workout{
    
    let name: String
    let image: UIImage
    var workoutPlan: [DayWorkoutPlan]
    
    mutating func completeWorkOut(planName: String, workOutName: String) -> String {
        
        for (index, workout) in workoutPlan.enumerated() {
            
            if workout.name == planName {
                
                workoutPlan[index].isCompleted = true
                return workoutPlan[index].id
            }
        }
        return ""
    }
}

struct DayWorkoutPlan{
    
    let name: String
    var id: String
    var isCompleted: Bool = false
    let dayWorkoutList: [DayWorkout]
    
}
struct DayWorkout{
    
    let name: String
    let summary: String
    let imageName: String
    
    
}


extension Workout{
    static func createObjects() -> [Workout] {
        //Arm Days
        //Day1
        let armDay1Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "PushUp")
        let armDay1WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName:"Pushup")
        let armDay1DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName:"Plank1")
        let armDay1PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let armDay1ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Plank1")
        let armDay1SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName:"Plank1")
        let armDay1TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay1Workout = [armDay1ArmRaise, armDay1SideArmRaise, armDay1Pushup, armDay1WallPushUp, armDay1DiamondPushUp, armDay1PullUp, armDay1TricepsDip]
        
        //Arm Day2
        let day2Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let day2WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName: "Pushup")
        let day2DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName:"Pushup")
        let day2PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let day2ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Pullup")
        let day2SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName: "Pushup")
        let day2TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay2Workout = [day2ArmRaise, day2SideArmRaise, day2Pushup, day2WallPushUp, day2DiamondPushUp, day2PullUp, day2TricepsDip]
        
        //Arm Day3
        let day3Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let day3WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName: "Pushup")
        let day3DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName: "Pushup")
        let day3PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let day3ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Pushup")
        let day3SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName: "Pushup")
        let day3TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay3Workout = [day3ArmRaise, day3SideArmRaise, day3Pushup, day3WallPushUp, day3DiamondPushUp, day3PullUp, day3TricepsDip]
        
        //Arm Day4
        let day4Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let day4WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName: "Pushup")
        let day4DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName: "Pushup")
        let day4PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let day4ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Pushup")
        let day4SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName: "Pushup")
        let day4TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay4Workout = [day4ArmRaise, day4SideArmRaise, day4Pushup, day4WallPushUp, day4DiamondPushUp, day4PullUp, day4TricepsDip]
        
        //Arm Day5
        let day5Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let day5WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName: "Pushup")
        let day5DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName: "Pushup")
        let day5PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let day5ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Pushup")
        let day5SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName: "Pushup")
        let day5TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay5Workout = [day5ArmRaise, day5SideArmRaise, day5Pushup, day5WallPushUp, day5DiamondPushUp, day5PullUp, day5TricepsDip]
        
        //Arm Day6
        let day6Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let day6WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName: "Pushup")
        let day6DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName: "Pushup")
        let day6PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let day6ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Pushup")
        let day6SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName: "Pushup")
        let day6TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay6Workout = [day6ArmRaise, day6SideArmRaise, day6Pushup, day6WallPushUp, day6DiamondPushUp, day6PullUp, day6TricepsDip]
        
        //Arm Day7
        let day7Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let day7WallPushUp: DayWorkout = DayWorkout(name: "Wall Pushup", summary: "10 X 3", imageName: "Pushup")
        let day7DiamondPushUp: DayWorkout = DayWorkout(name: "Diamond Pushup", summary: "10 X 3", imageName: "Pushup")
        let day7PullUp: DayWorkout = DayWorkout(name: "Pullup", summary: "10 X 3", imageName: "Pullup")
        let day7ArmRaise: DayWorkout = DayWorkout(name: "Arm Raise", summary: "10 X 3", imageName: "Pushup")
        let day7SideArmRaise: DayWorkout = DayWorkout(name: "SideArmRaise", summary: "10 X 3", imageName: "Pushup")
        let day7TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dip", summary: "10 X 3", imageName: "TriceDips")
        
        let armDay7Workout = [day7ArmRaise, day7SideArmRaise, day7Pushup, day7WallPushUp, day7DiamondPushUp, day7PullUp, day7TricepsDip]
        
        let armWorkOutPlan: [DayWorkoutPlan] = [DayWorkoutPlan(name: "Day1", id: "ArmDay1", dayWorkoutList: armDay1Workout),
                                                DayWorkoutPlan(name: "Day2", id: "ArmDay2", dayWorkoutList: armDay2Workout),
                                                DayWorkoutPlan(name: "Day3", id: "ArmDay3", dayWorkoutList: armDay3Workout),
                                                DayWorkoutPlan(name: "Day4", id: "ArmDay4", dayWorkoutList: armDay4Workout),
                                                DayWorkoutPlan(name: "Day5", id: "ArmDay5", dayWorkoutList: armDay5Workout),
                                                DayWorkoutPlan(name: "Day6", id: "ArmDay6", dayWorkoutList: armDay6Workout),
                                                DayWorkoutPlan(name: "Day7", id: "ArmDay7", dayWorkoutList: armDay7Workout)]
        
        let arm = Workout(name: "ArmWorkout", image: UIImage(named: "Arm")!, workoutPlan: armWorkOutPlan)
        
        
        //Chest Days
        //Chest Day1
        let chestDay1Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay1Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay1Crunches: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay1WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay1TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay1KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay1Workout = [chestDay1Pushup, chestDay1Pullup, chestDay1Crunches, chestDay1WideArmPushup, chestDay1TricepsDip, chestDay1KneePushup]
        
        //Chest Day2
        let chestDay2Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay2Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay2InclinePushup: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay2WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay2TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay2KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay2Workout = [chestDay2Pushup, chestDay2Pullup, chestDay2InclinePushup, chestDay2WideArmPushup, chestDay2TricepsDip, chestDay2KneePushup]
        
        //Chest Day3
        let chestDay3Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay3Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay3InclinePushup: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay3WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay3TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay3KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay3Workout = [chestDay3Pushup, chestDay3Pullup, chestDay3InclinePushup, chestDay3WideArmPushup, chestDay3TricepsDip, chestDay3KneePushup]
        
        //Chest Day4
        let chestDay4Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay4Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay4InclinePushup: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay4WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay4TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay4KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay4Workout = [chestDay4Pushup, chestDay4Pullup, chestDay4InclinePushup, chestDay4WideArmPushup, chestDay4TricepsDip, chestDay4KneePushup]
        
        //Chest Day5
        let chestDay5Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay5Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay5InclinePushup: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay5WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay5TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay5KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay5Workout = [chestDay5Pushup, chestDay5Pullup, chestDay5InclinePushup, chestDay5WideArmPushup, chestDay5TricepsDip, chestDay5KneePushup]
        
        //Chest Day6
        let chestDay6Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay6Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay6InclinePushup: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay6WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay6TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay6KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay6Workout = [chestDay6Pushup, chestDay6Pullup, chestDay6InclinePushup, chestDay6WideArmPushup, chestDay6TricepsDip, chestDay6KneePushup]
        
        //Chest Day7
        let chestDay7Pushup: DayWorkout = DayWorkout(name: "PushUp", summary: "10 X 3", imageName: "Pushup")
        let chestDay7Pullup: DayWorkout = DayWorkout(name: "PullUp", summary: "10 X 3", imageName: "Pullup")
        let chestDay7InclinePushup: DayWorkout = DayWorkout(name: "crunches", summary: "10 X 3", imageName: "Crunches")
        let chestDay7WideArmPushup: DayWorkout = DayWorkout(name: "Bicycle Crunches", summary: "10 X 3", imageName: "BicycleCrunch")
        let chestDay7TricepsDip: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        let chestDay7KneePushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 X 3", imageName: "Pushup")
        
        let chestDay7Workout = [chestDay7Pushup, chestDay7Pullup, chestDay7InclinePushup, chestDay7WideArmPushup, chestDay7TricepsDip, chestDay7KneePushup]
        
        
        let chestWorkOutPlan: [DayWorkoutPlan] = [DayWorkoutPlan(name: "Day1", id: "ChestDay1", dayWorkoutList: chestDay1Workout),
                                                  DayWorkoutPlan(name: "Day2", id: "ChestDay2", dayWorkoutList: chestDay2Workout),
                                                  DayWorkoutPlan(name: "Day3", id: "ChestDay3", dayWorkoutList: chestDay3Workout),
                                                  DayWorkoutPlan(name: "Day4", id: "ChestDay4", dayWorkoutList: chestDay4Workout),
                                                  DayWorkoutPlan(name: "Day5", id: "ChestDay5", dayWorkoutList: chestDay5Workout),
                                                  DayWorkoutPlan(name: "Day6", id: "ChestDay6", dayWorkoutList: chestDay6Workout),
                                                  DayWorkoutPlan(name: "Day7", id: "ChestDay7", dayWorkoutList: chestDay7Workout),]
        
        let chest = Workout(name: "ChestWorkout", image: UIImage(named: "Chest")!, workoutPlan: chestWorkOutPlan)
        
        
        //Back Days
        //Back Day1
        let backDay1Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay1Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay1InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay1WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay1TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay1KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay1Workout = [backDay1Pushup, backDay1Pullup, backDay1InclinePushup, backDay1WideArmPushup, backDay1TricepsDip, backDay1KneePushup]
        
        //Back Day2
        let backDay2Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay2Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay2InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay2WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay2TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay2KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay2Workout = [backDay2Pushup, backDay2Pullup, backDay2InclinePushup, backDay2WideArmPushup, backDay2TricepsDip, backDay2KneePushup]
        
        //Back Day3
        let backDay3Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay3Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay3InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay3WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay3TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay3KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay3Workout = [backDay3Pushup, backDay3Pullup, backDay3InclinePushup, backDay3WideArmPushup, backDay3TricepsDip, backDay3KneePushup]
        
        //Back Day4
        let backDay4Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay4Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay4InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay4WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay4TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay4KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay4Workout = [backDay4Pushup, backDay4Pullup, backDay4InclinePushup, backDay4WideArmPushup, backDay4TricepsDip, backDay4KneePushup]
        
        //Back Day5
        let backDay5Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay5Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay5InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay5WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay5TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay5KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay5Workout = [backDay5Pushup, backDay5Pullup, backDay5InclinePushup, backDay5WideArmPushup, backDay5TricepsDip, backDay5KneePushup]
        
        //Back Day6
        let backDay6Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay6Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay6InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay6WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay6TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay6KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay6Workout = [backDay6Pushup, backDay6Pullup, backDay6InclinePushup, backDay6WideArmPushup, backDay6TricepsDip, backDay6KneePushup]
        
        //Back Day7
        let backDay7Pushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay7Pullup: DayWorkout = DayWorkout(name: "Pullup", summary: "10 x 3", imageName: "Pullup")
        let backDay7InclinePushup: DayWorkout = DayWorkout(name: "JumpingJacks", summary: "10 x 3", imageName: "JumpingJacks")
        let backDay7WideArmPushup: DayWorkout = DayWorkout(name: "Pushup", summary: "10 x 3", imageName: "Pushup")
        let backDay7TricepsDip: DayWorkout = DayWorkout(name: "Triceps Dips", summary: "10 x 3", imageName: "TriceDips")
        let backDay7KneePushup: DayWorkout = DayWorkout(name: "Russian Twist", summary: "10 x 3", imageName: "RussianTwist")
        
        let backDay7Workout = [backDay7Pushup, backDay7Pullup, backDay7InclinePushup, backDay7WideArmPushup, backDay7TricepsDip, backDay7KneePushup]
        
        
        let backWorkOutPlan: [DayWorkoutPlan] = [DayWorkoutPlan(name: "Day1", id: "BackDay1", dayWorkoutList: backDay1Workout),
                                                 DayWorkoutPlan(name: "Day2", id: "BackDay2", dayWorkoutList: backDay2Workout),
                                                 DayWorkoutPlan(name: "Day3", id: "BackDay3", dayWorkoutList: backDay3Workout),
                                                 DayWorkoutPlan(name: "Day4", id: "BackDay4", dayWorkoutList: backDay4Workout),
                                                 DayWorkoutPlan(name: "Day5", id: "BackDay5", dayWorkoutList: backDay5Workout),
                                                 DayWorkoutPlan(name: "Day6", id: "BackDay6", dayWorkoutList: backDay6Workout),
                                                 DayWorkoutPlan(name: "Day7", id: "BackDay7", dayWorkoutList: backDay7Workout)]
        
        let back = Workout(name: "BackWorkout", image: UIImage(named: "Back")!, workoutPlan: backWorkOutPlan)
        
        //Leg Days
        //Leg Day1
        let legDay1Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay1BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay1Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay1WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay1FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay1WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay1Workout = [legDay1Squart, legDay1BackwardLunge, legDay1Lunge, legDay1WallCalfRaise, legDay1FlutterKick, legDay1WallSit]
        
        //Leg Day2
        let legDay2Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay2BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay2Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay2WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay2FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay2WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay2Workout = [legDay2Squart, legDay2BackwardLunge, legDay2Lunge, legDay2WallCalfRaise, legDay2FlutterKick, legDay2WallSit]
        
        //Leg Day3
        let legDay3Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay3BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay3Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay3WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay3FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay3WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay3Workout = [legDay3Squart, legDay3BackwardLunge, legDay3Lunge, legDay3WallCalfRaise, legDay3FlutterKick, legDay3WallSit]
        
        //Leg Day4
        let legDay4Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay4BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay4Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay4WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay4FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay4WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay4Workout = [legDay4Squart, legDay4BackwardLunge, legDay4Lunge, legDay4WallCalfRaise, legDay4FlutterKick, legDay4WallSit]
        
        //Leg Day5
        let legDay5Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay5BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay5Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay5WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay5FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay5WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay5Workout = [legDay5Squart, legDay5BackwardLunge, legDay5Lunge, legDay5WallCalfRaise, legDay5FlutterKick, legDay5WallSit]
        
        //Leg Day6
        let legDay6Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay6BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay6Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay6WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay6FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay6WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay6Workout = [legDay6Squart, legDay6BackwardLunge, legDay6Lunge, legDay6WallCalfRaise, legDay6FlutterKick, legDay6WallSit]
        
        //Leg Day7
        let legDay7Squart: DayWorkout = DayWorkout(name: "Mountain Climb", summary: "8 x 3", imageName: "MountainClimb")
        let legDay7BackwardLunge: DayWorkout = DayWorkout(name: "Jumping Jacks", summary: "8 x 3", imageName: "Jumping Jacks")
        let legDay7Lunge: DayWorkout = DayWorkout(name: "Lunge", summary: "8 x 3", imageName:"ForwardLundge")
        let legDay7WallCalfRaise: DayWorkout = DayWorkout(name: "Wall Calf Raise", summary: "8 x 3", imageName: "Pushup")
        let legDay7FlutterKick: DayWorkout = DayWorkout(name: "Flutter Kick", summary: "8 x 3", imageName: "FlutterKick")
        let legDay7WallSit: DayWorkout = DayWorkout(name: "Burpees", summary: "8 x 3", imageName: "Burpee")
        
        let legDay7Workout = [legDay7Squart, legDay7BackwardLunge, legDay7Lunge, legDay7WallCalfRaise, legDay7FlutterKick, legDay7WallSit]
        
        
        let legWorkOutPlan: [DayWorkoutPlan] = [DayWorkoutPlan(name: "Day1", id: "LegDay1", dayWorkoutList: legDay1Workout),
                                                DayWorkoutPlan(name: "Day2", id: "LegDay2", dayWorkoutList: legDay2Workout),
                                                DayWorkoutPlan(name: "Day3", id: "LegDay3", dayWorkoutList: legDay3Workout),
                                                DayWorkoutPlan(name: "Day4", id: "LegDay4", dayWorkoutList: legDay4Workout),
                                                DayWorkoutPlan(name: "Day5", id: "LegDay5", dayWorkoutList: legDay5Workout),
                                                DayWorkoutPlan(name: "Day6", id: "LegDay6", dayWorkoutList: legDay6Workout),
                                                DayWorkoutPlan(name: "Day7", id: "LegDay7", dayWorkoutList: legDay7Workout)]
        
        let leg = Workout(name: "LegWorkout", image: UIImage(named: "Leg")!, workoutPlan: legWorkOutPlan)
        
        //Abs Days
        //Abs Day1
        let absDay1AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay1RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay1HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay1LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay1Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay1CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay1Workout = [absDay1AbdominalCrunch, absDay1RussianTwist, absDay1HeelTouch, absDay1LegRais, absDay1Plank, absDay1CobraStrech]
        
        //Abs Day2
        let absDay2AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay2RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay2HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay2LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay2Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay2CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay2Workout = [absDay2AbdominalCrunch, absDay2RussianTwist, absDay2HeelTouch, absDay2LegRais, absDay2Plank, absDay2CobraStrech]
        
        //Abs Day3
        let absDay3AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay3RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay3HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay3LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay3Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay3CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay3Workout = [absDay3AbdominalCrunch, absDay3RussianTwist, absDay3HeelTouch, absDay3LegRais, absDay3Plank, absDay3CobraStrech]
        
        //Leg Day4
        let absDay4AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay4RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay4HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay4LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay4Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay4CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay4Workout = [absDay4AbdominalCrunch, absDay4RussianTwist, absDay4HeelTouch, absDay4LegRais, absDay4Plank, absDay4CobraStrech]
        
        //Leg Day5
        let absDay5AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay5RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay5HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay5LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay5Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay5CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay5Workout = [absDay5AbdominalCrunch, absDay5RussianTwist, absDay5HeelTouch, absDay5LegRais, absDay5Plank, absDay5CobraStrech]
        
        //Leg Day6
        let absDay6AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay6RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay6HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay6LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay6Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay6CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay6Workout = [absDay6AbdominalCrunch, absDay6RussianTwist, absDay6HeelTouch, absDay6LegRais, absDay6Plank, absDay6CobraStrech]
        
        //Leg Day7
        let absDay7AbdominalCrunch: DayWorkout = DayWorkout(name: "AbdominalCrunch", summary: "10 x 3", imageName: "Crunches")
        let absDay7RussianTwist: DayWorkout = DayWorkout(name: "RussianTwist", summary: "10 x 3", imageName: "RussianTwist")
        let absDay7HeelTouch: DayWorkout = DayWorkout(name: "LegRaise", summary: "10 x 3", imageName: "LegRaise")
        let absDay7LegRais: DayWorkout = DayWorkout(name: "Bicycle Crunch", summary: "10 x 3", imageName: "BicycleCrunch")
        let absDay7Plank: DayWorkout = DayWorkout(name: "Plank", summary: "10 x 3", imageName: "Plank1")
        let absDay7CobraStrech: DayWorkout = DayWorkout(name: "Abs Cycling", summary: "10 x 3", imageName: "AbCycling")
        
        let absDay7Workout = [absDay7AbdominalCrunch, absDay7RussianTwist, absDay7HeelTouch, absDay7LegRais, absDay7Plank, absDay7CobraStrech]
        
        
        let absWorkOutPlan: [DayWorkoutPlan] = [DayWorkoutPlan(name: "Day1", id: "AbsDay1", dayWorkoutList: absDay1Workout),
                                                DayWorkoutPlan(name: "Day2", id: "AbsDay2", dayWorkoutList: absDay2Workout),
                                                DayWorkoutPlan(name: "Day3", id: "AbsDay3", dayWorkoutList: absDay3Workout),
                                                DayWorkoutPlan(name: "Day4", id: "AbsDay4", dayWorkoutList: absDay4Workout),
                                                DayWorkoutPlan(name: "Day5", id: "AbsDay5", dayWorkoutList: absDay5Workout),
                                                DayWorkoutPlan(name: "Day6", id: "AbsDay6", dayWorkoutList: absDay6Workout),
                                                DayWorkoutPlan(name: "Day7", id: "AbsDay7", dayWorkoutList: absDay7Workout)]
        
        let abs = Workout(name: "AbsWorkout", image: UIImage(named: "Abs")!, workoutPlan: absWorkOutPlan)
        return [abs, arm, chest, back, leg]
    }
}
