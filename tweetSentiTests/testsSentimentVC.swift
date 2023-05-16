//
//  tweetSentiTests.swift
//  tweetSentiTests
//
//  Created by Adithyah Nair on 14/05/23.
//

@testable import tweetSenti
import XCTest

final class testsSentimentVC: XCTestCase {
    // MARK: - Tests for SentimentVC Methods

    // MARK: - Properties

    let vc = SentimentVC()

    let score1 = 21

    let score2 = 10

    let score3 = -10

    let score4 = 0

    // MARK: - Methods

    func testsReturnEmoji() {
        let emoji1 = vc.returnEmoji(score: score1)
        let emoji2 = vc.returnEmoji(score: score2)
        let emoji3 = vc.returnEmoji(score: score3)
        let emoji4 = vc.returnEmoji(score: score4)
        XCTAssertEqual(emoji1, "😇")
        XCTAssertEqual(emoji2, "😐")
        XCTAssertEqual(emoji3, "😡")
        XCTAssertEqual(emoji4, "😇")
    }
}
