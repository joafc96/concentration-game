//
//  ThemeManager.swift
//  concentration
//
//  Created by qbuser on 30/11/22.
//

import Foundation

final class ThemeManager {
    static let shared = ThemeManager()
    private var currentTheme: ThemeProtocol = NebulaTheme()

    func applyTheme(theme: ThemeProtocol) {
        self.currentTheme = theme
    }

    func getCurrentTheme() -> ThemeProtocol {
        return self.currentTheme
    }
}
