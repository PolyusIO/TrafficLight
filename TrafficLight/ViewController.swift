//
//  ViewController.swift
//  TrafficLight
//
//  Created by Сергей Поляков on 10.04.2023.
//

import UIKit

enum TrafficLightsColor {
    case off
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var switchColorButton: UIButton!
    
    private var trafficLightsColor = TrafficLightsColor.off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        switchColorButton.layer.cornerRadius = 10
        switchColorButton.configuration = setupButton(with: "START")
        setupViews(redView, yellowView, greenView)
    }
    
    @IBAction func switchColorButtonDidTap() {
        switch trafficLightsColor {
        case .off:
            switchColorButton.configuration = setupButton(with: "NEXT")
            setupTrafficLightsColor(red: true, yellow: false, green: false)
            trafficLightsColor = .red
        case .red:
            setupTrafficLightsColor(red: false, yellow: true, green: false)
            trafficLightsColor = .yellow
        case .yellow:
            setupTrafficLightsColor(red: false, yellow: false, green: true)
            trafficLightsColor = .green
        case .green:
            setupTrafficLightsColor(red: true, yellow: false, green: false)
            trafficLightsColor = .red
        }
    }
    
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfuguration = UIButton.Configuration.filled()
        buttonConfuguration.title = title
        buttonConfuguration.attributedTitle?.font = UIFont.systemFont(ofSize: 35)
        buttonConfuguration.buttonSize = .large
        buttonConfuguration.cornerStyle = .large
        return buttonConfuguration
    }
    
    private func setupViews(_ views: UIView...) {
        for view in views {
            view.layer.cornerRadius = view.frame.height / 2
            view.alpha = 0.3
        }
    }
    
    private func setupTrafficLightsColor(red: Bool, yellow: Bool, green: Bool) {
        redView.alpha = red ? 1 : 0.3
        yellowView.alpha = yellow ? 1 : 0.3
        greenView.alpha = green ? 1 : 0.3
    }
}

