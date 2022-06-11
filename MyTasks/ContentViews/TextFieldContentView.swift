//
//  TextFieldContentView.swift
//  MyTasks
//
//  Created by Nicholas McGinnis on 6/9/22.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
    
    var configuration: UIContentConfiguration
    let textField = UITextField()
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
