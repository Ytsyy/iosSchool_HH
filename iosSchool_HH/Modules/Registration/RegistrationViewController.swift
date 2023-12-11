//
//  RegistrationViewController.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let dataProvider: RegistrationDataProvider
    var onRegistrationSuccess: (() -> Void)?
    private let storageManager: StorageManager

    init(dataProvider: RegistrationDataProvider, storageManager: StorageManager, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
        self.onRegistrationSuccess = onRegistrationSuccess
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        registration()
        self.storageManager.saveLastLoginDate()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        onRegistrationSuccess?()
    }

    func registration() {
        dataProvider.registration(username: "MaximMarin5", password: "123456789") { token, error in
            print(token ?? "нет токена")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
