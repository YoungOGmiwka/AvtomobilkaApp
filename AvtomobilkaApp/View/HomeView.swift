//
//  HomeView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var carsViewModel = CarsViewModel()
    @StateObject var detailCarsViewModel = DetailCarsViewModel()
    @StateObject var postCarViewModel = PostViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(carsViewModel.cars, id: \.id) { item in
                        NavigationLink {
                            DetailCarView(detailCarsViewModel: detailCarsViewModel, postCarViewModel: postCarViewModel, path: $path, carName: item.name)
                                .onAppear { detailCarsViewModel.fetchDetailCarInfo(carID: item.id)
                                    postCarViewModel.fetchPostInfo(carID: item.id)
                                }
                            
                        } label: {
                            CarRowView(car: item)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
            }
            .onAppear(perform: carsViewModel.fetchCars)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("car")
                            .resizable()
                            .frame(width: 50, height: 50)

                        Text("Avtomobilka")
                            .font(Font.custom("SF Pro Display", size: 24)
                                .weight(.bold))
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("custom"), for: .navigationBar)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
