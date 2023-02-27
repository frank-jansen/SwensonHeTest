//
//  LocationNameView.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 17/2/23.
//

import SwiftUI

struct LocationNameView: View {
    let location: Location
    
    var body: some View {
        VStack(spacing: 10){
            Text(location.name)
                .font(.system(size: 32))
                .fontWeight(.bold)
                .lineSpacing(2.5)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
               
            
            Text(location.localtime?.dateFullFormat ?? "")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .lineSpacing(1.1)
                .multilineTextAlignment(.center) 
                .foregroundColor(.white)
                
                
        }
    }
}

