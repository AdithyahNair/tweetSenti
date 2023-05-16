//
//  testsPastRecordsVC.swift
//  tweetSentiTests
//
//  Created by Adithyah Nair on 16/05/23.
//

@testable import tweetSenti
import XCTest

final class testsPastRecordsVC: XCTestCase {
    let vc = PastRecordsVC()

    var isTweetArrayEmpty: Bool = true

    func testsloadTweets() {
        vc.loadTweets()
        if vc.tweetArray.count != 0 {
            isTweetArrayEmpty = false
        } else {
            isTweetArrayEmpty = true
        }

        XCTAssertEqual(isTweetArrayEmpty, true)
        XCTAssertEqual(isTweetArrayEmpty, false)
    }
}
