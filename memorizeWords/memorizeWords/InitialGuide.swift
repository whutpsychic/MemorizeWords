//  InitialGuide.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/23.
//  此页面仅第一次使用时显示，用于提示用户App特征，之后不再展示

import SwiftUI

// 通向主页按钮
struct ButtonToHome: View{
    
    @AppStorage("hasViewedInitialGuide") var hasViewedInitialGuide: Bool = DefaultSettings.hasViewedInitialGuide
    
    var body: some View{
        
            VStack{
                Button("我知道了"){
                    hasViewedInitialGuide = true
                }
                .padding(.horizontal, 20).padding(.vertical, 12)
                .background(.blue).foregroundColor(.white).cornerRadius(8)
                
            }
    }
}

struct TabViewer: View{
    
    let index: Int
    let title: String
    let subtitle: String
    let content: String
    let addition: String
    
    init(index:Int, title:String, subtitle: String, content: String, addition: String){
        self.index = index
        self.title = title
        self.subtitle = subtitle
        self.content = content
        self.addition = addition
    }
    
    var body: some View {
        
        VStack {
            Text(title).padding(.top, 120)
            Text(subtitle).padding(.top, 15)
            Text(content).padding(.top, 15)
            Text(addition).font(.system(size: 18, weight:.bold)).padding(.top, 15)
            Spacer()
            
            if self.index == 2{
                ButtonToHome()                
                Spacer()
            }else{
                
            }
            
        }
        .padding()
    }
}


struct InitialGuide: View {
    
    let tabTitles = ["此App是完全免费的", "此App没有云端服务器支持", "同样地"]
    let tabSubTitles = ["你无需担心在使用时突然出现内容收费的情况", "所有的数据都存储在本地", "此App会随着你的单词量增加而增大体积"]
    let tabContents = ["", "所以你不需要以任何身份进行登录", "一旦卸载，则所有数据都会消失且无法恢复"]
    let additionContents = ["", "但部分功能需要链接网络才能使用", "所以卸载此App前请慎重考虑"]
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("你有必要知道")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 60)
                
                TabView{
                    ForEach(tabTitles.indices,id:\.self){index in
                        TabViewer(index: index, title: tabTitles[index],subtitle: tabSubTitles[index],content: tabContents[index],addition: additionContents[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode:.always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }
}

#Preview {
    InitialGuide()
}
