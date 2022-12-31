//
//  DBManager.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/27/22.
//

import UIKit

class DBManager {

    // MARK: - Private properties
    private var storageContext: CoreDataStorageContext?

    // MARK: - Public properties
    static var shared = DBManager()

    lazy var countryDao = CountryDao(storageContext: storageContextImpl())

    private init() {
    }

    static func setup(storageContext: CoreDataStorageContext) {
        shared.storageContext = storageContext
    }

    private func storageContextImpl() -> CoreDataStorageContext {
        if self.storageContext != nil {
            return self.storageContext!
        }
        fatalError("You must call setup to configure the StoreContext before accessing any dao")
    }

}
