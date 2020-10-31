//
//  UITextView+Extensions.swift
//  Reciplease
//
//  Created by ousama boujaouane on 31/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

extension UITextView {
    func scrollToBottom() {
        let textCount: Int = text.count
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
}
