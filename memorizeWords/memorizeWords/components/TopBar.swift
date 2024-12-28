//  TopBar.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/25.

import SwiftUI

struct TopBar: View {
    
    let title: String
    let onSearch: () -> Void?
    
//    -------------------------
    let iconSize: Double = 24
    
    init(title: String, onSearch: @escaping () -> Void?){
        self.title = title
        self.onSearch = onSearch
    }
    
    init(){
        self.init(title: "标题", onSearch: {})
    }
    
    var body: some View {
        VStack{
            
            
        }
    }
}

#Preview {
    TopBar()
}
