//
//  ListPresenter.swift
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

protocol ListPresentationLogic {
    func mapResponse(_ repositories: [Repository])
}

class ListPresenter: ListPresentationLogic {

    weak var viewController: ListDisplayLogic?

    func mapResponse(_ repositories: [Repository]) {
        let repositoriesViewModel = List.MapRepoViewModel(repositories: repositories)
        let viewModel = List.ViewModel(items: repositoriesViewModel.items)
        viewController?.show(viewModel)
    }

}
