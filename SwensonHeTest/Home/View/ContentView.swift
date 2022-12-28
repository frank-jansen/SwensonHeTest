//
//  ContentView.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 27/12/2022.
//

import SwiftUI

struct ContentView: View {
    let viewModel = HomeViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: viewModel.getForecast)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
