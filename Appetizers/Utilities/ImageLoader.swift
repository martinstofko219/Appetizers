//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func loadImage(fromURLString urlString: String) {
        NetworkManager.shared.getAppetizerImage(fromURLString: urlString) { uiImage in
            guard let image = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("AppetizerPlaceholder").resizable()
    }
}

struct AppetizerImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.loadImage(fromURLString: urlString)
            }
    }
}
