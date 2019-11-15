//
//  movenotesViewController.swift
//  simranjeetkaur_764937_note_part1
//
//  Created by Simran Chakkal on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class movenotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
        
        var notesDelegate: listTableViewController?

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return folderwithnotes.data.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
                    let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
            cell.textLabel?.text = folderwithnotes.data[indexPath.row].folder
                     
                      // Configure the cell...

                      return cell
            
            
           }
        
      
        
        
       
        
       
        
    @IBAction func cancelbutton(_ sender: UIButton) {
    
    
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            
            
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let alertController = UIAlertController(title: "Move to \(String(describing: folderwithnotes.data[indexPath.row].folder))", message: "Are you sure?", preferredStyle: .alert)
               let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
               let yesAction = UIAlertAction(title: "Move", style: .default) { (action) in
               
                self.notesDelegate?.movingNotes(index: indexPath.row)
    //               self.notesDelegate?.movingNotes(index: indexPath.row)
                   self.presentingViewController?.dismiss(animated: true, completion: nil)
               }
               alertController.addAction(noAction)
               alertController.addAction(yesAction)
               self.present(alertController, animated: true, completion: nil)
           }
              

           
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


