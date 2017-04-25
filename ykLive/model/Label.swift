//
//	Label.swift
//
//	Create by 小莫 on 25/4/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Label{

	var cl : [Int]!
	var tabKey : String!
	var tabName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cl = dictionary["cl"] as? [Int]
		tabKey = dictionary["tab_key"] as? String
		tabName = dictionary["tab_name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cl != nil{
			dictionary["cl"] = cl
		}
		if tabKey != nil{
			dictionary["tab_key"] = tabKey
		}
		if tabName != nil{
			dictionary["tab_name"] = tabName
		}
		return dictionary
	}

}