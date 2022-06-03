//
//  ReminderListViewController+Actions.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 6/2/22.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
