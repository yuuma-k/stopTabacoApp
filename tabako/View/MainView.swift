//
//  MainView.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct MainView: View {
    
    //Current tab
    @State var currentTab : Tab = .Map
    
    //Hiding native one...
    init(size: CGSize, bottomEdge: CGFloat){
        self.size = size
        self.bottomEdge = bottomEdge
        UITabBar.appearance().isHidden = true
    }
    
    //For matched geometry effect...
    @Namespace var animation
    var size: CGSize
    var bottomEdge: CGFloat
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $currentTab) {
                //Tab views...
                TabacoSumView(result: .constant(45.5))
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Tab Enum...
enum Tab: String,CaseIterable{
    case Map = "map"
    case Memo = "square.and.pencil"
}


