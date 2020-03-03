//
//  AppDelegate.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 27/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//
import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
   
    let appDI = AppDIContainer()
    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = appDI.makeHomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

}



