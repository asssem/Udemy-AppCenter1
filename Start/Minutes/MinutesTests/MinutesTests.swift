//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Assem on 12/8/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    var entryUnderTest: Entry!
    override func setUp() {
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDown() {
        entryUnderTest = nil
    }

    func testSerialzation() {
        guard let serialize = FileEntryStore.serialize(entryUnderTest) else {return}
        let finalDeserialze = FileEntryStore.deserialize(serialize)
        XCTAssertEqual(finalDeserialze?.title, "Title", "Title not correct")
        XCTAssertEqual(finalDeserialze?.content, "Content", "Content not correct")
    }
}
