//
//  Terminal.swift
//  Terminal
//
//  Created by ben on 10/28/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import Foundation

public class Terminal {
	public enum Kind: Equatable { case phone, watch
		var other: Kind { return self == .phone ? .watch : .phone }
	}
	
	var state = State()
	var delegate: TerminalDelegate?
	var availableMessageTypes: [Message.Type] = []

	var kind: Kind { return .phone }
}

public protocol TerminalDelegate: class {
	func didReceive(message: Message)
	func didUpate(state: Terminal.State)
}

public typealias MessagePayload = [String: TerminalDataValue]

public protocol Message {
	var payload: [String: TerminalDataValue] { get }
	
	init?(with payload: MessagePayload)
	func didReceive(from terminal: Terminal.Kind)
}

public protocol TerminalDataValue { }

extension String: TerminalDataValue {}
extension Int: TerminalDataValue {}
extension Float: TerminalDataValue {}
extension Date: TerminalDataValue {}
extension Double: TerminalDataValue {}
extension Data: TerminalDataValue {}

struct MessageKeys {
	static let type = "type"
	static let payload = "payload"
}

extension Message {
	static var messageType: String { return "\(self)" }

	static func register() {
		Terminal.instance.register(self)
	}

	func encode() -> [String: Any] {
		return [
			MessageKeys.type: type(of: self).messageType,
			MessageKeys.payload: self.payload
		]
	}
}
