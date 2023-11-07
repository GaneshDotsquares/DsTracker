//
//  CD_Sessions+CoreDataProperties.swift
//  DSTrackerPackage
//
//  Created by Praveen Sharma on 07/11/23.
//
//

import Foundation
import CoreData


extension CD_Sessions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_Sessions> {
        return NSFetchRequest<CD_Sessions>(entityName: "CD_Sessions")
    }

    @NSManaged public var dateTime: Date?
    @NSManaged public var deviceInfo: String?
    @NSManaged public var eventId: String?
    @NSManaged public var eventInfo: String?
    @NSManaged public var eventName: String?
    @NSManaged public var isSync: Bool
    @NSManaged public var sessionId: String?
    @NSManaged public var sessionName: String?
    @NSManaged public var sessionStatus: Int16
    @NSManaged public var userId: String?
    @NSManaged public var userInfo: String?
    @NSManaged public var sessionToEvent: CD_Events?

}
