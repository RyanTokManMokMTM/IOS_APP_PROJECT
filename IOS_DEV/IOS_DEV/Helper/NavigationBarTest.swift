//
//  NavigationBarTest.swift
//  IOS_DEV
//
//  Created by Jackson on 11/5/2021.
//

import SwiftUI

struct NavigationBarTest: View {
    var body: some View {
        HStack(alignment:.bottom){
            HStack(alignment:.center,spacing:0){
                Button(action:{
                    //back to the page
//                        withAnimation{
//                            isActive.toggle()
//                        }
                }){
                    HStack(alignment:.center , spacing: 5){
                        Image(systemName: "chevron.backward")
                            .font(.system(size:18,weight:.bold))
                        Text("Back")
                    }

                }

                Spacer()

            }
        }
        .frame(minHeight:65)
        .background(Color.black.opacity(0.7))
    }
}

struct NavigationBarTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTest()
    }
}
