//
//  ContentView.swift
//  InstagramHomeSwiftUI
//
//  Created by Sean on 2019/10/20.
//  Copyright © 2019 Sean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let posts = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                List {
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach((1...10), id: \.self) { _ in
                                    Image("pubby")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 60, height: 60)
                                }
                            }
                        }.frame(height: 80)
                            .clipped()
                        ForEach(self.posts, id: \.self) {_ in
                            PostView(screenWidth: geometry.size.width)
                        }
                    }.navigationBarTitle(Text("Instagram"), displayMode: .inline)
                        .navigationBarItems(leading: Button(action: {
                            print(123)
                        }, label: {
                            Image("camera")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }), trailing: Button(action: {
                            print(456)
                        }, label: {
                            Image("send")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }))
                }
            }
    }
}

struct PostView: View {
    let screenWidth: CGFloat
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image("profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .clipped()
                    Text("lovely shiba").font(.headline)
                        .padding(.leading, 8)
                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                Image("postImage1")
                    .resizable()
                    .frame(width: screenWidth, height: 250)
                    .clipped()
                Text("Post body message here Post body message here Post body message here Post body message here")
                    .lineLimit(nil)
                    .font(.system(size: 15))
                    .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
            }.listRowInsets(EdgeInsets())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
