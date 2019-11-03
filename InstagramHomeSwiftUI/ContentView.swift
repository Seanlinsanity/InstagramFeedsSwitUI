//
//  ContentView.swift
//  InstagramHomeSwiftUI
//
//  Created by Sean on 2019/10/20.
//  Copyright © 2019 Sean. All rights reserved.
//

import SwiftUI

struct Post {
    let id: Int
    let userName, text, profileImageName, imageName: String
}

struct Story {
    let id: Int
    let imageName: String
}

struct ContentView: View {
    let posts: [Post] = [
        Post(id: 0, userName: "dogstagram", text: "Hanging out with cute dog in the park😍 \nDo you think I’m cute?🐶 Thumbs up if you think I am cute!💞", profileImageName: "profile", imageName: "postImage"),
        Post(id: 1, userName: "lovely_pubby", text: "Sunday mooood 🌙", profileImageName: "profile1", imageName: "postImage1"),
        Post(id: 2, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "profile2", imageName: "postImage2")
    ]
    
    let stories: [Story] = [
        Story(id: 0, imageName: "storyImage"),
        Story(id: 1, imageName: "storyImage1"),
        Story(id: 2, imageName: "storyImage2"),
        Story(id: 3, imageName: "storyImage3"),
        Story(id: 4, imageName: "storyImage4"),
        Story(id: 5, imageName: "storyImage5")
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                List {
                        ScrollView(.horizontal, showsIndicators: false) {
                            StoryView(stories: self.stories)
                        }.frame(height: 76).clipped()
                        ForEach(self.posts, id: \.id) {(post) in
                            PostView(post: post,screenWidth: geometry.size.width)
                        }
                    }.navigationBarTitle(Text("Instagram"), displayMode: .inline)
                        .navigationBarItems(leading: Button(action: {
                            print("click camera button...")
                        }, label: {
                            Image("camera")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }), trailing: Button(action: {
                            print("click send message button")
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
    let post: Post
    let screenWidth: CGFloat
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(post.profileImageName)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .clipped()
                    Text(post.userName).font(.headline)
                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                Image(post.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth, height: 250)
                    .clipped()
                Text(post.text)
                    .lineLimit(nil)
                    .font(.system(size: 15))
                    .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
            }.listRowInsets(EdgeInsets())
    }
}

struct StoryView: View {
    let stories: [Story]
    var body: some View {
        HStack {
            ForEach(stories, id: \.id) { (story) in
                ZStack {
                    Circle()
                        .fill(Color.init(red: 193/255, green: 53/255, blue: 132/255))
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    Circle()
                        .fill(Color.white)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                    Image(story.imageName)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
