//
//  DateUtilityTest.swift
//  SportOnTests
//
//  Created by Marwan Elbahnasawy on 11/05/2023.
//

import XCTest
@testable import SportOn

final class DateUtilityTest: XCTestCase {
    
    func testGetFromDateString() {
        // Given: A date object that corresponds to January 1, 1970
        let date = Date(timeIntervalSince1970: 0)
        
        // When: The getFromDateString method is called with the date object
        let dateString = DateUtility.getFromDateString(date: date)
        
        // Then: The date string returned should be "1970-01-01"
        XCTAssertEqual(dateString, "1970-01-01")
    }
    
    func testGetToDateString() {
        // Given: A date object that corresponds to January 1, 1970
        let date = Date(timeIntervalSince1970: 0)
        
        let days = 14
        
        // When: The getToDateString method is called with the date object and with 14 days
        let dateString = DateUtility.getToDateString(date: date, days: days)
        
        // Then: The date string returned should be "1970-01-15"
        XCTAssertTrue(dateString == "1970-01-15")
    }
    
}
