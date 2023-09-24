//
//  ContentView.swift
//  DemoApp
//
//  Created by hassan uriostegui on 8/30/22.
//


import SwiftUI
struct GalleryView: View {
    var data = Array(1...20) // Your data
    var rows: Int = 2 // Number of rows

    var chunkedData: [[Int]] { // Chunked data
        stride(from: 0, to: data.count, by: rows).map {
            Array(data[$0..<min($0+rows, data.count)])
        }
    }

    var body: some View {
        GeometryReader{ geo in
            ScrollView {
                LazyVStack {
                    ForEach(chunkedData, id: \.self) { chunk in
                        HStack {
                            ForEach(chunk, id: \.self) { item in
                                GalleryItemView(title: "item \(item)")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: geo.size.width / CGFloat(rows))
                                    .background(Color.red)
                            }
                        }
                    }
                }
                .padding(4)
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
                    .padding(4))
                .overlay(Text(title))
//        }
//        .frame(width: UIScreen.main.bounds.width / CGFloat(rows)) // Set a specific width here
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
