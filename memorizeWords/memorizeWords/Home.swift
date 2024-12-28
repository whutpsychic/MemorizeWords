//  Home.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/23.
//  首页，一切工作的开始

import SwiftUI

struct Home: View{
    
    @State private var activeTab = 0
    
    var body: some View {
        TabView(selection: $activeTab){
            WordBook().tabItem{
                Label("单词本", systemImage: "text.book.closed")
            }.tag(0)
            Training().tabItem{
                Label("考试练习", systemImage: "square.and.pencil")
            }.tag(1)
            ClockIn().tabItem{
                Label("学习打卡", systemImage: "clock.badge.checkmark")
            }.tag(2)
        }
    }
}

#Preview {
    Home()
}
