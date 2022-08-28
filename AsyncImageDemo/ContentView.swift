//
//  ContentView.swift
//  AsyncImageDemo
//
//  Created by Davide Troise with Swift 5.0
//  for the YouTube channel "Coding con Davide" https://bit.ly/3QJziJE
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: "https://picsum.photos/600")) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.2)
                    .overlay(ProgressView())
            }
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            
            AsyncImage(url: URL(string: "https://picsum.photos/600")) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Color.gray.opacity(0.2)
                        .overlay(Text("Error loading..."))
                        .foregroundColor(.secondary)
                } else {
                    Color.gray.opacity(0.2)
                        .overlay(ProgressView())
                }
            }
            .frame(width: 300, height: 300)
            .clipShape(Circle())
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
