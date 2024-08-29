//
//  WriteViewController.swift
//  Team6_Movie
//
//  Created by 김수민 on 8/27/24.
//

import UIKit

class WriteViewController: BaseViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //전체 스크롤뷰로 지정
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //라벨, 텍스트, 버튼은 담을 뷰
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //사진 추가 뷰
    private let square: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let cameraIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera")
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let plusIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    //카테고리 뷰
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    private let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //제목 뷰
    private let titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "제목"
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.placeholder = "  KBO리그 LG트윈스 VS NC 다이노스"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.3
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 4
        return textField
    }()
    
    //모집인원 뷰
    private let personLabel: UILabel = {
        let label = UILabel()
        label.text = "모집인원"
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    private let personTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.keyboardType = .numberPad
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.3
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 4
        return textField
    }()
    
    //일시 뷰
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "일시"
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    private let datePicker = UIDatePicker()
    
    private let datePickerContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //장소 뷰
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "장소"
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    private let placeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.3
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 4
        
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .systemGray
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        textField.rightView = searchButton
        textField.rightViewMode = .always
        
        return textField
    }()
    
    //태그 뷰
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "태그"
        label.font = UIFont.bold20
        label.textColor = .white
        return label
    }()
    
    private let tagTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        textField.placeholder = "  #KBO #CGV #LG트윈스 #NC다이노스"
        textField.font = UIFont.systemFont(ofSize: 12)
        return textField
    }()
    
    //모집하기 버튼
    private lazy var submitButton: UIButton = UIButton.createButton("모집하기")
    
    //뷰 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        setupLayout()
        setupDatePicker()
        setupButtons()
    }
    
    //레이아웃
    private func setupLayout() {
        
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel2, titleTextField])
        titleStackView.axis = .vertical
        titleStackView.spacing = 8
        
        let personStackView = UIStackView(arrangedSubviews: [personLabel, personTextField])
        personStackView.axis = .vertical
        personStackView.spacing = 8
        
        let placeStackView = UIStackView(arrangedSubviews: [placeLabel, placeTextField])
        placeStackView.axis = .vertical
        placeStackView.spacing = 8
        
        let personAndPlaceStackView = UIStackView(arrangedSubviews: [personStackView, placeStackView])
        personAndPlaceStackView.axis = .horizontal
        personAndPlaceStackView.spacing = 16
        personAndPlaceStackView.distribution = .fillEqually
        personAndPlaceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let timeStackView = UIStackView(arrangedSubviews: [timeLabel, datePickerContainer])
        timeStackView.axis = .vertical
        timeStackView.spacing = 8
        
        let tagStackView = UIStackView(arrangedSubviews: [tagLabel, tagTextField])
        tagStackView.axis = .vertical
        tagStackView.spacing = 8
        
        let stackView = UIStackView(arrangedSubviews: [
            categoryLabel,
            categoryStackView,
            titleStackView,
            personAndPlaceStackView,
            timeStackView,
            tagStackView,
            submitButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(square)
        contentView.addSubview(stackView)
        
        datePickerContainer.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            square.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            square.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            square.widthAnchor.constraint(equalToConstant: 110),
            square.heightAnchor.constraint(equalToConstant: 110),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: square.bottomAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 60),
            
            datePickerContainer.heightAnchor.constraint(equalToConstant: 150),
            datePickerContainer.widthAnchor.constraint(equalToConstant: 300),
            
            datePicker.centerXAnchor.constraint(equalTo: datePickerContainer.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: datePickerContainer.centerYAnchor),
            datePicker.widthAnchor.constraint(equalTo: datePickerContainer.widthAnchor, multiplier: 0.9),
            datePicker.heightAnchor.constraint(equalTo: datePickerContainer.heightAnchor, multiplier: 0.9)
        ])
        
        titleTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        personTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        placeTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        tagTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        square.addSubview(cameraIcon)
        square.addSubview(plusIcon)
        
        NSLayoutConstraint.activate([
            
            cameraIcon.centerXAnchor.constraint(equalTo: square.centerXAnchor),
            cameraIcon.centerYAnchor.constraint(equalTo: square.centerYAnchor, constant: -10),
            cameraIcon.widthAnchor.constraint(equalToConstant: 40),
            cameraIcon.heightAnchor.constraint(equalToConstant: 30),
            
            plusIcon.centerXAnchor.constraint(equalTo: square.centerXAnchor),
            plusIcon.centerYAnchor.constraint(equalTo: square.centerYAnchor, constant: 20),
            plusIcon.widthAnchor.constraint(equalToConstant: 20),
            plusIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    //카테고리 버튼
    private func setupButtons() {
        let buttonWidth: CGFloat = 100
        
        for category in buttonCategory {
            let button = UIButton(type: .system)
            button.setTitle(category, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.bold16
            button.backgroundColor = .darkGray
            button.layer.cornerRadius = 10
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            categoryStackView.addArrangedSubview(button)
            
            button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        categoryStackView.distribution = .fillEqually
    }
    
    //모집하기 버튼 클릭 시
    @objc private func submitButtonTapped() {
        let alert = UIAlertController(title: "신청하시겠습니까?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // 날짜/시간 선택할 수 있는 데이트피커
    private func setupDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        datePicker.backgroundColor = .white
        datePicker.layer.shadowColor = UIColor.black.cgColor
        datePicker.layer.shadowOpacity = 0.3
        datePicker.layer.shadowOffset = CGSize(width: 0, height: 2)
        datePicker.layer.shadowRadius = 4
    }
    
    @objc private func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }
}
