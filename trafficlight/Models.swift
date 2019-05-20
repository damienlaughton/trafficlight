//
//  Models.swift
//  trafficlight
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import Foundation

enum LampColour {
    case red
    case amber
    case green
}

class Lamp {
    var colour: LampColour = .red
    var isOn: Bool = false

    init(colour: LampColour = .red, isOn: Bool = false) {
        self.colour = colour
        self.isOn = isOn
    }
}

enum TrafficLightState {
    case stop
    case readyToGo
    case go
    case prepareToStop

    func cycleToNextState() -> TrafficLightState {
        switch self {
        case .stop: return .readyToGo
        case .readyToGo: return .go
        case .go: return .prepareToStop
        case .prepareToStop: return .stop
        }
    }

    func lamps() -> [Lamp] {
        switch self {
        case .stop:
            return [Lamp(colour: .red, isOn: true), Lamp(colour: .amber, isOn: false), Lamp(colour: .green, isOn: false)]
        case .readyToGo:
            return [Lamp(colour: .red, isOn: true), Lamp(colour: .amber, isOn: true), Lamp(colour: .green, isOn: false)]
        case .go:
            return [Lamp(colour: .red, isOn: false), Lamp(colour: .amber, isOn: false), Lamp(colour: .green, isOn: true)]
        case .prepareToStop:
            return [Lamp(colour: .red, isOn: false), Lamp(colour: .amber, isOn: true), Lamp(colour: .green, isOn: false)]
        }
    }

    func isRedLampOn() -> Bool {
        return self.lamps()[0].isOn
    }

    func isAmberLampOn() -> Bool {
        return self.lamps()[1].isOn
    }

    func isGreenLampOn() -> Bool {
        return self.lamps()[2].isOn
    }

    func statusDescription() -> String {
        switch self {
        case .stop:
            return "Stop"
        case .readyToGo:
            return "Ready to go"
        case .go:
            return "Go"
        case .prepareToStop:
            return "Prepare to stop"
        }
    }
}

class TrafficLight {
    var state: TrafficLightState = .stop

    func cycleToNextState(after: TimeInterval) {
        // unimplemented wait for a period of time

        self.state = self.state.cycleToNextState()
    }
}


