//
//  APIAuth.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation
import CommonCrypto

struct APIAuth {
    private let privateKey = "b92b8f1f6d76178f31a8adcbe931699cda14a2af"
    private let publicKey = "c5c7bf95f48d9b4c9c6993cfc997168b"
    var timestamp: String {
        return String(describing: Int(Date().timeIntervalSince1970))
    }
    
    private func md5(_ string: String) -> String {
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData.map { String(format: "%02hhx", $0) }.joined()
    }
    
    var authParams: [String: String] {
        return [
            "apikey": publicKey,
            "ts": timestamp,
            "hash": md5(timestamp+privateKey+publicKey)
        ]
    }
}
