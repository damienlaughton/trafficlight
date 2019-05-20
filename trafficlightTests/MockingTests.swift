//
//  MockingTests.swift
//  trafficlightTests
//
//  Created by Damien Laughton on 08/05/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import XCTest
@testable import trafficlight

class MockTrafficLightViewController: TrafficLightViewProtocol {

    var numberOfCallsUpdateTrafficLightLamps: Int = 0
    func updateTrafficLightLamps(state: TrafficLightState) {
        numberOfCallsUpdateTrafficLightLamps += 1
    }

    var numberOfCallsUpdateTrafficLightStatus: Int = 0
    func updateTrafficLightStatus(state: TrafficLightState) {
        numberOfCallsUpdateTrafficLightStatus += 1
    }

    func verifyNumberOfCallsUpdateTrafficLightLamps(numberOfCalls: Int = 1) -> Bool {
        var verify: Bool = true

        if numberOfCalls == numberOfCallsUpdateTrafficLightLamps {
            verify = true
        }

        return verify
    }

    func verifyNumberOfCallsUpdateTrafficLightStatus(numberOfCalls: Int = 1) -> Bool {
        var verify: Bool = true

        if numberOfCalls == numberOfCallsUpdateTrafficLightStatus {
            verify = true
        }

        return verify
    }
}

class MockTrafficLightViewControllerTests: XCTestCase {

    var mockTrafficLightViewController: MockTrafficLightViewController? = .none
    var trafficLightViewModel: TrafficLightViewModel? = .none

    override func setUp() {
        super.setUp()

        self.mockTrafficLightViewController = MockTrafficLightViewController()

        self.trafficLightViewModel = TrafficLightViewModel()
    }

    override func tearDown() {
        self.mockTrafficLightViewController = .none
        self.trafficLightViewModel = .none
    }

    func testCorrectNumberOfContractCallsOnTakeView() {
        // Given
        guard let trafficLightViewModel = self.trafficLightViewModel else { XCTFail(); return }
        guard let mockTrafficLightViewController = self.mockTrafficLightViewController else { XCTFail(); return }

        // When
        trafficLightViewModel.takeView(mockTrafficLightViewController)

        // Then
        XCTAssertTrue(mockTrafficLightViewController.verifyNumberOfCallsUpdateTrafficLightLamps(numberOfCalls: 1))
        XCTAssertTrue(mockTrafficLightViewController.verifyNumberOfCallsUpdateTrafficLightStatus(numberOfCalls: 1))
    }

    func testCorrectNumberOfContractCallsOnTakeViewAndNextTap() {
        // Given
        guard let trafficLightViewModel = self.trafficLightViewModel else { XCTFail(); return }
        guard let mockTrafficLightViewController = self.mockTrafficLightViewController else { XCTFail(); return }

        // When
        trafficLightViewModel.takeView(mockTrafficLightViewController)
        trafficLightViewModel.nextStateTapped()

        // Then
        XCTAssertTrue(mockTrafficLightViewController.verifyNumberOfCallsUpdateTrafficLightLamps(numberOfCalls: 2))
        XCTAssertTrue(mockTrafficLightViewController.verifyNumberOfCallsUpdateTrafficLightStatus(numberOfCalls: 2))
    }

}
