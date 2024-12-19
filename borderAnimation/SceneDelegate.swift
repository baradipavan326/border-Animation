//
//  SceneDelegate.swift
//  borderAnimation
//
//  Created by Baradi Pavan on 08/12/24.
//

import UIKit
import SwiftUI

@UIApplicationMain
class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window

            let vc = UIHostingController(rootView: BorderAnimation())
            window.rootViewController = vc

            window.makeKeyAndVisible()

        }
    }
}

