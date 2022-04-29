//
//  Bookmark+CoreDataProperties.swift
//  webmark
//
//  Created by Julyo  on 29/04/22.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var category: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var link: String?
    @NSManaged public var name: String?

}

extension Bookmark : Identifiable {

}
