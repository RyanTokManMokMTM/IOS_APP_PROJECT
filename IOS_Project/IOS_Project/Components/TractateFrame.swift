//
//  TractateFrame.swift
//  new
//
//  Created by 張馨予 on 2021/5/21.
//

import SwiftUI

struct TractateFrame: View
{
    var tractate:TractataeM

    
    var body: some View
    {
        
        Button(action:{print("success")})
        {
            HStack(spacing:0)
            {
                
                VStack(alignment:.leading)
                {
                    Spacer()
                    HStack()
                    {
                        
                        Image(tractate.ImageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(30)
                            .padding(.leading,8)
                        Text(tractate.TopicName)
                        Spacer()
                    }
                    
                    Text(tractate.TopicTitle)
                        .font(.system(.title, design: .rounded))
                        .padding(.leading,8)
                   // Spacer()
                    Text(tractate.Content)
                        .padding(.leading,8)
                    //Spacer()
                    Text(tractate.Date)
                        .padding(.leading,8)
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
                    .padding([.leading, .bottom],8)
                    
                }
                
            }
            .frame(width: 170, height: 175, alignment: .leading)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 2, x: 1.0, y: 1.0)
            .padding(.horizontal, 10)
        }
        .foregroundColor(.black)
    }
   
}


struct TractateFrame_Previews: PreviewProvider
{
    static var previews: some View
    {
        TractateFrame(tractate: List.first!)
    }
}
