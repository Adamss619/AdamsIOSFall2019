//
//  page2.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 10/26/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//

import UIKit

class page2: UIViewController {
    
    private let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var Notes = [NoteItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        let note = Notes[indexPath.row]
        cell.textLabel?.text = note.title
        return cell
    }
    
    
    
    
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(<#T##animated: Bool##Bool#>)
//        do{
//            Notes = try context.fetch(NoteItem.fetchRequest())
//        } catch let error as NSError{
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
