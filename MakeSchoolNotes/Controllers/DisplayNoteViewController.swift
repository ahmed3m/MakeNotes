//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//
//  This class is used to control the note view
//

import UIKit

class DisplayNoteViewController: UIViewController {
  
  // connecting the notes' title and text to the code
  @IBOutlet weak var noteContentTextView: UITextView!
  @IBOutlet weak var noteTitleTextField: UITextField!
  
  var note: Note? // will hold the note we're editing
  
  // called when the view is loaded to the memory
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // This method is activated with a segue is triggered
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController // getting access to the ListNotesTableViewController
    
    if segue.identifier == "Save" {
      if let note = note {  // checks if the note is being modified
        note.title = noteTitleTextField.text ?? ""
        note.content = noteContentTextView.text ?? ""
        // on page 10 in the tutorial, why didn't they update the time as well?
        note.modificationTime = NSDate()
        listNotesTableViewController.tableView.reloadData() // updating/reloading the data with our changes
      } else {
        let newNote = Note()  // create a new node object
        newNote.title = noteTitleTextField.text ?? ""
        newNote.content = noteContentTextView.text ?? ""
        newNote.modificationTime = NSDate()
        listNotesTableViewController.notes.append(newNote)  // appending a new node to the array
      }
    }
  }

  
  // called when the view is about to appear
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if let note = note {  // if we already have a note, we display it
      noteTitleTextField.text = note.title
      noteContentTextView.text = note.content
    } else {  // otherwise, we have an empty note
      noteTitleTextField.text = ""
      noteContentTextView.text = ""
    }
  }
  
}
