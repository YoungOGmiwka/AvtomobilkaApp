//
//  CarRowView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import SwiftUI
import URLImage

struct CarRowView: View {
    
    let car: CarList

    var body: some View {
        ZStack {
            VStack {
                if let imgUrl = car.imageURL.replacingOccurrences(of: "\"", with: ""),
                   let url = URL(string: imgUrl) {
                    URLImage(url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 320, height: 240)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(car.name)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(height: 40)
                .padding(.bottom, 7)

            }

            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 20)
        }
    }
}

struct CarRowView_Previews: PreviewProvider {
    static var previews: some View {
        CarRowView(car: CarList.dummyData)
    }
}
