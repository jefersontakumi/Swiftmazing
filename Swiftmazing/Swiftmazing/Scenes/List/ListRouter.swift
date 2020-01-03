//
//  ListRouter.swift
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

@objc protocol ListRoutingLogic {
}

protocol ListDataPassing {
    var dataStore: ListDataStore? { get }
}

class ListRouter: ListRoutingLogic, ListDataPassing {

    weak var viewController: ListViewController?
    var dataStore: ListDataStore?

    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //      let destinationVC = segue.destination as! SomewhereViewController
    //      var destinationDS = destinationVC.router!.dataStore!
    //      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //      let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //      var destinationDS = destinationVC.router!.dataStore!
    //      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //      navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}

    // MARK: Navigation

    //func navigateToSomewhere(source: ListViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: ListDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}

}
