//
//  ContentView.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/21.
//

import SwiftUI


struct ContentView: View {
    
    @Binding var result:Double
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            MainView(size: size, bottomEdge: bottomEdge, result: $result)
                .ignoresSafeArea(.all, edges:.bottom)
        }
       
    }
}

