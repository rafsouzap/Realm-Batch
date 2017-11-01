//
//  ViewController.swift
//  RealmBatchSync
//
//  Created by Rafael Paula on 01/11/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func buttonSync(_ sender: UIButton) {
		
		AlamofireRequest.Get(type: Customer.self, success: {
			self.showAlert(title: "Customers", message: "Successfull fetched Customers")
		}, fail: { error in
			self.showAlert(title: "Customers", message: "Unsuccessfull fetched Customers\n\n\(error.description)")
		})

	}
	
	func showAlert(title: String, message: String) -> Void {
		let actionSheetController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in }
		actionSheetController.addAction(cancelAction)
		self.present(actionSheetController, animated: true, completion: nil)
	}
}
