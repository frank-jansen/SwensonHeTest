//
//  SearchBar.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 23/2/23.
//

import SwiftUI

public struct SearchBar: View {
    
    @StateObject var searchViewModel = SearchViewModel()
    @Binding var selectectText: String
    @State private var showInput = false
    @State var searchPlaces = ""
    
    public var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                HStack {
                    if showInput {
                        input
                    }
                    Button {
                        showInput.toggle()
                    } label: {
                        if showInput == true {
                            Image("Full Arrow Left")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                            
                        } else {
                            Image("search")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .padding(.trailing, geometry.size.width*0.0826)
//                .padding(.top, geometry.size.height*0.048)
                
            }
        }
        .onChange(of: searchPlaces) { _ in searchViewModel.getSearchList(searching: searchPlaces)}
    }
    
    var input: some View {
        VStack {
            TextField("Search", text: $searchPlaces)
                .frame(width: 300)
                .padding(10)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            if let searching = searchViewModel.searchResponse {
                SearchListView(selected: $selectectText, locations: searching)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(selectectText: Binding<String>(
            get: {
                "a value"
            }, set: { _, _ in
                
            })
        )
    }
}

