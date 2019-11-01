//
//  PhoneTerminal.swift
//  Terminal
//
//  Created by ben on 10/28/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

#if os(watchOS)

import Foundation
import WatchConnectivity

public class WatchTerminal: Terminal {
	override var kind: Kind { return .watch }

	func sendState() {
		
	}
}

extension Terminal {
	static let instance = WatchTerminal()
	static var isPhone: Bool { return false }
}


#endif
