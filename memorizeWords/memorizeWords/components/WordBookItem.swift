//  WordBookItem.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/25.

import SwiftUI

struct WordBookItem: View {
    
    let title: String
    let description: String?
//    -----------------------
    let imageSize: Double = 30
    
    init(){
        self.init(title: "未命名标题", description: "没有任何描述")
    }
    
    init(title: String, description: String?){
        self.title = title
        self.description = description
    }
    
    var body: some View {
        HStack(spacing: 10){
            Image(systemName: "book")
                .resizable().scaledToFit()
                .frame(width: imageSize, height: imageSize, alignment: .center)
                
            VStack(alignment: .leading){
                // 标题
                Text(title).frame(width: .infinity, alignment: .leading).background(.purple)
                // 副标题（描述）
                Text(description!).background(.orange)
                

            }
            .background(.pink)
            
            
            
   
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    WordBookItem()
}
