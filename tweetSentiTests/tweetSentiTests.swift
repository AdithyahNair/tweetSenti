//
//  tweetSentiTests.swift
//  tweetSentiTests
//
//  Created by Adithyah Nair on 14/05/23.
//

@testable import tweetSenti
import XCTest

final class tweetSentiTests: XCTestCase {
    func testsReturnEmoji() {
        let vc = SentimentVC()
        let score = 21
        let emoji = vc.returnEmoji(score: score)
        XCTAssertEqual(emoji, "😇")
    }
    
    func testsReturndrunk() {
        
    }
}
