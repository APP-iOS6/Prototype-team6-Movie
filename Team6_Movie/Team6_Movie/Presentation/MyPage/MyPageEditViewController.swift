//
//  MyPageEditViewController.swift
//  Team6_Movie
//
//  Created by 김효정 on 8/27/24.
//

import UIKit

class MyPageEditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        
        button.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        
        button.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 변경"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var profileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Group 12"), for: .normal)
        
        button.addAction(UIAction(handler: { _ in
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.text = "씨네"
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .white
        textField.textColor = .white
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        
        setupInterface()
        setupLayout()
        
        textField.becomeFirstResponder()
    }
    
    func setupInterface() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(closeButton)
        topStackView.addArrangedSubview(profileLabel)
        topStackView.addArrangedSubview(confirmButton)
        stackView.addArrangedSubview(profileImageButton)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(textField)
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // 스택뷰 제약 조건
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            profileImageButton.topAnchor.constraint(equalTo: topStackView.topAnchor, constant: 90),
            profileImageButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            profileImageButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -150),
            profileImageButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 150),
            profileImageButton.heightAnchor.constraint(equalTo: profileImageButton.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
        ])
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            if let editedImage = info[.editedImage] as? UIImage {
                self.profileImageButton.setImage(editedImage, for: .normal)
            } else if let originalImage = info[.originalImage] as? UIImage {
                self.profileImageButton.setImage(originalImage, for: .normal)
            }
        }
    }
}

