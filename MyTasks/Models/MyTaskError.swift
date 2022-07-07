//
//  MyTaskError.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 7/1/22.
//

import Foundation

enum MyTaskError: LocalizedError {
    case accessDenined
    case accessRestricted
    case failedReadingCalanderItem
    case failedReadingReminders
    case reminderHasNoDueDate
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .accessDenined:
            return NSLocalizedString("The app doesn't have permission to read reminders", comment: "access denined error description")
        case .accessRestricted:
            return NSLocalizedString("This device doesn't allow access to reminders", comment: "access restricted error description")
        case .failedReadingCalanderItem:
            return NSLocalizedString("Failed to read calander item", comment: "failed reading calander")
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed to read reminders error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date", comment: "reminder has no date error description")
        case .unknown:
            return NSLocalizedString("An unknown error occured", comment: "unknown error description")
        }
    }
}
