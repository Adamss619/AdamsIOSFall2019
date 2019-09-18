//
//  UserLogController.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 9/17/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//

import Foundation

class UserLogController: NSObject {

    static var loggingArray = Array<String>()
    
    class func loggingList() -> Array<String>{
        return UserLogController.loggingArray
    }
    
    static func logNewEvent(newEventToLog:String){
        UserLogController.loggingArray.append(newEventToLog)
        
        print(UserLogController.loggingArray)
    }
}
