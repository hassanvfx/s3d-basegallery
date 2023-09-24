# BaseGallery
![Demo](https://github.com/hassanvfx/s3d-basegallery/assets/425926/d49f4376-4883-4df9-98ef-e40cb1657c89)


This repository is part of a larger demo project called the [Simple3D Viewer](https://github.com/hassanvfx/simple3DViewer). 

The BaseGallery module links the CoreUI and CoreModels to create a gallery view. This module requires an array of CoreModel.MediaItem structs to be displayed within the gallery and an action closure. When a user taps on an element, the action closure is executed, passing the selected element and effectively delegating to the application coordinator to push the corresponding viewer.

## Sample Implementation

```swift
import SwiftUI
import S3DBaseGallery
import S3DCoreModels

@main
struct DemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            GalleryView(items: Seed.galleryItems, rows: 2){ item in
                UIApplication.presentAlert(title: "tapped", message: item.title ?? "")
            }
        }
    }
}
```

**Note:** While more sophisticated galleries represent a UICollectionView like the widely used ASCollectionView, for this implementation we chose a simple LazyVStack and ScrollView.

This framework was built with the [ios-framework config tool](https://github.com/hassanvfx/ios-framework).
