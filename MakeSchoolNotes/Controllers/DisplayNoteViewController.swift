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
  
  // called when the view is loaded to the memory
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // This method is activated with a segue is triggered
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    // checking which segue was activated
    if let identifier = segue.identifier {
      if identifier == "Cancel" {
        print("Cancel button tapped")
      } else if identifier == "Save" {
        print("Save button tapped")
        
        // constructing a note object and setting its fields if save was pressed
        let note = Note()
        note.title = noteTitleTextField.text ?? ""  // if no title was put, keep it as empty title
        note.content = noteContentTextView.text
        note.modificationTime = NSDate()
        
        // creating a reference to the ListNotesTableViewController, and adding the note to the array
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        listNotesTableViewController.notes.append(note)
      }
    }
  }
  
  // called when the view is about to appear
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    noteTitleTextField.text = ""  // emptying the text field
    noteContentTextView.text = "" // emptying the text view
  }
  
}
