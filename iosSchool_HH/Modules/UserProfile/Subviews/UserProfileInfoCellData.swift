//
//  UserProfileInfoCellData.swift
//  iosSchool_HH
//
//  Created by Maxim on 26.02.2024.
//

import UIKit

struct UserProfileInfoCellData: CoreCellInputData {
    enum PofileInfoType: String {
        case date = "Дата входа"
        case color = "Цвет профиля"

        func isNotDate() -> Bool {
            self != PofileInfoType.date
        }
        func isNotColor() -> Bool {
            self != PofileInfoType.color
        }
    }

    var selectClosure: ((CoreCellInputData) -> Void)?

    let infoType: PofileInfoType
    let authDate: String
    let profileColor: UIColor?

    init(infoType: PofileInfoType, authDate: String?, profileColor: UIColor?) {
        self.infoType = infoType
        self.authDate = authDate ?? ".. .. ...."
        self.profileColor = profileColor ?? UIColor(named: "iceberg-color")
    }
}
