//
//  File.swift
//  
//
//  Created by Praveen Sharma on 06/11/23.
//

import Foundation
import CoreData
//
//protocol EventRepository {
//
//    func create(Event: Events)
//    func getAll() -> [Events]?
//    func get(byIdentifier id: UUID) -> Event?
//    func update(Event: Events)
//    func delete(id: UUID)
//}
//
//struct EventDataRepository : EventRepository
//{
//    func create(event: Events) {
//
//    let event = Events(context: PersistentStorage.shared.context)
//      event.email = event.email
//      event.name = event.name
//      event.id = event.id
//      event.profilePic = Event.profilePicture
//
//        PersistentStorage.shared.saveContext()
//
//
//    }
//
//    func getAll() -> [Event]? {
//
//        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEvent.self)
//
//        var Events : [Event] = []
//
//        result?.forEach({ (cdEvent) in
//            Events.append(cdEvent.convertToEvent())
//        })
//
//        return Events
//    }
//
//    func get(byIdentifier id: UUID) -> Event? {
//
//        let fetchRequest = NSFetchRequest<CDEvent>(entityName: "CDEvent")
//        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
//
//        fetchRequest.predicate = predicate
//        do {
//            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
//
//            guard result != nil else {return nil}
//
//            return result?.convertToEvent()
//
//        } catch let error {
//            debugPrint(error)
//        }
//
//        return nil
//    }
//
//    func update(Event: Event) {
//        // update code here
//    }
//
//    func delete(id: UUID) {
//        // delete code here
//    }
//}
