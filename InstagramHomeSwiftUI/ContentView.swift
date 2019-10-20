//
//  ContentView.swift
//  InstagramHomeSwiftUI
//
//  Created by Sean on 2019/10/20.
//  Copyright © 2019 Sean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
