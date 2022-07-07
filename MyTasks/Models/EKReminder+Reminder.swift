//
//  EKReminder+Reminder.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 7/6/22.
//

import Foundation
import EventKit

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        title = reminder.title
        notes = reminder.notes
        isCompleted = reminder.isComplete
        calendar = store.defaultCalendarForNewReminders()
        alarms?.forEach { alarm in
            guard let absoluteData = alarm.absoluteDate else { return }
            let comparison = Locale.current.calendar.compare(reminder.dueDate, to: absoluteData, toGranularity: .month)
            if comparison != .orderedSame {
                removeAlarm(alarm)
            }
        }
        if !hasAlarms {
            addAlarm(EKAlarm(absoluteDate: reminder.dueDate))
        }
    }
}
