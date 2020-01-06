//
//  RepositoryDetailInteractor.swift
//  Swiftmazing
//
//  Created by Hélio Mesquita on 05/01/20.
//  Copyright (c) 2020 Hélio Mesquita. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import UIKit

protocol RepositoryDetailBusinessLogic {
    func loadScreen()
}

protocol RepositoryDetailDataStore {
    var repository: Repository? { get set }
}

class RepositoryDetailInteractor: RepositoryDetailBusinessLogic, RepositoryDetailDataStore {

    var presenter: RepositoryDetailPresentationLogic?

    // MARK: DATASTORE
    var repository: Repository?

    func loadScreen() {
        if let repository = repository {
            presenter?.presentRepository(repository)
        }
    }

}