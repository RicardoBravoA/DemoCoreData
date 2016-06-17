//
//  ViewController.swift
//  DemoCoreData
//
//  Created by Ricardo Bravo Acuña on 16/06/16.
//  Copyright © 2016 Ricardo Bravo Acuña. All rights reserved.
//

import UIKit
import CoreData

let table:String = "User"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //instance of database (coredata)
        let instance:NSManagedObjectContext = appDelegate.managedObjectContext
        //table instance of coredata
        let user = NSEntityDescription.insertNewObjectForEntityForName(table, inManagedObjectContext: instance)
        user.setValue("Ricardo", forKeyPath: "user")
        user.setValue("123456", forKeyPath: "password")
        
        _ = try? instance.save()
        
        let request = NSFetchRequest(entityName: table)
        
        if let list = try? instance.executeFetchRequest(request) where list.count > 0 {
            for result in list {
                print("user: \(result.user) - password: \(result.password)")
            }
        }else{
            print("Sin resultados")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

