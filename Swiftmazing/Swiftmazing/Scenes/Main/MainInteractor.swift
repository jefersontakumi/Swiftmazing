//
//  MainInteractor.swift
//  Swiftmazing
//
//  Created by Hélio Mesquita on 14/12/19.
//  Copyright (c) 2019 Hélio Mesquita. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import UIKit
import PromiseKit

protocol MainBusinessLogic {
    func loadScreen()
}

protocol MainDataStore {
}

class MainInteractor: MainBusinessLogic, MainDataStore {

    var presenter: MainPresentationLogic?
    let worker: MainWorker

    init(worker: MainWorker = MainWorker()) {
        self.worker = worker
    }

    func loadScreen() {
        let topRepo = worker.getTopRepositories
        let lastUpdated = worker.getLastUpdatedRpositories

        when(fulfilled: topRepo, lastUpdated).done(handleSuccess).cauterize()
    }

    func handleSuccess(_ topRepoResponse: RepositoriesDomain,_ lastUpdatedResponse: RepositoriesDomain) {
        presenter?.mapResponse(topRepoResponse, lastUpdatedResponse)
    }

}
