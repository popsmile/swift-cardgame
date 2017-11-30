//
//  EnumCollection.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// EnumCollection을 채택한 타입은 Hashable도 구현해야 함. Enum은 이미 Hashable이므로 hashValue를 따로 구현해줄 필요 없음.
protocol EnumCollection: Hashable {
    // 자기자신 내부 요소로 sequence 만들어 반환.
    static func cases() -> AnySequence<Self>
    // sequence를 array로 타입캐스팅하여 반환.
    static var allValues: [Self] { get }
}

// enum 내부 값을 배열로 가져오는 확장 기능.
// [출처](https://theswiftdev.com/2017/10/12/swift-enum-all-values/)
extension EnumCollection {
    // 내부 값의 시퀀스 반환.
    static func cases() -> AnySequence<Self>  {
        // 전체 요소를 시퀀스로 만들어 반환.
        return AnySequence { () -> AnyIterator<Self> in
            var hash = 0
            return AnyIterator {
                defer { hash += 1 }
                let currentElement = withUnsafePointer(to: &hash) {
                    $0.withMemoryRebound(to: Self.self, capacity: 1) { $0.pointee }
                }
                guard currentElement.hashValue == hash else { return nil }
                return currentElement
            }
        }
    }
    // 시퀀스를 배열로 캐스팅 후 반환.
    static var allValues: [Self] {
        return Array(self.cases())
    }
}
