//
//  tabacotabbar.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/22.
//

import SwiftUI

struct CustomTabBar: View {
    var animation :Namespace.ID
    
    //Extracing Screen size and bottom safe area
    var size:CGSize
    var bottomEdge:CGFloat
    
    
    @Binding var currentTab:Tab
    var body: some View {
        HStack(spacing:0){
            //Tab buttons...
            ForEach(Tab.allCases,id:\.rawValue) { tab in
                
                tabButton(tab: tab, animation: animation, currentTab: $currentTab) { pressedTab in
                    
                    //Updating tab...
                    withAnimation(.spring()){
                        currentTab = pressedTab
                    }
                   
                }
            }
        }
        //Custom elastic shape
        .background(
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 45, height: 63)
                    .offset(y: 48)
                
                //Adding two circles to create elastic shape
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 65)
                //Trail and error method
                    .offset(x: 27, y: 36)
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 65)
                //Trail and error method
                    .offset(x: -27, y: 36)
            }
            .offset(x: getStartOffset())
            .offset(x: getOffSet())
            
            //Moving to start
            ,alignment: .leading
        
        )
        .padding(.horizontal,15)
        .padding(.top,7)
        .padding(.bottom, bottomEdge == 0 ? 15 :bottomEdge)
    }
    //Getting start offset
    func getStartOffset() -> CGFloat{
        //padding...
        let reduced = (size.width - 30) / 2
        //45 = button size...
        let center = (reduced - 45) / 2
        return center
    }
    
    //Moving elastic shape...
    func getOffSet()->CGFloat{
        let reduced = (size.width - 30) / 2
        //getting index and multiplying with that...
        let index = Tab.allCases.firstIndex { checkTab in
            return checkTab == currentTab
        } ?? 0
        return reduced * CGFloat(index)
    }
}



struct tabButton:View{
    var tab: Tab
    var animation: Namespace.ID
    @Binding var currentTab:Tab
    //Sending back the result...
    var onTap: (Tab)->()
    
    var body: some View{
        //Since we don't need ripple effect while clicking the button...
        //So we are using ontap...
        Image(systemName: tab.rawValue)
            .foregroundColor(currentTab == tab ? .white : .gray)
            //default frame
            .frame(width: 45, height: 45)
            .background(
                ZStack{
                    if currentTab == tab {
                        Circle()
                            .fill(Color.black)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                }
            })
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                onTap(tab)
            }
     }
    
}

