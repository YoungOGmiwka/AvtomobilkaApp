//
//  HomeView.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = CarsViewModel()
    
    @State private var path = NavigationPath()

    var body: some View {
        
        NavigationStack(path: $path) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(vm.cars, id: \.id) { item in
                        NavigationLink {
                            DetailCarView(path: $path)
                        } label: {
                            CarRowView(car: item)
                                .foregroundColor(.black)

                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)

            }
            .onAppear(perform: vm.fetchCars)

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

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
////    formatter.timeStyle = .medium
//    return formatter
//}()
        

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//List {
//    ForEach(items) { item in
//        NavigationLink {
//            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//        } label: {
//            Text(item.timestamp!, formatter: itemFormatter)
//        }
//    }
//    .onDelete(perform: deleteItems)
//}
