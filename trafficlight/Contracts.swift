//
//  Contracts.swift
//  trafficlight
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import Foundation

// methods that the View guarentees to implement
protocol TrafficLightViewProtocol: class {
    // call to update the view's representation of the traffic light's lamps
    func updateTrafficLightLamps(state: TrafficLightState)
    // call to update the view's representation of the traffic light's status
    func updateTrafficLightStatus(state: TrafficLightState)
}

// methods that the ViewModel guarentees to implement
protocol TrafficLightViewModelProtocol: class {
    // call takeView when the View has loaded
    func takeView(_ view: TrafficLightViewProtocol)
    // call dropView when the View is finished with
    func dropView()
    // to cycle through the traffic light states
    func nextStateTapped()
}
