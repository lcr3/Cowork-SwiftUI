//
//  Colors.swift
//  Cowork-SwiftUI
//
//  Created by ryookano on 2020/07/08.
//  Copyright © 2020 lcr. All rights reserved.
//

import SwiftUI

struct Colors {
    static let startTitleColor = Color(hex: 0x47525E)
    static let startFacebookButtonColor = Color(hex: 0x455996)
    static let startMailButtonColor = Color(hex: 0x5E7E6B)
}


extension Color {
    // 16進数で指定できる
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
