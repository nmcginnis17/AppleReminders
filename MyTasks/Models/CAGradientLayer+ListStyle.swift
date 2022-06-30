//
//  CAGradientLayer+ListStyle.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 6/29/22.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .all:
            beginColor = UIColor(named: "TodayGradientAllBegin") ?? UIColor.blue
            endColor = UIColor(named: "TodayGradientAllEnd") ?? UIColor.lightGray
        case .future:
            beginColor = UIColor(named: "TodayGradientFutureBegin") ?? UIColor.green
            endColor = UIColor(named: "TodayGradientFutureEnd") ?? UIColor.darkGray
        case .today:
            beginColor = UIColor(named: "TodayGradientTodayBegin") ?? UIColor.magenta
            endColor = UIColor(named: "TodayGradientTodayEnd") ?? UIColor.cyan
        }
        return [beginColor.cgColor, endColor.cgColor]
    }
}
