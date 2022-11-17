////
////  DBHelper.swift
////  GetFit7App
////
////  Created by Venkatram G V on 17/08/22.
////
//
//import Foundation
//import SQLite
//
//class DBHelper{
//    var database: Connection!
//    // MARK: WorkoutListTable
//    
//    func createDataBaseConnection(){
//        do {
//            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            let fileUrl = documentDirectory.appendingPathComponent("hcdvsedwy1")
//            let database = try Connection(fileUrl.path())
//            self.database = database
//            print("Connected to database")
//        } catch {
//            print("error creating connection", error)
//        }
//    }
//    
//    
//    // MARK: WorkoutListTable
//    
//    let workoutlist_Table = Table("workoutListTable")
//    let workoutlist_id = Expression<Int>("id")
//    let workoutlist_name = Expression<String>("name")
//    let workoutlist_summary = Expression<String>("summary")
//    let workoutlist_day = Expression<String>("day_id")
//    let workoutlist_part = Expression<String>("part_id")
//    
//    func createWorkoutListTable(){
//        let createTable = workoutlist_Table.create(ifNotExists: true){ (table) in
//            table.column(workoutlist_id, primaryKey: .autoincrement)
//            table.column(workoutlist_name)
//            table.column(workoutlist_summary)
//            table.column(workoutlist_part)
//            table.column(workoutlist_day)
//        }
//        do {
//            try self.database.run(createTable)
//        } catch {
//            print("Couldn't Create Table")
//        }
//    }
//    
//    func insertWorkoutList(workoutName: String, workoutSummary: String, part: String, day: String){
//        let insert = workoutlist_Table.insert( workoutlist_name <- workoutName, workoutlist_summary <- workoutSummary, workoutlist_part <- part, workoutlist_day <- day)
//        
//        do {
//            try self.database.run(insert)
//        } catch {
//            print("Error in inserting values: ", error)
//        }
//    }
//    
//    func showWorkoutList(){
//        do {
//            let table = try self.database.prepare(workoutlist_Table)
//            for value in table{
//                print("Id: \(value[workoutlist_id]), Name: \(value[workoutlist_name]) , Part: \(value[workoutlist_part]) , day: \(value[workoutlist_day])")
//            }
//        } catch {
//            print("Error in inserting workout List table values: ", error)
//        }
//    }
//    
//    
//    // MARK: DayWorkoutTable
//    
//    let dayWorkoutlist_Table = Table("dayWorkoutlist_Table")
//    let dayWorkoutlist_id = Expression<Int>("id")
//    let dayWorkoutlist_day = Expression<String>("day")
//    
//    func createDayWorkoutListTable(){
//        let createTable = dayWorkoutlist_Table.create(ifNotExists: true){ (table) in
//            table.column(dayWorkoutlist_id, primaryKey: .autoincrement)
//            table.column(dayWorkoutlist_day, unique: true)
//        }
//        do {
//            try self.database.run(createTable)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func insertDayWorkoutList(dayName: String){
//        let insert = dayWorkoutlist_Table.insert( dayWorkoutlist_day <- dayName)
//        
//        do {
//            try self.database.run(insert)
//        } catch {
//            print("Error in inserting values: ", error)
//        }
//    }
//    
//    func showDayWorkoutList(){
//        do {
//            let table = try self.database.prepare(dayWorkoutlist_Table)
//            for value in table{
//                print("Day: \(value[dayWorkoutlist_day])")
//            }
//        } catch {
//            print("Error in inserting workout List table values: ", error)
//        }
//    }
//    
//    
//    // MARK: PartWorkoutTable
//    
//    let partWorkoutlist_Table = Table("partWorkoutlist_Table")
//    let partWorkoutlist_id = Expression<Int>("id")
//    let partWorkoutlist_name = Expression<String>("part_name")
//    
//    func createPartWorkoutListTable(){
//        let createTable = partWorkoutlist_Table.create(ifNotExists: true){ (table) in
//            table.column(partWorkoutlist_id, primaryKey: .autoincrement)
//            table.column(partWorkoutlist_name, unique: true)
//        }
//        do {
//            try self.database.run(createTable)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func insertPartWorkoutList(partName: String){
//        let insert = partWorkoutlist_Table.insert( partWorkoutlist_name <- partName)
//        
//        do {
//            try self.database.run(insert)
//        } catch {
//            print("Error in inserting values: ", error)
//        }
//    }
//    
//    func showPartWorkoutList(){
//        do {
//            let table = try self.database.prepare(partWorkoutlist_Table)
//            for value in table{
//                print("Id: \(value[partWorkoutlist_id]), part: \(value[partWorkoutlist_name])")
//            }
//        } catch {
//            print("Error in inserting workout List table values: ", error)
//        }
//    }
//    
//    // MARK: Total Result
//    func showResult(){
//        do {
//            let tranTable = workoutlist_Table.join(dayWorkoutlist_Table,
//                                                   on: dayWorkoutlist_Table[dayWorkoutlist_day] == workoutlist_Table[workoutlist_day])
//            let tranTable2 = tranTable.join(partWorkoutlist_Table,
//                                            on: partWorkoutlist_Table[partWorkoutlist_name] == tranTable[workoutlist_part])
//            let table = try self.database.prepare(tranTable2)
//            for value in table{
//                print("\(value[self.partWorkoutlist_name]), \(value[self.dayWorkoutlist_day]) ,\(value[self.workoutlist_name]), \(value[self.workoutlist_summary])")
//            }
//        } catch {
//            print("Error,", error)
//        }
//    }
//    
//    func show(part: String?, day: String?) -> [Details]{
//        var detailArr = [Details]()
//        do {
//            let tranTable = workoutlist_Table.join(dayWorkoutlist_Table,
//                                                   on: dayWorkoutlist_Table[dayWorkoutlist_day] == workoutlist_Table[workoutlist_day])
//            let tranTable2 = tranTable.join(partWorkoutlist_Table,
//                                            on: partWorkoutlist_Table[partWorkoutlist_name] == tranTable[workoutlist_part])
//            if let part = part , let day = day{
//                let a = tranTable2.filter(partWorkoutlist_Table[partWorkoutlist_name] == part && dayWorkoutlist_Table[dayWorkoutlist_day] == day)
//                let table = try self.database.prepare(a)
//                for value in table{
//                    print("\(value[self.partWorkoutlist_name]), \(value[self.dayWorkoutlist_day]) ,\(value[self.workoutlist_name]), \(value[self.workoutlist_summary])")
//                    let arr = Details(name: value[self.workoutlist_name], summary: value[self.workoutlist_summary])
//                    detailArr.append(arr)
//                }
//            }
//        } catch {
//            print(error)
//        }
//        return detailArr
//    }
//}
