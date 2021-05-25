//
//  TrailerPreview.swift
//  IOS_DEV
//
//  Created by Jackson on 14/5/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct TrailerPreview: View {
    @State private var isPlayerTrailer = false
    var body: some View {
        ZStack(alignment:.bottom){
            ZStack(alignment:.center){
                TrailerCard()
                  //  .blur(radius: 1.5)
                    .shadow(color: .gray, radius: 2)
                
                Button(action:{
                    self.isPlayerTrailer.toggle()
                }){
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }

                
            }

            VStack{
                HStack{
                    Text("trilerName")
                    
                    Spacer()
                    
                    Text("1:30")
                    
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
        }
        .padding()
        .foregroundColor(.white)
        .fullScreenCover(isPresented: $isPlayerTrailer, content: {
            TrailerPlayer(player: AVPlayer(url: URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!))
                .edgesIgnoringSafeArea(.all)
        })

           
    }
}

struct TrailerPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            TrailerPreview()
            
        }
    }
}

struct TrailerCard:View{
    var body: some View{
        WebImage(url: URL(string: "https://www.themoviedb.org/t/p/original/fPGeS6jgdLovQAKunNHX8l0avCy.jpg"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxHeight:200)
            .cornerRadius(5)
            
           
            



    }
}

