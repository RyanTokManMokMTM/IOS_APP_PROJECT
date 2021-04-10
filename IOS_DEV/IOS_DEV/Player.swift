//
//  Player.swift
//  IOS_DEV
//
//  Created by Jackson on 8/4/2021.
//

import Foundation
import SwiftUI
import AVKit

//let AVPlayerController to SWiftUI
struct Player:UIViewControllerRepresentable{
    var VideoPlayer:AVPlayer
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerview = AVPlayerViewController()
        playerview.player = VideoPlayer
        playerview.showsPlaybackControls = false 
        playerview.videoGravity = .resizeAspectFill
        return playerview
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        //What to do if view is updated
        //workcall ,coz nothing will be updated
    }
}

struct PlayerScrollView : UIViewRepresentable{
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent: self)
    }
    
    
    @Binding var trainer:[Traier]
    
    
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        
        //UIHostingController is a UIKit Controller to control SWIFTUI Hierarchy
        //rootView is the root View for this controller
        let rootView = UIHostingController(rootView: PlayerView(trainerList: $trainer))
        
        //Total Height of this view is the fullscreen * total trainer
        rootView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(trainer.count))
        
        //Total ScrollView Content size ,width: full window ,and height : trainer count * full screen
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(trainer.count))
        
        view.addSubview(rootView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        //ignore safe area
        view.contentInsetAdjustmentBehavior = .never
        
        //Paging the page ,not Scroll
        view.isPagingEnabled  = true
        view.delegate = context.coordinator
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        //TODO
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(trainer.count))
        
        
        for i in 0..<uiView.subviews.count{
            //let all subview have same frame size
            //in this case ,we only have 1 subview:rootView:PlayerView
            //when trainer data is updated
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(trainer.count))
        }
    }
    
    //this is used to communicated between UIKit View And SiwftUI View :UIScrollViewDelegate
    class Coordinator:NSObject,UIScrollViewDelegate{
        
        var parentView:PlayerScrollView
        var index = 0 //default index
        
        init(parent:PlayerScrollView){
            parentView = parent
        }
        //is Scroll ened?
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          //  print(scrollView.contentOffset.y)
            //get index of each content
            
            let currentIndex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currentIndex{
                index = currentIndex
                
                for i in 0..<parentView.trainer.count{
                    parentView.trainer[i].videoPlayer.seek(to: .zero) //video time line to 0
                    parentView.trainer[i].videoPlayer.pause() //pause the video
                }
                
                parentView.trainer[index].videoPlayer.play() //play the video
                parentView.trainer[index].videoPlayer.actionAtItemEnd = .none  //???
                
                NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: parentView.trainer[index].videoPlayer.currentItem, queue: .main){ (_) in
                    
                    self.parentView.trainer[self.index].videoReplay = true
                    
                }
            }
            
        }
    }
}
