//
//  RepositoryDetailPresenter.swift
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

protocol RepositoryDetailPresentationLogic {
    func presentRepository(_ repository: Repository)
}

class RepositoryDetailPresenter: RepositoryDetailPresentationLogic {

    weak var viewController: RepositoryDetailDisplayLogic?

    func presentRepository(_ repository: Repository) {
        viewController?.showImage(repository.owner.avatar)
        viewController?.showTitle(repository.name)
        viewController?.showAuthor(repository.owner.name)
        var texts: [String] = []
        if let description = repository.description {
            texts.append(description)
        }
        texts.append(" - \(repository.stars.kiloFormat) \(Text.stars.value)")
        texts.append(" - \(repository.issues.kiloFormat) \(Text.issues.value) ")
        texts.append(" - \(repository.forks.kiloFormat) \(Text.forks.value) ")
        texts.append(" - \(Text.lastUpdate.value) \(repository.lastUpdate.monthDayYear)")
        viewController?.showDescriptions(texts)
        viewController?.showButtonTitle(Text.seeRepository.value)
    }

}
