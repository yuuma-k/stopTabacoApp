//
//  ContentView.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/21.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            MainView(size: size, bottomEdge: bottomEdge)
                .ignoresSafeArea(.all, edges:.bottom)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
