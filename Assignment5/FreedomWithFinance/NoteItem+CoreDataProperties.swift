//
//  NoteItem+CoreDataProperties.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 10/26/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//
//

import Foundation
import CoreData


extension NoteItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteItem> {
        return NSFetchRequest<NoteItem>(entityName: "NoteItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var createat: NSDate?

}
