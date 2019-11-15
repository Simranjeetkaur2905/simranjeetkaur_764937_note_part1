//
//  notesViewController.swift
//  simranjeetkaur_764937_note_part1
//
//  Created by Simran Chakkal on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class notesViewController: UIViewController {

    var currentindex = -1
    @IBOutlet weak var textView: UITextView!
    var delegateNotescontroller:listTableViewController?
    var textString: String?
    var segueID: String?
    
       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
           textView.text = textString ?? ""
       }
    
    
       override func viewWillDisappear(_ animated: Bool) {
        delegateNotescontroller?.updateText(text: textView.text )
//
        
        //print(segueID!)
//        if segueID! == "updateSegue"{
//            delegateNotescontroller!.updateText(text: textView.text)
//        }
//        else{
//            print("add notessss")
//           // delegateNotescontroller!.addNotes(text: textView.text)
//        }
        
           
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
