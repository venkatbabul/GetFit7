//
//  SQLite3Database.swift
//  GetFit7App
//
//  Created by Venkatram G V on 07/10/22.
//

import Foundation
import UIKit
import SQLite3

class DatabaseHelper{
    
    
    init()
    {
        db = openDatabase()
        
    }
    
    let dbPath: String = "myDdabee.sqlite"
    var db:OpaquePointer?
    
    func openDatabase() -> OpaquePointer?{
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &db) !=  SQLITE_OK{
            print("error opening database")
            return nil
        }
        else{
            print("Successfully opened connection to database at \(dbPath) \n")
            return db
        }
    }
    // PARTWORKOUT TABLE
    func createTablePartWorkout(){
        let createTableString = "CREATE TABLE IF NOT EXISTS partworkout(part TEXT);"
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
                print("Part Workout table created.\n")
            }else{
                print("Part Workout table did not created.")
            }
        }else{
            print("Couldn't prepare statement, CREATE TABLE partworkout")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertPartWorkout(part: String){
        let insertStatementString = "INSERT INTO partworkout (part) VALUES (?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (part as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    // DAYWORKOUT TABLE
    func createTableDayWorkout(){
        let createTableString = "CREATE TABLE IF NOT EXISTS dayworkout(day TEXT);"
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
                print("day Workout table created.\n")
            }else{
                print("day Workout table did not created.")
            }
        }else{
            print("Couldn't prepare statement, CREATE TABLE dayworkout")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertDaytWorkout(day: String){
        let insertStatementString = "INSERT INTO dayworkout (day) VALUES (?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (day as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    //WORKOUT TABLE
    func createTableWorkout(){
        let createTableString = "CREATE TABLE IF NOT EXISTS workout(name TEXT, summary TEXT, part TEXT, day TEXT);"
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
                print("Workout table created.\n")
            }else{
                print("Workout table did not created.")
            }
        }else{
            print("Couldn't prepare statement, CREATE TABLE workout")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func inserttWorkout(name: String,summary: String ,day: String, part: String){
        let insertStatementString = "INSERT INTO workout (name, summary, part, day) VALUES (?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (summary as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (part as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (day as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print(name, summary, day, part)
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    
    // RESULTS
    func read(part: String, day: String) -> [Details] {
        let queryStatementString = "SELECT * FROM workout WHERE day = \"\(day)\" AND part = \"\(part)\";"
        var queryStatement: OpaquePointer? = nil
        var psns : [Details] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let summary = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let day = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let part = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                psns.append(Details(name: String(name), summary: String(summary)))
                print("\(name) \(summary) \(part) \(day)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
}

