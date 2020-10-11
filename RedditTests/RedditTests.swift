//
//  RedditTests.swift
//  RedditTests
//
//  Created by Folarin Williamson on 10/10/20.
//

import XCTest
@testable import Reddit

class RedditTests: XCTestCase {

    func testPostTableViewCell() throws {
        let vm = MockTableViewCellViewModel()
        let sut = PostTableViewCell()
        sut.configure(vm)
        XCTAssertEqual(sut.titleLabel.text, vm.title)
        XCTAssertEqual(sut.subtitleLabel.text, vm.subtitle)
        XCTAssertEqual(sut.reuseIdentifier, String(describing: PostTableViewCell.self))
    }
}

fileprivate extension RedditTests {
    struct MockTableViewCellViewModel: PostCellConfigurable {
        var title: String = "Mock Title"
        var subtitle: String = "Mock Subtitle"
    }
}
