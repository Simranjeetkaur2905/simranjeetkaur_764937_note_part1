//
//  listTableViewController.swift
//  simranjeetkaur_764937_note_part1
//
//  Created by Simran Chakkal on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class listTableViewController: UITableViewController {
    
    //var cell:UITableViewCell!
    @IBOutlet var tableviewofnotes: UITableView!
    //var array2: [String]?
        var curFolderIndex = -1
   // var curNotesIndex = -1
    var arrayname:String?
     var selectedRows:[IndexPath]?
    
    
    @IBOutlet weak var trashbutton: UIBarButtonItem!
    
    @IBOutlet weak var movingtofolderbutton: UIBarButtonItem!
    
    var delegatetableview: tableviewcontrollerTableViewController?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableviewofnotes.dataSource = self
            tableviewofnotes.delegate = self
            
            
            trashbutton.isEnabled = false
            movingtofolderbutton.isEnabled = false
            
            
           // let attributes: [NSAttributedString.Key : Any] = [ .font: UIFont(name: "Avenir-Heavy", size: 14)!, .foregroundColor: UIColor.blue]
            //navigationItem.rightBarButtonItem?.setTitleTextAttributes(attributes, for: .highlighted)
            
            
            // Uncomment the following line to preserve selection between presentations
                //  self.clearsSelectionOnViewWillAppear = false
        
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
            
           // array2 = []
        }
//override func viewDidAppear(_ animated: Bool) {
//    if let x = UserDefaults.standard.object(forKey: "myfolder") as? String{
//        array2! = [x]
//        print(x)
//    }
//}
    
    
    @IBOutlet weak var ellipsebutton: UIBarButtonItem!
    
    @IBAction func ellipsebuttonaction(_ sender: UIBarButtonItem) {
        if trashbutton.isEnabled == false{
            
        
        trashbutton.isEnabled = true
        
    }
    else {
            trashbutton.isEnabled = false
    }
        if movingtofolderbutton.isEnabled == false{
            movingtofolderbutton.isEnabled = true
        }
        else{
            movingtofolderbutton.isEnabled = false
        }
    }
    

        // MARK: - Table view data source

//        override func numberOfSections(in tableView: UITableView) -> Int {
//            // #warning Incomplete implementation, return the number of sections
//            return 1
//        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
           
            return folderwithnotes.data[(delegatetableview?.curFolderIndex)!].notes.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell identifier"){
              
                print(curFolderIndex, indexPath.row)
                let arrayname = folderwithnotes.data[(delegatetableview?.curFolderIndex)!].notes[indexPath.row]
            
               
                cell.textLabel?.text = arrayname
                    
                //cell.imageView?.image = UIImage(named: "folder-icon")
                // Configure the cell...
                
                    
                return cell
            }
               return UITableViewCell()
                
        }

        

        
       
       

       
    //    changing detaildisclouser to checkmark when row is selected
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if let cell = tableView.cellForRow(at: indexPath){
        if cell.accessoryType == .detailButton{
           cell.accessoryType = .checkmark
            
        }
        else{
            cell.accessoryType = .detailButton
            }
       }
    }
    

        
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
        if let detailview = segue.destination as? notesViewController{
            
            detailview.delegateNotescontroller = self
            //detailview.segueID = segue.identifier!
            
            
            if let tableviewcell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableviewcell)?.row{
                    
                    //detailview.currentindex = index
                    detailview.textString = folderwithnotes.data[(delegatetableview?.curFolderIndex)!].notes[index]
                    curFolderIndex = index
        }
            }
            
          //  if let destAddNotes = segue.destination as? move UIBarButtonItem{
