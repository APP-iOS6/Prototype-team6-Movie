
import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    let kboContents: [Contents] = [
        Contents(category: .KBO, location: "서울", image: UIImage(named: "image-19")),
        Contents(category: .KBO, location: "대전", image: UIImage(named: "image-20")),
        Contents(category: .KBO, location: "광주", image: UIImage(named: "image-22")),
        Contents(category: .KBO, location: "서울", image: UIImage(named: "image-23")),
        Contents(category: .KBO, location: "대전", image: UIImage(named: "image-24")),
        Contents(category: .KBO, location: "광주", image: UIImage(named: "image-25"))
    ]
    
    let movieContents: [Contents] = [
        Contents(category: .Movie, location: "서울", image: UIImage(named: "image-1")),
        Contents(category: .Movie, location: "대전", image: UIImage(named: "image-2")),
        Contents(category: .Movie, location: "광주", image: UIImage(named: "image-3")),
        Contents(category: .Movie, location: "광주", image: UIImage(named: "image-4")),
        Contents(category: .Movie, location: "광주", image: UIImage(named: "image-5")),
        Contents(category: .Movie, location: "광주", image: UIImage(named: "image-6"))
    ]
    
    let concertContents: [Contents] = [
        Contents(category: .Concert, location: "서울", image: UIImage(named: "image-7")),
        Contents(category: .Concert, location: "서울", image: UIImage(named: "image-8")),
        Contents(category: .Concert, location: "서울", image: UIImage(named: "image-9")),
        Contents(category: .Concert, location: "서울", image: UIImage(named: "image-10")),
        Contents(category: .Concert, location: "서울", image: UIImage(named: "image-11")),
        Contents(category: .Concert, location: "서울", image: UIImage(named: "image-12"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        self.title = "모두의 씨네"
        
        // 네비게이션 타이틀 색상 설정
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainColor() // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 타이틀 텍스트 색상
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        setupScrollView()
        setupStackView()
        
        // 콘텐츠 뷰 추가
        let kboView = ContentsView(contents: kboContents)
        let movieView = ContentsView(contents: movieContents)
        let concertView = ContentsView(contents: concertContents)
        
        stackView.addArrangedSubview(kboView)
        stackView.addArrangedSubview(movieView)
        stackView.addArrangedSubview(concertView)
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor), // safeAreaLayoutGuide 대신 view의 topAnchor
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // 스크롤뷰의 너비와 동일하게 설정
        ])
    }
}
