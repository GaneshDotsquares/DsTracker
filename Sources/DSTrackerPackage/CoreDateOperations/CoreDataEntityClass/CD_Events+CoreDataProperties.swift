//
//  CD_Events+CoreDataProperties.swift
//  DSTrackerPackage
//
//  Created by Praveen Sharma on 07/11/23.
//
//

import Foundation
import CoreData


extension CD_Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_Events> {
        return NSFetchRequest<CD_Events>(entityName: "CD_Events")
    }

    @NSManaged public var dateTime: Date?
    @NSManaged public var deviceInfo: String?
    @NSManaged public var eventDuration: String?
    @NSManaged public var eventEndTime: String?
    @NSManaged public var eventId: String?
    @NSManaged public var eventInfo: String?
    @NSManaged public var eventName: String?
    @NSManaged public var eventStartTime: String?
    @NSManaged public var evnentId: String?
    @NSManaged public var funnelId: String?
    @NSManaged public var isSync: Bool
    @NSManaged public var location: String?
    @NSManaged public var screenName: String?
    @NSManaged public var sessionId: String?
    @NSManaged public var userId: String?
    @NSManaged public var userInfo: String?
    @NSManaged public var eventToFunnel: CD_Funnels?
    @NSManaged public var eventToSession: CD_Sessions?

}
