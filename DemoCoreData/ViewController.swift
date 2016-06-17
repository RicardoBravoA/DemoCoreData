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
let key_user:String = "user"
let key_password:String = "password"

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
        user.setValue("Ricardo", forKeyPath: key_user)
        user.setValue("123456", forKeyPath: key_password)
        
        _ = try? instance.save()
        
        //table request
        let request = NSFetchRequest(entityName: table)
        
        //validating if exists data
        if let list = try? instance.executeFetchRequest(request) where list.count > 0 {
            //fetch all results
            for result in list {
                print("user: \(result.valueForKey(key_user)!) - password: \(result.valueForKey(key_password)!)")
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

