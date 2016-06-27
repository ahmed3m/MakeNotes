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
import RealmSwift

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
      
      // if note exists, update title and content
      if let note = note {
        let newNote = Note()
        newNote.title = noteTitleTextField.text ?? ""
        newNote.content = noteContentTextView.text ?? ""
        RealmHelper.updateNote(note, newNote: newNote)
      } else {
        // if note does not exist, create new note
        let note = Note()
        note.title = noteTitleTextField.text ?? ""
        note.content = noteContentTextView.text ?? ""
        note.modificationTime = NSDate()
        RealmHelper.addNote(note)
      }
      listNotesTableViewController.notes = RealmHelper.retrieveNotes()
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
