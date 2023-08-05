//
//  PostCarView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 02.08.2023.
//

import SwiftUI
import URLImage

struct PostCarView: View {
    var avatarImage: String
    var userName: String
    var postImage: String
    var datePost: String
    var postText: String
    var likeCounter: Int
    var commentCounter: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                if let imgUrl = avatarImage,
                    let url = URL(string: imgUrl) {
                    URLImage(url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                }
                VStack(alignment: .leading) {
                    Text(userName)
                        .fontWeight(.medium)
                        .font(Font.custom("", size: 18))

                    Text(datePost)
                        .font(Font.custom("", size: 16))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack(alignment: .leading) {
                if let imgUrl = postImage,
                   let url = URL(string: imgUrl) {
                    URLImage(url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 240)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                }
                
                HStack(spacing: 15) {
                    HStack {
                        Image(systemName: "heart")
                            .font(.system(size: 22, weight: .medium))
                        Text(String(likeCounter))
                    }
                    HStack {
                        Image(systemName: "text.bubble")
                            .font(.system(size: 22, weight: .medium))
                        Text(String(commentCounter))
                    }

                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                HStack {
                    Text(postText)
                        .font(Font.custom("", size: 16))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.6))
                        .multilineTextAlignment(.leading)
                }
                .padding([.horizontal, .bottom])
            }
            .padding(.top, 4)
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.4), radius: 10)
        .padding(.all)
    }
}

struct PostCarView_Previews: PreviewProvider {
    static var previews: some View {
        PostCarView(avatarImage: "http://am111.05.testing.place/uploads/user/37/avatars/hkVsjX1d8CUWIfNRLk4Bo29NBMFsAio1sQiKSV5o.jpg",
                    userName: "lexer7",
                    postImage: "http://am111.05.testing.place/uploads/user/37/auto/49/post/528/10a7db341b16c4c57108525613c8dc9d.jpg",
                 datePost: "2019-02-06",
                 postText: "Прогуливаясь по Риге, увидел припаркованный тигуан с запотевшими поворотниками. Так что, это точно не проблема российской сборки)",
                 likeCounter: 8,
                 commentCounter: 1)
    }
}
