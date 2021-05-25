//
//  TopicFrame.swift
//
//  Created by 張馨予 on 2021/3/18.
//

import SwiftUI

struct TopicFrame: View
{
    var topicc:TopicM
    
    var body: some View
    {
        
            HStack(spacing: 0)
            {
            
                //NavigationLink(destination: Message_BoardView())
                //{
                    Image(topicc.ImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 160)
                    .clipped()
                    //.overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    //.cornerRadius(30.0)
                    Spacer()
                    Spacer()
                    VStack(alignment:.leading)
                    {
                        Spacer()
                        HStack()
                        {
                        
                            Image(topicc.ImageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(30)
                            Text(topicc.TopicName)
                            Spacer()
                        }
                        .padding(.top,15)
                    
                        Text(topicc.TopicTitle)
                        .font(.system(.title, design: .rounded))
                        //Spacer()
                        Text(topicc.Content)
                        //Spacer()
                        Text(topicc.Date)
                        Spacer()
                        HStack()
                        {
                        
                            Image(systemName:"text.bubble")
                            .resizable()
                            .frame(width: 25, height: 25)
                            Text("65")
                            Image(systemName:"heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.pink)
                            
                            Text("75")
                        
                        }
                        .padding(.bottom,25)
                    }
                
               // }
        }
        .frame(width: UIScreen.main.bounds.size.width-25, height: 160, alignment: .leading)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: .gray, radius: 2, x: 1.0, y: 1.0)
        .padding([.leading, .bottom, .trailing], 20)
        .foregroundColor(.black)
        
    }
}

struct TopicFrame_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            TopicFrame(topicc: TList.first!)
        }
    }
}