//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardGameTests: XCTestCase {
    
    func test_Suit_출력() {
        XCTAssertTrue(Suit.club.description == "♣️")
        XCTAssertTrue(Suit.heart.description == "♥️")
        XCTAssertTrue(Suit.diamond.description == "♦️")
        XCTAssertTrue(Suit.spade.description == "♠️")
    }
    
    func test_숫자_출력() {
        XCTAssertTrue(Number.ace.description == "A")
        XCTAssertTrue(Number.king.description == "K")
        XCTAssertTrue(Number.queen.description == "Q")
        XCTAssertTrue(Number.jack.description == "J")
        XCTAssertTrue(Number.four.description == "4")
    }
    
    func test_카드_초기화() {
        let cardDeck = CardDeck()
        XCTAssertTrue(cardDeck[51] == Card(Suit.spade, Number.king))
    }

    func test_카드_52개_맞음() {
        let cardDeck = CardDeck()
        XCTAssertTrue(cardDeck.count() == 52)
    }

    func test_카드_뽑음() {
        var cardDeck = CardDeck()
        var cards: [Card] = []
        let compareCardDeck = CardDeck()
        
        for _ in 0..<cardDeck.count() {
            cards.append(cardDeck.removeOne())
        }
        
        let result = cards.sorted(by: <)
        
        XCTAssertTrue(compareCardDeck[51] == result[51])
    }

    func test_카드_섞음() {
        var cardDeck = CardDeck()
        cardDeck.suffle()
        var compareCardDeck = CardDeck()
        compareCardDeck.suffle()
        XCTAssertTrue(cardDeck != compareCardDeck)
    }
}