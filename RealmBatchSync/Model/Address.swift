//
//  Address.swift
//  RealmBatchSync
//
//  Created by Rafael Paula on 01/11/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Address: Object, Mappable {
	@objc dynamic var id = 0
	@objc dynamic var address = ""
	@objc dynamic var supplement = ""
	@objc dynamic var city = ""
	@objc dynamic var state = ""
	@objc dynamic var phone = ""
	
	override static func primaryKey() -> String? {
		return "id"
	}
	
	required convenience init?(map: Map) {
		self.init()
	}
	
	func mapping(map: Map) {
		id <- map["id"]
		address <- map["address"]
		supplement <- map["supplement"]
		city <- map["city"]
		state <- map["state"]
		phone <- map["phone"]
	}
}
