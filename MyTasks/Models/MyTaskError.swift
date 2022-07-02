//
//  MyTaskError.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 7/1/22.
//

import Foundation

enum MyTaskError: LocalizedError {
    case accessDenined
    case failedReadingReminders
    case reminderHasNoDueDate
    
    var errorDescription: String? {
        switch self {
        case .accessDenined:
            return NSLocalizedString("The app doesn't have permission to read reminders", comment: "access denined error description")
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed to read reminders error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date", comment: "reminder has no date error description")
        }
    }
}
