import UIKit


class RecruitmentViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let writeButton = UIButton(type: .system)
    
    //뷰 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //정원님 코드 가져오기...감사합니다..
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainColor()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.title = "모집"
        
        view.backgroundColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .mainColor()
        
        //테이블뷰 셀 세팅
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        
        tableView.register(PartyCell.self, forCellReuseIdentifier: "PartyCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        //글쓰기 버튼
        writeButton.setTitle("+ 모집", for: .normal)
        writeButton.setTitleColor(.white, for: .normal)
        writeButton.titleLabel?.font = UIFont.bold20
        
        writeButton.backgroundColor = .darkGray
        writeButton.layer.cornerRadius = 20
        writeButton.layer.shadowColor = UIColor.black.cgColor
        writeButton.layer.shadowOpacity = 0.5
        writeButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        writeButton.addTarget(self, action: #selector(writeButtonAction), for: .touchUpInside)
        
        writeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(writeButton)
        
        //뷰-글쓰기버튼
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            writeButton.widthAnchor.constraint(equalToConstant: 90),
            writeButton.heightAnchor.constraint(equalToConstant: 50),
            writeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            writeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    // "+ 모집" 버튼 클릭 시 writevc로 이동
    @objc func writeButtonAction() {
        let writevc = WriteViewController()
        navigationController?.pushViewController(writevc, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension RecruitmentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            
            return partys.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as! PartyCell
            let party = partys[indexPath.row]
            cell.imageView?.image = UIImage(named: party.imageFileName)
            cell.mainLabel.text = party.mainText
            cell.subLabel.text = party.subText
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 120
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //footer(아래에 선) 생기는 문제 해결
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
}

// MARK: - CategoryCell
// 카테고리 버튼 목록
class CategoryCell: UITableViewCell {
    
    let stackView: UIStackView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        stackView = UIStackView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
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
            
            
            stackView.addArrangedSubview(button)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        contentView.backgroundColor = .mainColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("!ERROR!")
    }
}

// MARK: - PartyCell
// 모집 글 목록
class PartyCell: UITableViewCell {
    
    //포스터, 제목, 세부사항, 구분선
    let partyImageView: UIImageView
    let mainLabel: UILabel
    let subLabel: UILabel
    let line: UIView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        partyImageView = UIImageView()
        mainLabel = UILabel()
        subLabel = UILabel()
        line = UIView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        partyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mainLabel.numberOfLines = 1
        mainLabel.font = UIFont.bold20
        mainLabel.textColor = .white
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.regular12
        subLabel.textColor = .white
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(partyImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(subLabel)
        contentView.addSubview(line)
        
        NSLayoutConstraint.activate([
            partyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20),
            partyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            partyImageView.widthAnchor.constraint(equalToConstant: 80),
            partyImageView.heightAnchor.constraint(equalToConstant: 80),
            
            mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -30),
            mainLabel.leadingAnchor.constraint(equalTo: partyImageView.trailingAnchor, constant: 10),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5),
            subLabel.leadingAnchor.constraint(equalTo: partyImageView.trailingAnchor, constant: 10),
            subLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
        ])
        
        contentView.backgroundColor = .mainColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("!ERROR!")
    }
}

#Preview {
    RecruitmentViewController()
}

