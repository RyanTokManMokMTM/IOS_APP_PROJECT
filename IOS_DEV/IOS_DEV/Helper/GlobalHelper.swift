//
//  GlobalHelper.swift
//  IOS_DEV
//
//  Created by Jackson on 10/4/2021.
//

import Foundation
import SwiftUI
import AVKit

//USE FOR FAKE DATA TO TEST UI

//USE LOCAL VIDEO URL
//Trainer list"
var VideoList:[Traier] = [
    Traier(id:1,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v1", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:2,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v2", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:3,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v3", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:4,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v4", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:5,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v5", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:6,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v6", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:7,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v7", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:8,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "v8", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:9,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:10,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:11,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:12,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:13,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)) , videoReplay: false),
    Traier(id:14,videoPlayer:AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)) , videoReplay: false),
]
