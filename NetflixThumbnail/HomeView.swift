//
//  HomeView.swift
//  NetflixThumbnail
//
//  Created by GO on 9/5/24.
//  https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/

import SwiftUI

struct HomeView: View {
    
    @State var bigBanner: String = ""
    @State var dramas : [Drama] = []
    
    var body: some View {
        ScrollView {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
            }
            AsyncImage(url: URL(string: bigBanner)) { image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 525)
                
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .frame(width: 300, height:525)
                    .opacity(0.4)
                    .overlay(
                        ProgressView()
                            .tint(Color.white)
                    )
            }
            .overlay(alignment: .bottom) {
                HStack {
                    Button(action: {
                        print("재생버튼 클릭")
                    }, label: {
                        Image(systemName: "play.fill")
                    })
                    .buttonStyle(.bordered)
                    
                    Button(action: {
                        print("Info버튼 클릭")
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(.bordered)
                }
                .padding()
            }
            
            if dramas.count == 0 {
                ProgressView()
                    .tint(Color.white)
                    .padding()
                    .task {
                        let url = URL(string:"https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")!
                        
                        let (data, _) = try! await URLSession.shared.data(from: url)
                        
                        let decoder = JSONDecoder()
                        let dramaCollection = try! decoder.decode(DramaCollection.self, from: data)
                        
                        bigBanner = dramaCollection.bigBanner
                        dramas = dramaCollection.dramas
                    }
            } else  {
                ForEach(dramas, id: \.categoryTitle) { drama
                    in
                    VStack(alignment: .leading) {
                        Text(drama.categoryTitle)
                            .font(.title)
                        
                        ScrollView(.horizontal) {
                            HStack (spacing: 20){
                                ForEach(drama.posters, id: \.self) { posterUrlString in
                                    let url = URL(string: posterUrlString)
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 175)
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                }
                
            }
        }
        .background(.black)
        .foregroundStyle(.white)
        
    }
}

#Preview {
    HomeView()
}
