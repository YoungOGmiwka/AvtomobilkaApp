//
//  ContentView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 26.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                VStack {
                    Image("home").renderingMode(.template)
                    Text("Главная")
                        .font(
                            Font.custom("SF Pro Display", size: 10)
                            .weight(.medium))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
