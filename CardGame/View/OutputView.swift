//
//  OutputView.swift
//  CardGameUnitTest
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

// 출력을 담당하는 객체
struct OutputView {
    
    // static을 선언 이유 : OutputView를 객체 생성하지 않고 바로 showCard함수를 실행하기 위하여 선언
    
    static func showCard(_ card: Card) {
        print(card.desription())
    }
    
    // 시작 시 실행 선택하는 메시지
    static func cardGameSelectMassgae() {
        print(CARDGAME_SELECT_MSG)
        print(CARDGAME_SELECT_RESET_MSG)
        print(CARDGAME_SELECT_SHUFFLE_MSG)
        print(CARDGAME_SELECT_DRAW_MSG)
    }
    
    // 에러 메시지를 출력 하는 함수
    static func errorMessage(_ e : CardGaemError) {
        print(e.description)
    }
    
    static func showResult(_ resultMessag: String) {
        print(resultMessag)
    }
    
}