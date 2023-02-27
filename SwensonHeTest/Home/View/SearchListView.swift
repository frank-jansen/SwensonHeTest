//
//  SearchListView.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 8/2/23.
//

import SwiftUI

struct SearchListView: View {
    @Binding var selected: String
    var locations: [Location]
    
    var body: some View {
        List(locations, id: \.self) { location in
            Text("\(format(city: location.name)) - \(format(region:location.region))")
                .listRowSeparator(.hidden)
//                .background(.green)
                .onTapGesture {
                    selected = location.name
                }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .frame(maxWidth: 300, maxHeight: 230, alignment: .center)
    }
    
    func format(city: String) -> AttributedString {
        var attributed = AttributedString(city)
        attributed.font = .subheadline.weight(.medium)
        
        return attributed
    }
    func format(region: String) -> AttributedString {
        var attributed = AttributedString(region)
        attributed.font = .subheadline.weight(.bold)
        
        return attributed
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(selected: Binding<String>(
            get: {
                "preview value"
            }, set: { _, _ in
            }), locations: [Location(name: "name", region: "CA", country: "Gringo", localtime: 1677510790)]
        )
    }
}
