//
//  ViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "hello"
        label.font = .h0b
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        view.backgroundColor = .red
    }


}

