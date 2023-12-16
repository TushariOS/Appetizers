//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import SwiftUI
import Foundation

final class ImageLoader: ObservableObject {

    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(formString: urlString) { uiimgae in
            guard let uiimage = uiimgae else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("mint-tea").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
