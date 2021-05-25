//
//  testTabView.swift
//  IOS_DEV
//
//  Created by Jackson on 7/5/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct testTabView: View {
    var body:some View{
        Home()
    }
}

struct testTabView_Previews: PreviewProvider {
    static var previews: some View {
        testTabView()
    }
}

extension View{
    func getRect()-> CGRect{
        return UIScreen.main.bounds
    }
}

struct Home :View{
    @State private var index = 0
    @State private var data = VideoList
    @State private var value:Float = 0.0
    @State private var isActive = false
    @State private var topIndex = 0
    @State private var navBarHidden = true
    @State private var isloading = true
    var body : some View{
        NavigationView{
            VStack(spacing:0){
                ZStack{
                    NavigationLink(
                        destination: WebImages(navBarHidden: .constant(true), isAction: $isActive,isLoading: $isloading).redacted(reason: self.isloading ? .placeholder : []),
                        isActive: $isActive){
                            ScrollView(.init()){
                                    GeometryReader{proxy in
                                        let screen  = proxy.frame(in: .global)
                                        let offset = screen.minX
                                        TabView(selection: $index){
                                            ForEach(0..<data.count,id:\.self){i in
                                                Group{
                                                    
                                                    ZStack{
                                                        Group(){
                                                            Player(VideoPlayer: data[i].videoPlayer)
                                                                .tag(i)
                                                        }
                                                        .zIndex(-1)
                                                        
                                                        //                                        MovieIntrol(trainer: data[i],isAnimation: .constant(true),isActive: $isActive,navBarHidden: $navBarHidden)
                                                        
                                                        VStack{
                                                            Spacer()
                                                            VideoProgressBar(value: $value, player: $data[i].videoPlayer)
                                                            //   .offset(y:-7)
                                                            
                                                        }
                                                        
                                                        
                                                    }
                                                    .frame(width: screen.width)
                                                    .modifier(VerticalModifier(screen: screen))
                                                }
                                            }
                                            .onChange(of: index, perform: { _ in
                                                //                                        for i in 0..<data.count{
                                                //                                            if i != index{
                                                //                                                data[i].videoPlayer.pause()
                                                //                                                data[i].videoPlayer.seek(to: .zero)
                                                //                                            }
                                                //                                        }
                                                
                                                //    print(screen.minY)
                                                
                                                //                                        data[index].videoPlayer.play()
                                                //                                        data[index].videoPlayer.actionAtItemEnd = .none
                                                //                                        data[index].videoPlayer.addPeriodicTimeObserver(forInterval: .init(seconds: 1.0, preferredTimescale: 1), queue: .main){ _ in
                                                //                                            self.value =
                                                //                                                (Float(data[index].videoPlayer.currentTime().seconds / data[index].videoPlayer.currentItem!.duration.seconds))
                                                //
                                                //                                        }
                                                //
                                                //                                        NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: data[index].videoPlayer.currentItem, queue: .main){ _ in
                                                //                                            data[index].videoReplay = true
                                                //                                            data[index].videoPlayer.seek(to: .zero)
                                                //                                            data[index].videoPlayer.play()
                                                //                                            //                print(trainerList[0].videoPlayer.currentTime().seconds)
                                                //                                        }
                                            })
                                        }
                                        //            .frame(width: UIScreen.main.bounds.height - CGFloat(edge!.top + edge!.bottom))
                                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                        .rotationEffect(.init(degrees: 90.0))
                                        .frame(width: proxy.frame(in:
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    .global).width)
                                        .offset(x:-offset) 
                                    }
                                    .onAppear{
                                        //  print("test Tab appear")
                                        UIScrollView.appearance().bounces = false
                                        UINavigationBar.appearance().barTintColor = UIColor(Color.init("navBarBlack").opacity(0.85))
                                        UINavigationBar.appearance().tintColor = .white
                                        //                    UINavigationBar.appearance().barTintColor = UIColor(Color.init("navBarBlack").opacity(0.85))
                                        //                    UINavigationBar.appearance().tintColor = .white
                                        
                                        data[0].videoPlayer.play()
                                        data[0].videoPlayer.actionAtItemEnd = .none
                                        data[0].videoPlayer.addPeriodicTimeObserver(forInterval: .init(seconds: 1.0, preferredTimescale: 1), queue: .main){ _ in
                                            self.value =
                                                (Float(data[0].videoPlayer.currentTime().seconds / data[0].videoPlayer.currentItem!.duration.seconds))
                                            
                                        }
                                        
                                        NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: data[0].videoPlayer.currentItem, queue: .main){ _ in
                                            data[0].videoReplay = true
                                            data[0].videoPlayer.seek(to: .zero)
                                            data[0].videoPlayer.play()
                                            //                print(trainerList[0].videoPlayer.currentTime().seconds)
                                        }
                                    }
                                
                                    
                                
                                
                            }
                            .ignoresSafeArea(.all)
                    }
                    .navigationTitle("")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                    TopBar(topbar: $topIndex)
                     //   .offset(y:-30)
                        
                    
                }
                //  .edgesIgnoringSafeArea(.all)
                
               // NavBar()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(navBarHidden)
    }
    
//    func loading(){
//        DispatchQueue.main.asyncAfter(deadline:.now() + 3.0){
//            self.isloading = false
//        }
//    }
}

struct VerticalModifier:ViewModifier {
    var screen : CGRect
    func body(content: Content) -> some View {
        return content
            .frame(width:screen.width, height: screen.height)
            .rotationEffect(.init(degrees: -90.0))
            .frame(width: screen.height, height: screen.width)
        
    }
}
