//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Ahmed Abdelrahman on 6/24/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//
//  This class is a data model for a note
//

import Foundation
import RealmSwift

class Note: Object {
  dynamic var title = ""
  dynamic var content = ""
  dynamic var modificationTime = NSDate()
}