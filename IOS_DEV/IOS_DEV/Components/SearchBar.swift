//
//  SearchBar.swift
//  new
//
//  Created by 張馨予 on 2021/3/19.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField("Movie Name,Actor etc", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                            .animation(.easeInOut)
                            .transition(.flipFromRight)
                        }
                        
                        
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(getter: UIResponder.isFirstResponder), to: nil, from: nil, for: nil)
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 5)
                .animation(.easeInOut)
                .transition(.flipFromRight)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
           
    }
}
