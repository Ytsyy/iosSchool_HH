//
//  CharactersAssembly.swift
//  iosSchool_HH
//
//  Created by MaximM on 22.11.2023.
//

import Foundation

protocol CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp>
    func characterDataProvider() -> CharacterDataProvider
    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator
}

extension Assembly: CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp> {
        .init(dataProvider: characterDataProvider(), data: data, imageService: imageService)
    }

    func characterDataProvider() -> CharacterDataProvider {
        CharacterDataProviderImp(apiClient: apiClient)
    }

    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator {
        CharacterCoordinator(assembly: self, context: .init(data: data))
    }
}
