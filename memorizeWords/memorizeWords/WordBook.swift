//  WordBook.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/24.

import SwiftUI

let iconSize: Double = 20
let titleFontSize: Double = 20

struct WordBookFormView: View{
    
    @Binding var showing: Bool
    
    @State var name: String = ""
    @State var remarks: String = ""

    var body: some View{

        VStack (spacing: 20){
            // 顶部标题
            HStack{
                Button(action:{
                    showing = false
                }){
                    Text("取消")
                }
                Spacer()
                Text("编辑单词本").font(.system(size: titleFontSize, weight: .bold))
                Spacer()
                Button(action:{
                    // 作为一条数据存储到本地
                    
                    print(name)
                    print(remarks)
//                    showing = false
                }){
                    Text("确定")
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
           
            Text("名称")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .bold, design: .rounded))
            // 表单部分
            TextField("", text: $name)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .padding(.vertical, 12).padding(.horizontal, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            Text("备注")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .bold, design: .rounded))
            TextEditor(text: $remarks)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .padding(.vertical, 12).padding(.horizontal, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
    }
    
    
}

struct WordBook: View {
    

    
    var list = ["item", "item2", "item3", "item4", "item5"]
    
    @State var showEditForm: Bool = true
    
    var body: some View {
        NavigationView{
            // 页面主体
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
                        WordBookItem(title: list[index], description: "")
                    }
                }
                .listStyle(.plain)
            }
            // 表单部分
            .sheet(isPresented: $showEditForm){
                WordBookFormView(showing: $showEditForm)
            }
            
            
            
        }
        
        
        
        
        
    }
    
    // 搜寻单词本
    func searchWordBook() -> Void{
        print("U tapped search btn!")
    }
    
    // 添加单词本
    func addWordBook() -> Void{
        print("U tapped add btn!")
        // 弹起单词本表单
        showEditForm = true
        
        
        
    }
    
    
}

#Preview {
    WordBook()
}
