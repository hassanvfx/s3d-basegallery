//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by hassan uriostegui on 8/30/22.
//

import SwiftUI
import S3DBaseGallery
import S3DCoreModels

@main
struct DemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            GalleryView(items: Seed.galleryItems){ item in
                UIApplication.presentAlert(title: "tapped", message: item.title ?? "")
            }
        }
    }
}
