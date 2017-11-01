//
//  Customer.swift
//  RealmBatchSync
//
//  Created by Rafael Paula on 01/11/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Customer: Object, Mappable, BaseModel {
	@objc dynamic var id = 0
	@objc dynamic var name = ""
	@objc dynamic var occupation = ""
	@objc dynamic var email = ""
	@objc dynamic var mobile_phone = ""
	var adresses = List<Address>()
	
	override static func primaryKey() -> String? {
		return "id"
	}
	
	//Impl. of Mappable protocol
	required convenience init?(map: Map) {
		self.init()
	}
	
	func mapping(map: Map) {
		id <- map["id"]
		name <- map["name"]
		occupation <- map["occupation"]
		email <- map["email"]
		mobile_phone <- map["mobile_phone"]
		
		let mapper_adresses = Mapper<Address>().mapArray(JSONObject: map["adresses"].currentValue)
		if let mapper_adresses = mapper_adresses {
			adresses.append(objectsIn: mapper_adresses)
		}
	}
	
	static func apiUrl() -> String {
		return "https://private-3d4a9-realmbatch.apiary-mock.com/customers"
	}
}
