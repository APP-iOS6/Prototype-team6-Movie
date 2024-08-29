
import UIKit

class HomeViewController: BaseViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        self.title = "홈"
    
        let imageView = UIImageView(image: UIImage(named: "icon"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        setupScrollView()
        setupStackView()
        
        let kboView = ContentsView(contents: kboContents)
        let movieView = ContentsView(contents: movieContents)
        let concertView = ContentsView(contents: concertContents)
        let kbo2View = ContentsView(contents: kboContents)
        
        for contentsView in [kboView, movieView, concertView, kbo2View] {
            contentsView.onItemSelected = {[weak self] content in
                self?.showDetailViewController(for: content)
            }
            contentsView.onTitleButtonTapped = {[weak self] category in
                self?.showCategoryViewController(for: category)
            }
        }
        stackView.addArrangedSubviews(kboView, movieView, concertView, kbo2View)
        
    }
    
    private func showCategoryViewController(for category: ContentCategory) {
        
        let detailVC = CategoryContentsViewController()
        detailVC.setCategory(category)
        navigationController?.pushViewController(detailVC, animated: true)
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
        stackView.spacing = 20
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
