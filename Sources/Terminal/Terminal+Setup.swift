//
//  File.swift
//  
//
//  Created by Ben Gottlieb on 10/29/19.
//

import Foundation
import WatchConnectivity

extension Terminal {
	func register(_ messageKind: Message.Type) {
		self.availableMessageTypes.append(messageKind)
	}
	
	func send(message: Message, untilConfirmed: Bool = false, completion: ((Error?) -> Void)? = nil) {
		let payload = message.encode()
		print("Sending \(type(of: message).messageType)")
		
		WCSession.default.sendMessage(payload, replyHandler: nil) { error in
			completion?(error)
		}
	}

	@discardableResult
	func decode(message: [String: Any]) -> Message? {
		guard let messageType = message[MessageKeys.type] as? String, let payload = message[MessageKeys.payload] as? MessagePayload else { return nil }
		print("Received \(messageType) at \(Date())")
		
		for type in self.availableMessageTypes {
			if type.messageType == messageType, let message = type.init(with: payload) {
				message.didReceive(from: self.kind.other)
				return message
			}
		}
		
		return nil
	}

}
