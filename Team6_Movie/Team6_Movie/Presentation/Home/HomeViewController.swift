
import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    
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
        
        for contentsView in [kboView, movieView, concertView] {
            contentsView.onItemSelected = {[weak self] content in
                self?.showDetailViewController(for: content)
            }
        }
        
        stackView.addArrangedSubview(kboView)
        stackView.addArrangedSubview(movieView)
        stackView.addArrangedSubview(concertView)
    }
    
    private func showDetailViewController(for content: Contents) {
        let detailVC = DetailViewController()
        detailVC.setContent(content)
        navigationController?.pushViewController(detailVC, animated: true)
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
