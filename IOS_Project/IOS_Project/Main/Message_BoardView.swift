//
//  Message_BoardView.swift
//  IOS_DEV
//
//  Created by 張馨予 on 2021/5/2.
//

import SwiftUI
import UIKit

struct Message_BoardView: View
{
    var MList:[MBM]
    
    var body: some View
    {
        NavigationView
        {
            HStack(spacing: 0)
            {
                //TODO Content
            }
            .offset(y: -40)
        }
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea([.top, .bottom])
        
    }
}

//struct Message_BoardView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        Message_BoardView()
//    }
//}
