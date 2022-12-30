//
//  HomeView.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 27/12/2022.
//

import SwiftUI

struct HomeView: View {
    let viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            background
            gradient
            
            VStack {
                searchBar
                header
            }
            .padding()
        }
        .onAppear(perform: viewModel.getForecast)
    }
    
    var background: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    var gradient: some View {
        LinearGradient(gradient:
                        Gradient(colors: [Color("gradientblue100"),
                                                   Color("gradientblue80"),
                                                   Color("gradientblue100")]),
                       startPoint: .leading,
                       endPoint: .trailing)
    }
    
    var searchBar: some View {
        HStack {
            Spacer()
            
            Button {
                
            } label: {
                Image("search")
            }
        }
    }
    
    var header: some View {
        VStack(spacing: 4) {
            Text("San Francisco")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
            
            Text("Tuesday, 12 Apr 2022")
                .fontWeight(.regular)
                .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewInterfaceOrientation(.landscapeRight)
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
        }
    }
}
