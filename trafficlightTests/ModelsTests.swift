//
//  ModelsTests.swift
//  trafficlightTests
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import XCTest
@testable import trafficlight

class ModelsTests: XCTestCase {

    var trafficLight: TrafficLight = TrafficLight()

    override func setUp() {
        trafficLight.state = .stop
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCycleFromStopToReadyToGo() {
        self.trafficLight.cycleToNextState(after: 0)

        XCTAssert(self.trafficLight.state == .readyToGo)
    }

    func testCycleFromStopToGo() {
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)

        XCTAssert(self.trafficLight.state == .go)
    }

    func testCycleFromStopToPrepareToStop() {
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)

        XCTAssert(self.trafficLight.state == .prepareToStop)
    }

    func testCycleFromStopToStop() {
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)

        XCTAssert(self.trafficLight.state == .stop)
    }

    func testNumberOfLampsCorrectForEachStates() {
        XCTAssert(hasTheCorrectNumberOfLamps(lamps: TrafficLightState.stop.lamps()) == true)
        XCTAssert(hasTheCorrectNumberOfLamps(lamps: TrafficLightState.readyToGo.lamps()) == true)
        XCTAssert(hasTheCorrectNumberOfLamps(lamps: TrafficLightState.go.lamps()) == true)
        XCTAssert(hasTheCorrectNumberOfLamps(lamps: TrafficLightState.prepareToStop.lamps()) == true)
    }

    // It's a standard UK traffic light so there should always be 3 lamps
    private func hasTheCorrectNumberOfLamps(lamps:[Lamp]) -> Bool {
        guard lamps.count == 3 else { return false }

        return true
    }


    func testLampColourOrder() {
        XCTAssert(isRedThenAmberThenGreen(lamps: TrafficLightState.stop.lamps()) == true)
        XCTAssert(isRedThenAmberThenGreen(lamps: TrafficLightState.readyToGo.lamps()) == true)
        XCTAssert(isRedThenAmberThenGreen(lamps: TrafficLightState.go.lamps()) == true)
        XCTAssert(isRedThenAmberThenGreen(lamps: TrafficLightState.prepareToStop.lamps()) == true)
    }

    // It's a standard UK traffic light so it's Red then Amber then Green
    private func isRedThenAmberThenGreen(lamps:[Lamp]) -> Bool {

        guard hasTheCorrectNumberOfLamps(lamps: lamps) else { return false }

        let shouldBeRed = lamps[0]
        let shouldBeAmber = lamps[1]
        let shouldBeGreen = lamps[2]

        XCTAssert(shouldBeRed.colour == .red)
        XCTAssert(shouldBeAmber.colour == .amber)
        XCTAssert(shouldBeGreen.colour == .green)

        guard shouldBeRed.colour == .red,
              shouldBeAmber.colour == .amber,
              shouldBeGreen.colour == .green else { return false }

        return true
    }

    func testOnAndOffForStopState() {
        XCTAssert(self.trafficLight.state.isRedLampOn() == true)
        XCTAssert(self.trafficLight.state.isAmberLampOn() == false)
        XCTAssert(self.trafficLight.state.isGreenLampOn() == false)
    }

    func testOnAndOffForreadyToGoState() {
        self.trafficLight.cycleToNextState(after: 0)

        XCTAssert(self.trafficLight.state.isRedLampOn() == true)
        XCTAssert(self.trafficLight.state.isAmberLampOn() == true)
        XCTAssert(self.trafficLight.state.isGreenLampOn() == false)
    }

    func testOnAndOffForGoState() {
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)

        XCTAssert(self.trafficLight.state.isRedLampOn() == false)
        XCTAssert(self.trafficLight.state.isAmberLampOn() == false)
        XCTAssert(self.trafficLight.state.isGreenLampOn() == true)
    }

    func testOnAndOffForPrepareToStopState() {
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)
        self.trafficLight.cycleToNextState(after: 0)
        
        XCTAssert(self.trafficLight.state.isRedLampOn() == false)
        XCTAssert(self.trafficLight.state.isAmberLampOn() == true)
        XCTAssert(self.trafficLight.state.isGreenLampOn() == false)
    }

}
