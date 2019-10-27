//
//  TableViewController.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 10/26/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
//    private let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var Notes = [NoteItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItem()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath)
        let note = Notes[indexPath.row]
        cell.textLabel?.text = note.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Notes.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: [indexPath.row], animated: true)

        var textField = UITextField()
        let alertEdit = UIAlertController(title: "Edit Note", message: "", preferredStyle: .alert)
        let actionEdit = UIAlertAction(title: "Finish Note", style: .default) { (actionEdit) in
            
            self.Notes[indexPath.row].title = textField.text!
            self.saveNote()
        }
        alertEdit.addAction(actionEdit)
        alertEdit.addTextField { (fieldEdit) in
            textField = fieldEdit
            textField.text = self.Notes[indexPath.row].title
        }
        present(alertEdit, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            let note = Notes[indexPath.row]
            Notes.remove(at: indexPath.row)
            context.delete(note)
            
            do{
                try context.save()
            }catch{
                print("Could not delete row\(error)")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        //var labelField = UILabel()
        let alert = UIAlertController(title: "Add New Note", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Note", style: .default) { (action) in
            
            let newNote = NoteItem(context: self.context)
            newNote.title = textField.text!
            //newNote.title = labelField.text!
            self.Notes.append(newNote)
            self.saveNote()
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add New Note"
        }
        present(alert, animated: true, completion: nil)
    }
    
    func saveNote(){
        do{
        try context.save()
        }catch{
            print("Could not save notes\(error)")
        }
        tableView.reloadData()
    }
    
    func loadItem(){
        let request: NSFetchRequest<NoteItem> = NoteItem.fetchRequest()
        
        do{
        Notes = try context.fetch(request)
        }catch{
            print("Could not fetch information\(error)")
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
