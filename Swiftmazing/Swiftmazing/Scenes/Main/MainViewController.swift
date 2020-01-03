//
//  MainViewController.swift
//  Swiftmazing
//
//  Created by Hélio Mesquita on 14/12/19.
//  Copyright (c) 2019 Hélio Mesquita. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Visual

protocol MainDisplayLogic: class {
    func show(_ viewModel: Main.ViewModel)
    func showList()
}

class MainViewController: FeedCollectionViewController<Main.FeedCellViewModel> {

    var interactor: MainBusinessLogic?
    var router: (MainRoutingLogic & MainDataPassing)?

    var viewModel: Main.ViewModel = Main.ViewModel() {
        didSet {
            reloadTable()
        }
    }

    override func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        load()
    }

    private func configure() {
        title = Bundle.main.displayName
        collectionView.delegate = self
        collectionView.refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
    }

    @objc func load() {
        collectionView.refreshControl?.beginRefreshing()
        interactor?.loadScreen()
    }

    func reloadTable() {
        var snapshot = NSDiffableDataSourceSnapshot<FeedSection, Main.FeedCellViewModel>()
        snapshot.appendSections([.news, .topRepos, .lastUpdated])
        snapshot.appendItems(viewModel.news, toSection: .news)
        snapshot.appendItems(viewModel.topRepos, toSection: .topRepos)
        snapshot.appendItems(viewModel.lastUpdated, toSection: .lastUpdated)
        dataSource.apply(snapshot, animatingDifferences: true)
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.refreshControl?.endRefreshing()
    }

    override func didSelectSupplementaryHeaderView(_ section: FeedSection) {
        didSelectSection(section)
    }

    func didSelectSection(_ section: FeedSection) {
        let repositories = dataSource.snapshot().itemIdentifiers(inSection: section).compactMap { $0.repository }
        switch section {
        case .topRepos:
            interactor?.topRepoListSelected(repositories)
        case .lastUpdated:
            interactor?.lastUpdatedListSelected(repositories)
        default:
            return
        }
    }

    func didSelectRepository(_ repository: Repository?) {
        interactor?.repositorySelected(repository)
    }

}

extension MainViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let element = dataSource.itemIdentifier(for: indexPath) else { return }
        if FeedSection.allCases[indexPath.section] == .news {
            didSelectSection(element.section)
        } else {
            didSelectRepository(element.repository)
        }
    }

}

extension MainViewController: MainDisplayLogic {

    func show(_ viewModel: Main.ViewModel) {
        self.viewModel = viewModel
    }

    func showList() {
        router?.routeToList()
    }

}
