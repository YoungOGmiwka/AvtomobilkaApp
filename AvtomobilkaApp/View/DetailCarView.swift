//
//  DetailCarView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 28.07.2023.
//

import SwiftUI

struct DetailCarView: View {
        
    @ObservedObject var detailCarsViewModel: DetailCarsViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var path: NavigationPath
    
    let carName: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            DetailCarRow(detailCarsViewModel: detailCarsViewModel)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.backward.square")
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(carName)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color("custom"), for: .navigationBar)
    }
}

struct DetailCarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
