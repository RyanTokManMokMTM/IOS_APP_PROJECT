//
//  MModel.swift
//  IOS_Project
//
//  Created by 張馨予 on 2021/5/23.
//

import SwiftUI

struct TractataeM:Identifiable
{
    var id: Int
    var ImageName:String
    var TopicName:String
    var TopicTitle:String
    var Content:String
    var Date:String
    
    //var action :()-> Void
}

struct TopicM:Identifiable
{
    var id:Int
    var ImageName:String
    var TopicName:String
    var TopicTitle:String
    var Content:String
    var Date:String
}

struct MBM:Identifiable
{
    var id:Int
    var ImageName:String
    var UserName:String
    var Content:String
}
