//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {

  var notes = [Note]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell
    
    // 1
    let row = indexPath.row
    
    // 2
    let note = notes[row]
    
    // 3
    cell.noteTitleLabel.text = note.title
    
    // 4
    cell.noteModificationTimeLabel.text = note.modificationTime.convertToString()
    
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

