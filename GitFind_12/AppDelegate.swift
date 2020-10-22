//
//  AppDelegate.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 21.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let viewController = ViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        let navigationController = UINavigationController(rootViewController: viewController)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }
    
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let navigationController = UINavigationController()
//        let mainView = ViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
//        navigationController.viewControllers = [mainView]
//        self.window!.rootViewController = navigationController
//        self.window?.makeKeyAndVisible()
//        return true
//    }
    
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //        // Override point for customization after application launch.
    //        return true
    //    }
    
    // MARK: UISceneSession Lifecycle
    
    //    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    //        // Called when a new scene session is being created.
    //        // Use this method to select a configuration to create the new scene with.
    //        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //    }
    //
    //    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    //        // Called when the user discards a scene session.
    //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //    }
    
    
}

