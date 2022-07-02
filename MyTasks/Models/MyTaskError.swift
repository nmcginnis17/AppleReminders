//
//  MyTaskError.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 7/1/22.
//

import Foundation

enum MyTaskError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed to read reminders error description")
        }
    }
    
    case failedReadingReminders

}
