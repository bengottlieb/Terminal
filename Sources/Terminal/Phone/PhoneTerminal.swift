//
//  PhoneTerminal.swift
//  Terminal
//
//  Created by ben on 10/28/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

#if os(iOS)

import Foundation
import WatchConnectivity

public class PhoneTerminal: Terminal {
	func sendState() {
		
	}
}

extension Terminal {
	static var isPhone: Bool { return true }
	static let instance = PhoneTerminal()
}

#endif
