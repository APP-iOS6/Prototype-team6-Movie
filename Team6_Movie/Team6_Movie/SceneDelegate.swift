//
//  SceneDelegate.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/26/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let loginVC = LoginViewController()
        
        let recruitmentViewController = RecruitmentViewController()
        let myPageViewController = MyPageViewController()
        let searchViewController = SearchViewController()
        let homeViewController = HomeViewController()
        
        let recruitmentNavController = UINavigationController(rootViewController: recruitmentViewController)
        let myPageNavController = UINavigationController(rootViewController: myPageViewController)
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        searchViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        recruitmentViewController.tabBarItem = UITabBarItem(title: "모집", image: UIImage(systemName: "person.3"), tag: 2)
        myPageViewController.tabBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(systemName: "person"), tag: 3)
        
        // 4. 탭바 컨트롤러를 생성하고 네비게이션 컨트롤러들을 추가합니다.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNavController, searchNavController, recruitmentNavController, myPageNavController]
        

        // 탭바 외관 설정
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명 배경 설정
        appearance.backgroundColor = .mainColor() // 탭바 배경색 설정
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        
        tabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        
        
        // 5. 윈도우를 생성하고 루트 뷰 컨트롤러로 설정합니다.
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

