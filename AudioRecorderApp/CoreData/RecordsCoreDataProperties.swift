//
//  RecordsCoreDataProperties.swift
//  AudioRecorderApp
//
//  Created by Sivaranjani Venkatesh on 24/11/21.
//

import Foundation
import CoreData

extension Record {
    
    @NSManaged var noteSoundTitle:String?
    @NSManaged var noteSoundURL:String?
    @NSManaged var noteSound: Data?
    @NSManaged var name: String?
}
