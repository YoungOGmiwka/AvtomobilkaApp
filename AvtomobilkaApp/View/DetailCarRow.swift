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
                if let imgUrl = detailCarsViewModel.detailCars?.car.images.first?.url,
                   let urlStringCar = URL(string: imgUrl) {
                    URLImage(urlStringCar) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 320, height: 240)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(detailCarsViewModel.detailCars?.car.brandName ?? "")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.medium)
                            .font(Font.custom("", size: 20))
                        
                        Text(detailCarsViewModel.detailCars?.car.modelName ?? "")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.medium)
                            .font(Font.custom("", size: 20))
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text(detailCarsViewModel.detailCars?.car.engine ?? "")
                            .font(Font.custom("", size: 16))
                            .kerning(0.14)
                            .foregroundColor(.black.opacity(0.65))
                            .multilineTextAlignment(.leading)
                        Text(detailCarsViewModel.detailCars?.car.transmissionName ?? "")
                            .font(Font.custom("", size: 16))
                            .kerning(0.14)
                            .foregroundColor(.black.opacity(0.65))
                            .multilineTextAlignment(.leading)
                        Text(detailCarsViewModel.detailCars?.car.year.codingKey.stringValue ?? "")
                            .font(Font.custom("", size: 16))
                            .kerning(0.14)
                            .foregroundColor(.black.opacity(0.65))
                            .multilineTextAlignment(.leading)
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        if let imageUrl = detailCarsViewModel.detailCars?.user.avatar.url,
                           let urlStringAvatar = URL(string: imageUrl) {
                            URLImage(urlStringAvatar) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 48, height: 48)
                                    .clipped()
                            }
                        }
                        
                        Text(detailCarsViewModel.detailCars?.user.username ?? "")
                            .multilineTextAlignment(.leading)
                            .fontWeight(.medium)
                            .font(Font.custom("", size: 22))
                    }
                    .padding(.horizontal)
                    
                }
                .frame(height: 120)
                .padding(.top, 7)

            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 20)
    }
}

struct DetailCarRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
