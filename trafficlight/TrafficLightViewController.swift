//
//  TrafficLightViewController.swift
//  trafficlight
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {

    @IBOutlet var redLampView: LampView!
    @IBOutlet var amberLampView: LampView!
    @IBOutlet var greenLampView: LampView!

    @IBOutlet var statusLabel: UILabel!

    var viewModel: TrafficLightViewModelProtocol? = TrafficLightViewModel()

    deinit {
        self.viewModel?.dropView()
        self.viewModel = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.viewModel?.takeView(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func nextButtonTapped(sender: UIButton) {
        self.viewModel?.nextStateTapped()
    }
}

extension TrafficLightViewController: TrafficLightViewProtocol {
    //No tests here - let's trust the unit tests
    func updateTrafficLightLamps(state: TrafficLightState) {
        state.isRedLampOn() ? self.redLampView.on() : self.redLampView.off()
        state.isAmberLampOn() ? self.amberLampView.on() : self.amberLampView.off()
        state.isGreenLampOn() ? self.greenLampView.on() : self.greenLampView.off()
    }

    func updateTrafficLightStatus(state: TrafficLightState) {
        statusLabel.text = state.statusDescription()
    }
}

