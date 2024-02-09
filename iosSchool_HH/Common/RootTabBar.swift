//
//  RootTabBar.swift
//  iosSchool_HH
//
//  Created by student on 24.11.2023.
//

import UIKit

enum RootTab: Int {
    case locations = 0
    case cabinet

    var tabBarItem: UITabBarItem {
        let tabBarItem = UITabBarItem(
            title: title,
            image: image,
            tag: self.rawValue
        )
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "iceberg")
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 10),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        tabBarItem.standardAppearance = appearance
        tabBarItem.scrollEdgeAppearance = appearance
        return tabBarItem
    }

    private var title: String? {
        switch self {
        case .locations:
            return "Выбор планеты"
        case .cabinet:
            return "Профиль"
        }
    }

    private var image: UIImage? {
        switch self {
        case .locations:
            return UIImage(named: "locationsRootTab")?.withRenderingMode(.alwaysOriginal)
        case .cabinet:
            return UIImage(named: "profileRootTab")?.withRenderingMode(.alwaysOriginal)
        }
    }
}
