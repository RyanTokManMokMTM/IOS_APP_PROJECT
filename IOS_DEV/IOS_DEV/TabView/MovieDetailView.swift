//
//  MovieDetailView.swift
//  IOS_DEV
//
//  Created by Jackson on 30/4/2021.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Movie Name ???")
            
            Group{
                VStack(alignment: .leading){
                    Text("Director:")
                    Text("Cast:")
                    Text("Release Date:")
                    Text("Type:")
                    Text("Language:")
                    Text("Region:")
                }
                
            }
        }
        .foregroundColor(.white)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            MovieDetailView()
        }
    }
}
