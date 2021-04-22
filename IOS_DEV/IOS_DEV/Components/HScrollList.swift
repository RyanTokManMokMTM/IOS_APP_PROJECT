//
//  HScrollList.swift
//  IOS_DEV
//
//  Created by Jackson on 22/4/2021.
//

import SwiftUI

struct HScrollList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:15){
                VStack{
                    Text("MINS")
                    Text("13")
                }
                
                Divider()
                    .background(Color.red)
                
                VStack{
                    Text("MINS")
                    Text("13")
                }
                
                Divider()
                
                VStack{
                    Text("MINS")
                    Text("13")
                }
                
                Divider()
                VStack{
                    Text("MINS")
                    Text("13")
                }
                
                Divider()
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 50)
        }
    
    }
}

struct HScrollList_Previews: PreviewProvider {
    static var previews: some View {
        HScrollList()
    }
}
