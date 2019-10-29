//
//  TerminalState.swift
//  Terminal
//
//  Created by ben on 10/28/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import Foundation

extension Terminal {
	public struct State: Equatable {
		var dictionary: [String: TerminalDataValue] = [:]
		
		init?(with dictionary: [String: TerminalDataValue]) {
			self.dictionary = dictionary
		}
		
		init() {
			
		}

		public static func ==(lhs: State, rhs: State) -> Bool {
			return lhs.dictionary == rhs.dictionary
		}
	}
}

extension Dictionary where Key == String, Value == TerminalDataValue {
	static func ==(lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Bool {
		let lhKeys = Array(lhs.keys).sorted()
		let rhKeys = Array(rhs.keys).sorted()
		
		if lhKeys != rhKeys { return false }
		
		for key in lhKeys {
			if let lhString = lhs[key] as? String, let rhString = rhs[key] as? String {
				if lhString != rhString { return false }
			} else if let lhInt = lhs[key] as? Int, let rhInt = rhs[key] as? Int {
				if lhInt != rhInt { return false }
			} else if let lhFloat = lhs[key] as? Float, let rhFloat = rhs[key] as? Float {
				if lhFloat != rhFloat { return false }
			} else if let lhDate = lhs[key] as? Date, let rhDate = rhs[key] as? Date {
				if lhDate != rhDate { return false }
			} else if let lhDouble = lhs[key] as? Double, let rhDouble = rhs[key] as? Double {
				if lhDouble != rhDouble { return false }
			} else if let lhData = lhs[key] as? Data, let rhData = rhs[key] as? Data {
			   if lhData != rhData { return false }
		   }
		}
		
		return true
	}
	
}
