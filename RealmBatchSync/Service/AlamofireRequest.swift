//
//  AlamofireRequest.swift
//  RealmBatchSync
//
//  Created by Rafael Paula on 01/11/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

final class AlamofireRequest {
	
	static func Get<T: Object>(type: T.Type, success: @escaping() -> Void, fail: @escaping(_ error: NSError) -> Void) where T:Mappable, T:BaseModel {
		
		Alamofire.request(type.apiUrl()).responseArray { (response: DataResponse<[T]>) in
			
			switch response.result {
				
			case .success(let items):
				autoreleasepool {
					do {
						let realm = try Realm()
						try realm.write {
							for item in items {
								realm.add(item, update: true)
							}
						}
						success()
					} catch let error as NSError {
						fail(error)
					}
				}
				
			case .failure(let error):
				fail(error as NSError)
				
			}
			
		}
		
	}
	
}



//static func get <T: Object> (type: T.Type, success:() -> Void, fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable, T:Meta {
//
//	Alamofire.request(type.url()).responseArray { (response: DataResponse<[T]>) in
//		switch response.result {
//		case .success(let items):
//			autoreleasepool {
//				do {
//					let realm = try Realm()
//					try realm.write {
//						for item in items {
//							realm.add(item, update: true)
//						}
//					}
//				} catch let error as NSError {
//					fail(error)
//				}
//			}
//		case .failure(let error):
//			fail(error as NSError)
//		}
//	}
//
//}

