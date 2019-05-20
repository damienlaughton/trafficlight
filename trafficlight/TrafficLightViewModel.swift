//
//  TrafficLightViewModel.swift
//  trafficlight
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import Foundation

class TrafficLightViewModel: TrafficLightViewModelProtocol {

    weak var view: TrafficLightViewProtocol? = .none

    var traficLight: TrafficLight = TrafficLight()

    func takeView(_ view: TrafficLightViewProtocol) {
        self.view = view
        self.updateView()
    }

    func dropView() {
        self.view = .none
    }

    func nextStateTapped() {
        self.traficLight.cycleToNextState(after: 0)
        self.updateView()
    }

    private func updateView() {
        self.view?.updateTrafficLightLamps(state: self.traficLight.state)
        self.view?.updateTrafficLightStatus(state: self.traficLight.state)
    }
}
