//
//  Movie.swift
//  IOS_DEV
//
//  Created by Jackson on 7/4/2021.
//

import Foundation
import SwiftUI
import AVKit

struct Trailer:Identifiable{
    var id : Int
    var movieName:String
    var movieType:[String]
    var videoPlayer:AVPlayer
    var videoReplay:Bool
  //  var isLike:Bool
}

struct MovieInfo:Identifiable{
    var id = UUID().uuidString
    let movieName:String
    let adult:Bool
    let desscription:String
    let movieLanguage:String
    let releaseDate:Data
    let movireTrainer:[Trailer]?
    let moviePoster:String
}



struct MovieActor{
    let actorName :String!
    let actorAvatorImage : String!
    let actorCharactorName : String!
}


struct MovieCapture{
    let CaptureImage:String!
}
