//
//  CD_Funnels+CoreDataProperties.swift
//  DSTrackerPackage
//
//  Created by Praveen Sharma on 07/11/23.
//
//

import Foundation
import CoreData


extension CD_Funnels {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_Funnels> {
        return NSFetchRequest<CD_Funnels>(entityName: "CD_Funnels")
    }

    @NSManaged public var dateTime: Date?
    @NSManaged public var deviceInfo: String?
    @NSManaged public var eventId: Data?
    @NSManaged public var eventName: String?
    @NSManaged public var funnelDuration: String?
    @NSManaged public var funnelEndTime: String?
    @NSManaged public var funnelId: String?
    @NSManaged public var funnelStartTime: String?
    @NSManaged public var isSync: Bool
    @NSManaged public var screenName: String?
    @NSManaged public var userId: String?
    @NSManaged public var userInfo: String?
    @NSManaged public var funnelToEvent: CD_Events?

}
