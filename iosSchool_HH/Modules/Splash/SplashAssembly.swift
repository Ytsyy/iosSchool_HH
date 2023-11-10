//
//  SplashAssembly.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation
import UIKit

protocol SplashAssembly {
    func splashCoordinator(onSuccess: (() -> Void)?) -> SplashCoordinator
    func splashVC(onSuccess: (() -> Void)?) -> SplashViewController
    func splashDataProvider() -> SplashDataProvider
}


extension Assembly: SplashAssembly {

    func splashDataProvider() -> SplashDataProvider {
        return SplashDataProviderImp()
    }

    func splashCoordinator(onSuccess: (() -> Void)?) -> SplashCoordinator {
        SplashCoordinator(assembly: self, context: .init(onSuccess: onSuccess))
    }

    func splashVC(onSuccess: (() -> Void)?) -> SplashViewController {
        .init(dataProvider: splashDataProvider(), onSuccess: onSuccess)
    }

}
