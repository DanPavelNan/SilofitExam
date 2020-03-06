//
//  AppRootCoordinator.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-01.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit
import CoreLocation

final class AppRootCoordinator {

    let navigationController = UINavigationController()
    weak var authenticationViewController: AuthenticationViewController?
    weak var mapViewController: MapViewController?
    weak var signUpViewController: SignUpViewController?
    weak var loginViewController: LoginViewController?
    weak var spaceDetailsViewController: SpaceDetailsViewController?
    weak var listOfSpacesViewController: ListOfSpacesViewController?

    func start() {

        guard let currentUser = AuthenticationManager().currentLoggedInUser else {
            showAuthenticationScreen()
            return
        }

        print(currentUser)
        showAppMainScreen()
    }

    private func showAppMainScreen() {
        let mapViewController = MapViewController()
        mapViewController.delegate = self
        self.mapViewController = mapViewController
        navigationController.viewControllers = [mapViewController]
    }

    private func showAuthenticationScreen() {
        let authenticationViewController = AuthenticationViewController()
        authenticationViewController.delegate = self
        self.authenticationViewController = authenticationViewController
        navigationController.viewControllers = [authenticationViewController]
    }
}

// MARK: - AuthenticationViewControllerDelegate

extension AppRootCoordinator: AuthenticationViewControllerDelegate {
    func authenticationViewControllerDidTapOnSignIn(_ controller: UIViewController) {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        self.loginViewController = loginViewController
        navigationController.show(loginViewController, sender: self)
    }

    func authenticationViewControllerDidTapOnSignUp(_ controller: UIViewController) {
        let signUpViewController = SignUpViewController()
        signUpViewController.delegate = self
        self.signUpViewController = signUpViewController
        navigationController.show(signUpViewController, sender: self)
    }
}

// MARK: - MapViewControllerDelegate

extension AppRootCoordinator: MapViewControllerDelegate {

    func mapViewControllerDitTapOnListButton(_ controller: MapViewController, spaces: [Space], userCurrentLocation: CLLocation?) {
        let listOfSpacesViewController = ListOfSpacesViewController(spaces: spaces, userCurrentLocation: userCurrentLocation)
        self.listOfSpacesViewController = listOfSpacesViewController
        navigationController.show(listOfSpacesViewController, sender: self)
    }

    func mapViewControllerDitTapOnLogoutButton(_ controller: MapViewController) {
        AuthenticationManager().logout()
        showAuthenticationScreen()
    }

    func mapViewController(_ controller: MapViewController, didSelectSpace spase: Space) {
        let spaceDetailsViewController = SpaceDetailsViewController()
        self.spaceDetailsViewController = spaceDetailsViewController
        navigationController.show(spaceDetailsViewController, sender: self)
    }
}

// MARK: - SignUpViewControllerDelegate

extension AppRootCoordinator: SignUpViewControllerDelegate {
    func signUpViewControllerDidSignUp(_ controller: SignUpViewController) {
        showAppMainScreen()
    }
}

// MARK: - LoginViewControllerDelegate

extension AppRootCoordinator: LoginViewControllerDelegate {
    func loginViewControllerDidLogin(_ controller: LoginViewController) {
        showAppMainScreen()
    }
}
