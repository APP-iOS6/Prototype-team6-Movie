import UIKit

let buttonCategory = ["KBO", "콘서트", "영화", "스포츠", "애니메이션"]

class RecruitmentViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.title = "모집"
        
        view.backgroundColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        

        tableView.backgroundColor = UIColor.darkGray
        
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        
        tableView.register(PartyCell.self, forCellReuseIdentifier: "PartyCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
            return 100
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
            stackView.addArrangedSubview(button)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])

        
        contentView.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("!ERROR!")
    }
}

// MARK: - PartyCell
class PartyCell: UITableViewCell {
    
    let partyImageView: UIImageView
    let mainLabel: UILabel
    let subLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        partyImageView = UIImageView()
        mainLabel = UILabel()
        subLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        partyImageView.contentMode = .scaleAspectFill
        partyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mainLabel.numberOfLines = 1
        mainLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
        mainLabel.textColor = .white
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subLabel.numberOfLines = 0
        subLabel.font = UIFont(name: "Pretendard-Regular", size: 5)
        subLabel.textColor = .white
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(partyImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(subLabel)
        
        NSLayoutConstraint.activate([
            partyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            partyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            partyImageView.widthAnchor.constraint(equalToConstant: 100),
            partyImageView.heightAnchor.constraint(equalToConstant: 100),
            
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainLabel.leadingAnchor.constraint(equalTo: partyImageView.trailingAnchor, constant: 10),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5),
            subLabel.leadingAnchor.constraint(equalTo: partyImageView.trailingAnchor, constant: 10),
            subLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        contentView.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("!ERROR!")
    }
}


