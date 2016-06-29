//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//
//  This class is used to control the table view
//

import UIKit
import RealmSwift

class ListNotesTableViewController: UITableViewController {

  // it's an array that will hold our notes
  var notes: Results<Note>! {
    didSet { // triggered when the property changes to reload the data when a new node is added
      tableView.reloadData()
    }
  }
  
  // method is called when the controller's view is loaded in memory
  override func viewDidLoad() {
    super.viewDidLoad()
    notes = RealmHelper.retrieveNotes() // retrieving the notes from Realm when the table view is loaded
  }

  // returns the number of cells/notes in the table view
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  // tells the table view what to display on the cell on the corresponding index
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell // fetching the cell and downcasting it to a ListNotesTableViewCell
    
    let row = indexPath.row // returns the integer value of the index of the rows
    
    if row % 2 == 0 {
      cell.backgroundColor = UIColor.lightGrayColor()
    }
    
    let note = notes[row]  // fetching the note in the corresponding row
    
    cell.noteTitleLabel.text = note.title // setting the title of the note to the cell's title
    
    cell.noteModificationTimeLabel.text = note.modificationTime.convertToString() // setting the modification time of the note to the time label of the cell
    
    return cell
  }

  // This method is activated with a segue is triggered
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier { // storing the segue's identifier in identifier
      if identifier == "displayNote" {
        print("Table view cell tapped")
        let indexPath = tableView.indexPathForSelectedRow! // storing the index of the selected row
        let note = notes[indexPath.row]
        let displayNoteViewController = segue.destinationViewController as! DisplayNoteViewController // getting access to the DisplayNoteViewController
        displayNoteViewController.note = note
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
  
  // used to delete a cell in the table view
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {  // checking if the editing style is delete
      RealmHelper.deleteNote(notes[indexPath.row])
      notes = RealmHelper.retrieveNotes() // retrieving the updated notes
    }
  }
}

