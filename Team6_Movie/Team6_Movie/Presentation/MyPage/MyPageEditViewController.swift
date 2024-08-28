//
//  MyPageEditViewController.swift
//  Team6_Movie
//
//  Created by 김효정 on 8/27/24.
//

import UIKit

class MyPageEditViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var saveAction: ((UIImage, String, String) -> Void)? // 바꾼 프사, 닉, 소개말 mypageVC에도 보여주려고
    var profileNameText: String? // 닉네임 텍스트 저장
    var introductionText: String? // 소개 텍스트 저장
    
    private lazy var profileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Group 12"), for: .normal)
        button.layer.cornerRadius = 60
        button.layer.masksToBounds = true
        
        button.addAction(UIAction(handler: { _ in
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    // 이미지 위에 어두운 오버레이를 추가
    private lazy var darkOverlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4) // 검은색 오버레이 (투명도 40%)
        view.layer.cornerRadius = 60
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false // 터치 이벤트 안 받도록
        return view
    }()
    
    private lazy var cameraIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.text = profileNameText
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "소개"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var introductionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "소개를 입력해주세요."
        textField.text = introductionText
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        
        setupInterface()
        setupLayout()
        setupNavigationBar()
        
        nameTextField.becomeFirstResponder()
        self.title = "프로필 수정"
    }
    
    func setupInterface() {
        view.addSubview(profileImageButton)
        profileImageButton.addSubview(darkOverlayView)
        profileImageButton.addSubview(cameraIconView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(introductionLabel)
        view.addSubview(introductionTextField)
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            profileImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            profileImageButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImageButton.heightAnchor.constraint(equalTo: profileImageButton.widthAnchor),
            
            // 어두운 오버레이를 버튼의 크기에 맞게 배치
            darkOverlayView.topAnchor.constraint(equalTo: profileImageButton.topAnchor),
            darkOverlayView.leadingAnchor.constraint(equalTo: profileImageButton.leadingAnchor),
            darkOverlayView.trailingAnchor.constraint(equalTo: profileImageButton.trailingAnchor),
            darkOverlayView.bottomAnchor.constraint(equalTo: profileImageButton.bottomAnchor),
            
            cameraIconView.centerXAnchor.constraint(equalTo: profileImageButton.centerXAnchor),
            cameraIconView.centerYAnchor.constraint(equalTo: profileImageButton.centerYAnchor),
            cameraIconView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            introductionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            introductionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            
            introductionTextField.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 10),
            introductionTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            introductionTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
        ])
    }
    
    private func setupNavigationBar() {
        // 네비게이션 타이틀 색상 설정
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainColor() // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 타이틀 텍스트 색상
        navigationController?.navigationBar.tintColor = .white // 버튼 색상
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 왼쪽에 취소 버튼 추가
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
        
        // 오른쪽에 확인 버튼 추가
        let saveButton = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonTapped() {
        // 이름 오류 처리(nil, 텍스트가 비어있을 때)
        guard let updateName = nameTextField.text, !updateName.isEmpty else {
            showAlert()
            return
        }
        
        guard let currentImage = profileImageButton.imageView?.image,
        let updateIntroduction = introductionTextField.text else {
            print("이미지나 소개가 유효하지 않습니다.")
            return
        }
        saveAction?(currentImage, updateName, updateIntroduction)
        navigationController?.popViewController(animated: true)
    }
    
    // alert 함수
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "이름을 입력해주세요.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
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
