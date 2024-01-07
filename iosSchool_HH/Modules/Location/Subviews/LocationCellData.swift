//
//  LocationCellData.swift
//  iosSchool_HH
//
//  Created by student on 27.11.2023.
//

import Foundation

struct LocationCellData {
    let name: String
    let type: String
    let residents: [String]
    let population: Int

    init(location: Location) {
        name = location.name
        type = location.type
        residents = location.residents
        population = location.residents.count
    }
}
