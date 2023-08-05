//
//  DetailCarRow.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 31.07.2023.
//

import SwiftUI
import URLImage

struct DetailCarRow: View {
    
    @ObservedObject var detailCarsViewModel: DetailCarsViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    if let imageUrl = detailCarsViewModel.car?.user.avatar.url,
                       let urlStringAvatar = URL(string: imageUrl) {
                        URLImage(urlStringAvatar) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 10)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(detailCarsViewModel.car?.user.username ?? "")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.bold)
                            .font(Font.custom("", size: 26))
                        HStack(spacing: 2){
                            Image(systemName: "clock")
                                .font(.system(size: 16, weight: .light))
                                .foregroundColor(.gray)
                            Text("Был в сети: Недавно")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "envelope")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.gray)
                    Text(detailCarsViewModel.car?.user.email ?? "")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                
                if let imgUrl = detailCarsViewModel.car?.detailCar.images.first?.url ?? "",
                   let urlStringCar = URL(string: imgUrl) {
                    URLImage(urlStringCar) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 240)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Машина")
                            .fontWeight(.medium)
                            .font(Font.custom("", size: 20))
                        HStack {
                            Text(detailCarsViewModel.car?.detailCar.brandName ?? "")
                                .multilineTextAlignment(.leading)
                                .fontWeight(.medium)
                                .font(Font.custom("", size: 18))
                                .foregroundColor(.black.opacity(0.65))
                            
                            Text(detailCarsViewModel.car?.detailCar.modelName ?? "")
                                .multilineTextAlignment(.leading)
                                .fontWeight(.medium)
                                .font(Font.custom("", size: 18))
                                .foregroundColor(.black.opacity(0.65))
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Характеристики")
                            .fontWeight(.medium)
                            .font(Font.custom("", size: 20))
                        HStack {
                            Text(detailCarsViewModel.car?.detailCar.engine ?? "")
                                .font(Font.custom("", size: 18))
                                .kerning(0.14)
                                .foregroundColor(.black.opacity(0.65))
                                .multilineTextAlignment(.leading)
                            Text(detailCarsViewModel.car?.detailCar.transmissionName ?? "")
                                .font(Font.custom("", size: 18))
                                .kerning(0.14)
                                .foregroundColor(.black.opacity(0.65))
                                .multilineTextAlignment(.leading)
                            Text(detailCarsViewModel.car?.detailCar.year .codingKey.stringValue ?? "")
                                .font(Font.custom("", size: 18))
                                .kerning(0.14)
                                .foregroundColor(.black.opacity(0.65))
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .shadow(color: Color.black.opacity(0.1), radius: 20)
    }
}

struct DetailCarRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
