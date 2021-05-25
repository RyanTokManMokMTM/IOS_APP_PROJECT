//
//  Topic.swift
//  new
//
//  Created by 張馨予 on 2021/3/21.
//

import SwiftUI

struct TopicView: View
{
    var TList:[TopicM]
    let FullSize = UIScreen.main.bounds.size
    var body: some View
    {
       
            VStack()
            {
//                SearchBar(text: .constant(""))
//                    //.position(x: 195, y: 50)
//                    .padding(.top, 70)
//                    .clipped()
//                    .ignoresSafeArea(edges: .top)
                //Spacer()
                
                ScrollView(.vertical, showsIndicators: true)
                {
                    //TODO
                    //one 'TopicFrame' in a Row
                    
                }
                //.ignoresSafeArea(edges: .top)
                .frame(width: FullSize.width,height:FullSize.height)
                
            }
                
    }
}


//struct TopicView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        NavigationView
//        {
//            TopicView()
//        }
//        .navigationBarHidden(true)
//        .navigationBarTitle(Text("Home"))
//        .edgesIgnoringSafeArea([.top, .bottom])
//
//    }
//}
