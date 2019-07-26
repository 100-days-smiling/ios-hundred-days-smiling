//
//  CameraContainer.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 16/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class CameraContainer {
    
    private static let CameraKey = "Camera"
    
    func setupContainer(with container: Container) {
        container.register(SwinjectStoryboard.self, name: CameraContainer.CameraKey) { _ -> SwinjectStoryboard in
            return SwinjectStoryboard.create(name: CameraContainer.CameraKey, bundle: nil, container: container)
        }
        
        container.register(CameraViewController.self) { resolver -> CameraViewController in
            let storyboard = resolver.resolve(SwinjectStoryboard.self, name: CameraContainer.CameraKey)
            return (storyboard?.instantiateInitialViewController() as? CameraViewController)!
        }.initCompleted { resolver, cameraView in
            cameraView.router = resolver.resolve(CameraRouterProtocol.self)
        }
        
        container.register(CameraRouterProtocol.self) { resolver -> CameraRouterProtocol in
            let cameraViewController = resolver.resolve(CameraViewController.self)!
            let shareViewController = resolver.resolve(ShareViewController.self)!
            return CameraRouter(view: cameraViewController, share: shareViewController)
        }
        
        ShareContainer().setupContainer(with: container)
    }
}
