//
//  RemindersStore.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 7/1/22.
//

import Foundation
import EventKit

class ReminderStore {
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        switch status {
        case .authorized:
            return
        case .restricted:
            throw MyTaskError.accessRestricted
        case .denied:
            throw MyTaskError.accessDenined
        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .reminder)
            guard accessGranted else {
                throw MyTaskError.accessDenined
            }
        @unknown default:
            throw MyTaskError.unknown
        }
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw MyTaskError.accessDenined
        }
        let predict = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.fetchReminders(matching: predict)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch MyTaskError.reminderHasNoDueDate {
                return nil
            }
        }
        return reminders
    }
}
