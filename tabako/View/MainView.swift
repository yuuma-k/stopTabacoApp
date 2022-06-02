//
//  MainView.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/22.
//

import SwiftUI

struct MainView: View {
    
    //Current tab
    @State var currentTab : Tab = .Map
    
    @Binding var result:Double
    
    //Hiding native one...
    init(size: CGSize, bottomEdge: CGFloat, result:Binding<Double>){
        self.size = size
        self.bottomEdge = bottomEdge
        UITabBar.appearance().isHidden = true
        self._result = result
    }
    
    //For matched geometry effect...
    @Namespace var animation
    var size: CGSize
    var bottomEdge: CGFloat
    
    var body: some View {
        
        VStack{
            
            TabView(selection: $currentTab) {
                //Tab views...
                TabacoSumView(result: $result)
                    .tag(Tab.Map)
                
                OneTabacoCaluView()
                    .tag(Tab.Memo)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04))
                    .ignoresSafeArea()
            }
            
            //Custom tab bar...
            CustomTabBar(animation: animation,size: size,bottomEdge: bottomEdge, currentTab:$currentTab)
                .background(Color.white)
        }
    }
}



//Tab Enum...
enum Tab: String,CaseIterable{
    case Map = "map"
    case Memo = "square.and.pencil"
}


