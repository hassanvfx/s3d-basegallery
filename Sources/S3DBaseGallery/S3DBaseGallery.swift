
import SwiftUI
import S3DCoreModels
import S3DCoreUI

public struct GalleryView: View {
    public var items = [MediaItem]()
    public var rows: Int = 2 // Number of rows
    public var action:(MediaItem)->Void = { item in }
    public init(items:[MediaItem],rows:Int=2,action:((MediaItem)->Void)?=nil){
        self.items = items
        self.rows = rows
        self.action = action ?? self.action
    }

    var chunkedData: [[MediaItem]] { // Chunked data
        stride(from: 0, to: items.count, by: rows).map {
            Array(items[$0..<min($0+rows, items.count)])
        }
    }

    public var body: some View {
        GeometryReader{ geo in
            ScrollView {
                LazyVStack {
                    ForEach(chunkedData, id: \.self) { chunk in
                        HStack {
                            ForEach(chunk, id: \.self) { item in
                                Button(action:{ action(item)}){
                                    GalleryItemView(title: item.title ?? "item" )
                                        .frame(maxWidth: .infinity)
                                        .frame(height: geo.size.width / CGFloat(rows))
                                        .background(Color.red)
                                }
                            }
                        }
                    }
                }
                .padding(Style.spec.padding * 0.5)
            }
        }
    }
}

struct GalleryItemView: View{
    var title:String
    var body: some View{
//        GeometryReader{ geo in
            Rectangle()
                .fill(.black)
                .overlay(
                    Rectangle()
                    .fill(.white)
                    .padding(Style.spec.padding * 0.5))
                .overlay(Text(title))
//        }
//        .frame(width: UIScreen.main.bounds.width / CGFloat(rows)) // Set a specific width here
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(items: Seed.galleryItems){ item in
            UIApplication.presentAlert(title: "tapped", message: item.title ?? "")
        }
    }
}
