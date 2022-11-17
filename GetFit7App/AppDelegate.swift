//
//  AppDelegate.swift
//  GetFit7App
//
//  Created by Venkatram G V on 23/03/22.
//

import UIKit
import SQLite3

//var dbQueue: OpaquePointer!
//var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        dbQueue = createAndOpenDatabase()
//
//        if createTables() == false{
//            print("Error in creating tables")
//        } else {
//            print("Yes..created Tables")
//        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    func createAndOpenDatabase() -> OpaquePointer?{
//        var db: OpaquePointer?
//        let url = NSURL(fileURLWithPath: dbURL)
//
//        if let pathComponent = url.appendingPathComponent("Test.sqlite"){
//            let filePath = pathComponent.path
//
//            if sqlite3_open(filePath, &db) == SQLITE_OK{
//                print("Opened the database! at \(filePath)")
//                return db
//            } else {
//                print("Couldn't open database!")
//            }
//        } else {
//            print("File Path is not available!")
//        }
//        return db
//    }
//
//    func createTables() -> Bool{
//        var bRetVal: Bool = false
//        //CREATE TABLE IF NOT EXIST TEMP (TEMPCOLUMN1 TEXT NULL, TEMPCOLUMN2 TEXT NULL)
//        let createTable1 = sqlite3_exec(dbQueue, """
//            CREATE TABLE IF NOT EXISTS workout(
//            name CHAR(255),
//            summary CHAR(255)
//            );
//            """, nil, nil, nil)
//        let createTable2 = sqlite3_exec(dbQueue, """
//            CREATE TABLE IF NOT EXISTS dayWorkout(
//            name CHAR(255)
//            );
//            """, nil, nil, nil)
//        let createTable3 = sqlite3_exec(dbQueue, """
//            CREATE TABLE IF NOT EXISTS partWorkout(
//            name CHAR(255)
//            );
//            """, nil, nil, nil)
//
//        if (createTable1 != SQLITE_OK){
//            print("Not able to create workout table")
//            bRetVal = false
//
//            if (createTable2 != SQLITE_OK){
//                print("Not able to create dayWorkout table")
//                bRetVal = false
//
//                if (createTable3 != SQLITE_OK){
//                    print("Not able to create partWorkout table")
//                    bRetVal = false
//                }
//            }
//        }else {
//            bRetVal = true
//        }
//
//
//        return bRetVal
//    }
}

