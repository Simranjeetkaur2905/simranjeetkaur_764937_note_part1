//
//  notesViewController.swift
//  simranjeetkaur_764937_note_part1
//
//  Created by Simran Chakkal on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class notesViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    // @IBOutlet weak var textView: UITextView!
       var textString: String?
       var taskTable: listTableViewController?
       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
           textView.text = textString ?? ""
       }
       override func viewWillDisappear(_ animated: Bool) {
           taskTable?.updateText(text: textView.text)
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
