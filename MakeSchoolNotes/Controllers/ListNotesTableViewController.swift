//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {

  // it's an array that will hold our notes
  var notes = [Note]() {
    didSet { // triggered when the property changes to reload the data when a new node is added
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // returns the number of cells/notes in the table view
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  // tells the table view what to display on the cell on the corresponding index
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell // fetching the cell and downcasting it to a ListNotesTableViewCell
    
    let row = indexPath.row // returns the integer value of the index of the rows
    
    let note = notes[row]  // fetching the note in the corresponding row
    
    cell.noteTitleLabel.text = note.title // setting the title of the note to the cell's title
    
    cell.noteModificationTimeLabel.text = note.modificationTime.convertToString() // setting the modification time of the note to the time label of the cell
    
    return cell
  }

  // This method is activated with a segue is triggered
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {  // storing the triggered segue's identifier to a local String
      if identifier == "displayNote" {
        print("Table view cell tapped")
      } else if identifier == "addNote" {
        print("+ button tapped")
      }
    }
  }
  
  // Creating an action to the unwind segue that's coming from the DisplayNoteView
  @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
    
    // for now, simply defining the method is sufficient.
    // we'll add code later
    
  }
    
}

