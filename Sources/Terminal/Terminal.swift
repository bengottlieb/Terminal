//
//  Terminal.swift
//  Terminal
//
//  Created by ben on 10/28/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import Foundation

public class Terminal {
	func send(message: Message) { }
	
	var state = State()
	var delegate: TerminalDelegate?
}

public protocol TerminalDelegate: class {
	func didReceive(message: Message)
	func didUpate(state: Terminal.State)
}

public protocol Message {
	var dictionaryValue: [String: TerminalDataValue] { get }
	
	init?(with dictionary: [String: TerminalDataValue])
}

public protocol TerminalDataValue { }

extension String: TerminalDataValue {}
extension Int: TerminalDataValue {}
extension Float: TerminalDataValue {}
extension Date: TerminalDataValue {}
extension Double: TerminalDataValue {}
extension Data: TerminalDataValue {}

