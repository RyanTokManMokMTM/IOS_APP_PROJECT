//
//  IOS_ProjectApp.swift
//  IOS_Project
//
//  Created by 張馨予 on 2021/5/23.
//

import SwiftUI

@main
struct IOS_ProjectApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            Message_Board(ms: MList.first!)
        }
    }
}
