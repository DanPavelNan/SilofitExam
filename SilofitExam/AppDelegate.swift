//
//  AppDelegate.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-01.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appRootCoordinator: AppRootCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        let appRootCoordinator = AppRootCoordinator()
        self.appRootCoordinator = appRootCoordinator
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appRootCoordinator.navigationController
        window?.makeKeyAndVisible()

        appRootCoordinator.start()
        return true
    }
}
