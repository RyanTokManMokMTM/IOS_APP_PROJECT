//
//  MovieDetailScrollView.swift
//  IOS_DEV
//
//  Created by Jackson on 30/4/2021.
//

import SwiftUI

struct MovieDetailScrollView: View {
    var tabs:[Tabs]
    @State private var currentTab:Tabs = .overView
    
    func getStrWidth(_ font:Tabs)->CGFloat{
        //get current string size
        let current = font.rawValue //get enum value
        return current.widthOfStr(Font: .systemFont(ofSize: 16,weight: .bold))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:10){
                ForEach(tabs,id:\.self){tab in
                    VStack{
                        Button(action: {
                            withAnimation(.easeInOut){
                                currentTab = tab
                            }
                        }){
                            Text(tab.rawValue)
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(currentTab == tab ? Color.white : Color.gray)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width:getStrWidth(tab),height:25)
                        
                        
                        RoundedRectangle(cornerRadius: 2)
                            .frame(width:getStrWidth(tab),height: 6)
                            .foregroundColor(currentTab == tab ? Color.red : Color.clear)
                            
                    }
                    
                }
                
            }
            
        }
        .foregroundColor(.white)
    }
}

struct MovieDetailScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            MovieDetailScrollView(tabs: [.overView,.trailer,.more,.resouces])
        }
    }
}

enum Tabs : String{
    case overView = "OVERVIEW"
    case trailer = "TRAILER & MORE"
    case more = "MORE MOVIE"
    case resouces = "MOVIE RESOURCE"
}