//                tableView.reloadData()
            }
    }
            
    
    
    
        func updateText(text: String) {
            
            if curFolderIndex != -1 {
                folderwithnotes.data[(delegatetableview?.curFolderIndex)!].notes[curFolderIndex] = text
            
            
            //xyz.data[curFolderIndex].notes[curFolderIndex] = text
            let indexpath = IndexPath(item: curFolderIndex, section: 0)
            tableView.reloadRows(at: [indexpath], with: .none)
             curFolderIndex = -1
            
            }
            else if  curFolderIndex == -1{
                folderwithnotes.data[(delegatetableview?.curFolderIndex)!].notes.append(text)
            tableView.reloadData()
                
              //  UserDefaults.standard.set(text, forKey: "mynotes")

        }
    
    
//    func addNotes(text: String){
//        xyz.data[curFolderIndex].notes.append(text)
//        tableView.reloadData()
//    }
//
 
    
    
    
    /*
    @IBAction func movebutton(_ sender: UIBarButtonItem) {
        
        let alertcontroller2 = UIAlertController(title: "Move to \(tableviewcontrollerTableViewController())", message: "Are you sure?", preferredStyle: .alert)
        let cancelaction = UIAlertAction(title: "No", style: .cancel, handler:nil)
        let deleteaction = UIAlertAction(title: "Move", style: .default){(action) in
            if let selectedRows = self.tableView.indexPathsForSelectedRows {
                        // 1
                        var items = [String]()
                        for indexPath in selectedRows  {
                            items.append(xyz.data[self.curFolderIndex].notes[indexPath.row])
                        }
                        // 2
                   // for item in items {
                      //  if let index = xyz.data.firstIndex(of: item) {
                               // self.array2!.remove(at: index)
                                
                            }
                        }
                    // 3
                        self.tableView.beginUpdates()
                  self.tableView.deleteRows(at: selectedRows, with: .automatic)
               // self.isMovingToParent
                        self.tableView.endUpdates()
                
                }
                      
                    
                    }
                alertcontroller2.addAction(cancelaction)
                alertcontroller2.addAction(deleteaction)
                
                self.present(alertcontroller2 , animated: true, completion: nil)
            }
            
        
    
    
   */
    }
    
    
        //deleting the row when trash button is pressed
    
    @IBAction func deletebuttons(_ sender: UIBarButtonItem) {
      
            let alertcontroller2 = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
            let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
            let deleteaction = UIAlertAction(title: "Delete", style: .destructive)
           {(action) in
            if let selectedRows = self.tableView.indexPathsForSelectedRows {
                // 1
                var items = [String]()
                for indexPath in selectedRows  {
                    items.append(folderwithnotes.data[(self.delegatetableview?.curFolderIndex)!].notes[indexPath.row])
                }
                // 2
                for item in items {
                    if let index = folderwithnotes.data[(self.delegatetableview?.curFolderIndex)!].notes.index(of: item) {
                        folderwithnotes.data[(self.delegatetableview?.curFolderIndex)!].notes.remove(at: index)
                    }
                }
            // 3
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: selectedRows, with: .automatic)
                self.tableView.endUpdates()
        }
              
            
            }
        alertcontroller2.addAction(cancelaction)
        alertcontroller2.addAction(deleteaction)
        
        self.present(alertcontroller2 , animated: true, completion: nil)
    }
    
    
    
 func movingNotes(index: Int){
     selectedRows = tableView.indexPathsForSelectedRows!
  
     for i in selectedRows! {
        let notetoMove = folderwithnotes.data[(delegatetableview?.curFolderIndex)!].notes[i.row]
        folderwithnotes.data[index].notes.append(notetoMove)
         
     }
  
  
 }
 
    //before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //
    //        if let detailView = segue.destination as? TaskDetailViewController {
    //            detailView.taskTable = self
    //            if let tableViewCell = sender as? UITableViewCell {
    //                if let index = tableView.indexPath(for: tableViewCell)?.row {
    //                    detailView.textString = tasks![index]
    //                    currentIndex = index
    //                }
    //            }
    //        }
    //    }
    //    func updateText(text: String) {
    //        guard tasks != nil && currentIndex != -1 else {
    //            return
    //        }
    //
    //        tasks![currentIndex] = text
    //     //   tableView.reloadData()
    //    let indexPath = IndexPath(item: currentIndex, section: 0)
    //        tableView.reloadRows(at: [indexPath], with: .none)
    //    }

    //
    //
    //}

}

