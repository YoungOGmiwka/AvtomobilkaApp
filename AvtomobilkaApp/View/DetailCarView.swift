//
//  DetailCarView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 28.07.2023.
//

import SwiftUI

struct DetailCarView: View {
        
    @ObservedObject var detailCarsViewModel: DetailCarsViewModel
    @ObservedObject var postCarViewModel: PostViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var path: NavigationPath
    
    let carName: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            DetailCarRow(detailCarsViewModel: detailCarsViewModel)
            LazyVStack {
                if let carPosts = postCarViewModel.carPost {
                    ForEach(carPosts) { item in
                        PostCarView(avatarImage: item.author.avatar.url,
                                    userName: item.author.username,
                                    postImage: item.postImage ?? "",
                                    datePost: item.correctDate ?? item.createdAt,
                                    postText: item.text,
                                    likeCounter: item.likeCount,
                                    commentCounter: item.commentCount)
                    }
                }
            }
            .padding(.top)
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
