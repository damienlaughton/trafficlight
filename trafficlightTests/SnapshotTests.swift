//
//  SnapshotTests.swift
//  trafficlightTests
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import FBSnapshotTestCase
@testable import trafficlight

class BaseSnapshotTestCase: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        if ProcessInfo.processInfo.environment["RECORD_MODE"] != nil {
            self.recordMode = true
        }
    }
}

class LampSnapshotTestCase: BaseSnapshotTestCase {

    func test_lampOn() {
        let view = LampView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        view.on()
        FBSnapshotVerifyView(view)
    }

    func test_lampOff() {
        let view = LampView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        view.off()
        FBSnapshotVerifyView(view)
    }
}

class TrafficLightSnapshotTestCase: BaseSnapshotTestCase {

    var trafficLightViewController: TrafficLightViewController? = .none

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        trafficLightViewController =
            storyboard.instantiateViewController(withIdentifier: "TrafficLightViewController") as? TrafficLightViewController
    }

    override func tearDown() {
        trafficLightViewController = .none
    }

    func test_trafficLightStop() {
        guard let trafficLightViewController = self.trafficLightViewController else {
            XCTFail()
            return
        }

        FBSnapshotVerifyView(trafficLightViewController.view)
    }

    func test_trafficLightReadyToGo() {
        guard let trafficLightViewController = self.trafficLightViewController else {
            XCTFail()
            return
        }

        trafficLightViewController.nextButtonTapped(sender: UIButton())

        FBSnapshotVerifyView(trafficLightViewController.view)
    }

    func test_trafficLightGo() {
        guard let trafficLightViewController = self.trafficLightViewController else {
            XCTFail()
            return
        }

        trafficLightViewController.nextButtonTapped(sender: UIButton())
        trafficLightViewController.nextButtonTapped(sender: UIButton())

        FBSnapshotVerifyView(trafficLightViewController.view)
    }

    func test_trafficLightPrepareToStop() {
        guard let trafficLightViewController = self.trafficLightViewController else {
            XCTFail()
            return
        }

        trafficLightViewController.nextButtonTapped(sender: UIButton())
        trafficLightViewController.nextButtonTapped(sender: UIButton())
        trafficLightViewController.nextButtonTapped(sender: UIButton())

        FBSnapshotVerifyView(trafficLightViewController.view)
    }

}
