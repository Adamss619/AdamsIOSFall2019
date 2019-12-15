//
//  NoteItem.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 10/26/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//

import Foundation
import CoreData

public class NoteItem:NSManagedObject, Identifiable{
    @NSManaged public var createAt:Data?
    @NSManaged public var title:String?
}

extension NoteItem{
    static func getAllNoteItem() -> NSFetchRequest<NoteItem>{
        let request:NSFetchRequest<NoteItem> = NoteItem.fetchRequest() as! NSFetchRequest<NoteItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createAt", ascending: true)
        
        request.sortDescriptor = [sortDescriptor]
        
        return request
    }
}
