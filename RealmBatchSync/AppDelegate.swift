//
//  AppDelegate.swift
//  RealmBatchSync
//
//  Created by Rafael Paula on 01/11/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		var config = Realm.Configuration()
		config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("RealmBatch.realm")
		Realm.Configuration.defaultConfiguration = config
		
		print(">>> REALM PATH FILE: \(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "")")
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) { }

	func applicationDidEnterBackground(_ application: UIApplication) { }

	func applicationWillEnterForeground(_ application: UIApplication) { }

	func applicationDidBecomeActive(_ application: UIApplication) { }

	func applicationWillTerminate(_ application: UIApplication) { }

}
