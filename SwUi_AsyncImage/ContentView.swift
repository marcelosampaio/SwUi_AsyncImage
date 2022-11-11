//
//  ContentView.swift
//  SwUi_AsyncImage
//
//  Created by Marcelo Sampaio on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://blckbirds.com/wp-content/uploads/2021/10/pexels-kammeran-gonzalezkeola-6128227-2.jpg"), transaction: .init(animation: .spring(response: 1.6))) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                Text("Failed fetching image. Make sure to check your data connection and try again.")
                    .foregroundColor(.red)
            @unknown default:
                Text("Unknown error. Please try again.")
                    .foregroundColor(.red)
            }
        }
            .frame(height: 240)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
