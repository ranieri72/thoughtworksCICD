//
//  MainCoordinator.swift
//  iOSTestProject
//
//  Created by ranieri.f.aguiar on 23/09/20.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import UIKit
import SwiftUI

class MainCoordinator {

    private var window: UIWindow?
    private var scene: UIScene

    init(window: inout UIWindow?, scene: UIScene) {
        self.window = window
        self.scene = scene
    }

    func start() {
        let contentView = ContentView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
