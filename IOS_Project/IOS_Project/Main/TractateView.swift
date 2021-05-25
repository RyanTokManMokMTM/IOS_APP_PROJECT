//
//  TractateView.swift
//  IOS_Project
//
//  Created by 張馨予 on 2021/5/23.
//

import SwiftUI

struct TractateView: View
{
    var List:[TractataeM]
    let FullSize = UIScreen.main.bounds.size
    
    var body: some View
    {
        VStack()
        {
            //top pic can not move
            ZStack()
            {
                Image("wa")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .top)
                    .frame(width: FullSize.width, height: 250)
                    .clipped()
            LinearGradient(
                gradient: Gradient(colors: [.white, .gray]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
            .blendMode(.multiply)
            .frame(width: FullSize.width, height: 250)
                //漸層
            }
            
            
                
            ScrollView(.vertical, showsIndicators: true)
            {
                Spacer()
                
                    //TODO
                    //two 'TractateFrame' in a Row
                    HStack()
                    {
                        
                    }
                    .padding(.bottom)
                
                
               
            }
        }
        .ignoresSafeArea(edges: .top)
        .frame(width: FullSize.width, height: FullSize.height)
    }
}

//struct TractateView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        TractateView()
//    }
//}
