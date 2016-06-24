//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // 1
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  // 2
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    // 3
//    let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath)
//    
//    // 4
//    cell.textLabel?.text = "Yay - it's working!"
//    
//    // 5
//    return cell
    
    // 1
    let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell  // downcasting
    
    // 2
    cell.noteTitleLabel.text = "note's title"
    cell.noteModificationTimeLabel.text = "note's modification time"
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      if identifier == "displayNote" {
        print("Table view cell tapped")
      } else if identifier == "addNote" {
        print("+ button tapped")
      }
    }
  }
  
  @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
    
    // for now, simply defining the method is sufficient.
    // we'll add code later
    
  }
    
}

