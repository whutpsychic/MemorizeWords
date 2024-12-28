//  WordBook.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/24.

import SwiftUI

struct WordBook: View {
    
    let iconSize: Double = 20
    let titleFontSize: Double = 20
    
    var list = ["item", "item2", "item3", "item4", "item5"]
    
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    self.searchWordBook()
                }){
                    Image(systemName: "magnifyingglass")
                        .resizable().frame(width: iconSize, height: iconSize)
                        .tint(.blue)
                }
                Spacer()
                Text("单词本").font(.system(size: titleFontSize, weight: .bold)).tracking(3)
                Spacer()
                Button(action:{
                    self.addWordBook()
                }){
                    Image(systemName: "plus")
                        .resizable().frame(width: iconSize, height: iconSize)
                        .tint(.blue)
                }
            }
            .padding(.horizontal, 25)
            List{
                ForEach(0...list.count - 1, id: \.self){ index in
                    WordBookItem(title: list[index], description: nil)
//                        Text(list[index])
                }
            }
            .listStyle(.plain)
        }
        
    }
    
    // 搜寻单词本
    func searchWordBook() -> Void{
        print("U tapped search btn!")
    }
    
    // 添加单词本
    func addWordBook() -> Void{
        print("U tapped add btn!")
    }
    
    
    
    
    
}

#Preview {
    WordBook()
}
