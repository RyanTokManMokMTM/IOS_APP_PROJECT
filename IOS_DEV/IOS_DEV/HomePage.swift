//
//  HomePage.swift
//  IOS_DEV
//
//  Created by Jackson on 29/3/2021.
//

import SwiftUI

struct HomePage: View {
    @State private var topbar = 0
    @State private var data = VideoList
    var body: some View {
        ZStack{
            
            PlayerScrollView(trainer: self.$data)
            VStack{
                HStack(spacing:15){
                    Button(action:{
                        //TODO:Show Trainer view
                        //change to selected : 0
                        self.topbar = 0
                    }){
                        Text("Following")
                            .font(.system(size: 20))
                            .foregroundColor(self.topbar == 0 ? .white : Color.white.opacity(0.75))
                            .fontWeight(self.topbar == 0 ? .bold : .none)
                            .padding(.vertical)
                        
                    }
                    
                    Button(action:{
                        //TODO:Show Movie Card View
                        //change to selected : 1
                        self.topbar = 1
                    }){
                        Text("For You")
                            .font(.system(size: 20))
                            .foregroundColor(self.topbar == 1 ? .white : Color.white.opacity(0.75))
                            .fontWeight(self.topbar == 1 ? .bold : .none)
                            .padding(.vertical)
                    }
                }
                
                Spacer()
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,(UIApplication.shared.windows.first?.safeAreaInsets.bottom)!+7)
        }
        .edgesIgnoringSafeArea(.all)
        
       
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            HomePage()
        }

    }
}



//FOR ALL DATA IN TRAINER LIST
struct PlayerView:View{
    
    @Binding var trainerList:[Traier]
    
    var body:some View{
        VStack(spacing:0){
            ForEach(0..<trainerList.count){ i in
                Player(VideoPlayer: trainerList[i].videoPlayer)
                //for each trainer ->need a full screen
                    .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                    .offset(y:-7)
            }
        }
        .onAppear(perform: {
            trainerList[0].videoPlayer.play()
            trainerList[0].videoPlayer.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: trainerList[0].videoPlayer.currentItem, queue: .main){ _ in
                trainerList[0].videoReplay = true
            }
        })
    }
}
