//
//  OneTabacoCaluView.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/22.
//

import SwiftUI

struct OneTabacoCaluView: View {
    
    @State var priceOfBox = ""
    @State var numberOfTabaco = ""
    @AppStorage("resultOfOne") var result = 0.0
    
    var body: some View {
        
        
        ZStack{
            
            Color(red: 0.96, green: 0.96, blue: 0.96)
                .ignoresSafeArea()
            
            VStack{
            
                
                ZStack{
                    
                    Rectangle()
                        .frame(minWidth: 150, maxWidth: 335, minHeight: 115, maxHeight: 375, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .background(Color.gray
                            .offset(x: 3, y: 3)
                        )
                        .padding()
                    
                    VStack{
                        Text("１箱あたりの価格")
                            .font(.title2.bold())
                            .frame(width: 300, height: 50, alignment: .leading)
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                        
                        TextField("１箱あたりの価格", text: self.$priceOfBox ).keyboardType(.numberPad)
                            .background(Color.white)
                            .cornerRadius(5)
                            .frame(width: 300, height: 50)
                            .aspectRatio(contentMode: .fit)
                        
                        Text("１箱あたりの本数")
                            .font(.title2.bold())
                            .foregroundColor(.black)
                            .frame(width: 300, height: 50,alignment: .leading)
                            .aspectRatio(contentMode: .fit)
                        
                        TextField("１箱あたりのたばこ本数", text: self.$numberOfTabaco ).keyboardType(.numberPad)
                            .background(Color.white)
                            .frame(width: 300, height: 30)
                            .padding()
                            .aspectRatio(contentMode: .fit)
                            
                    }
                    
                    
                    
                }
                
                ZStack{
                    
                    Capsule()
                        .frame(width: 125, height: 55)
                        .cornerRadius(10)
                    
                    Button {
                        self.result = Double(self.priceOfBox)! / Double(self.numberOfTabaco)!
                    } label: {
                        Text("計算")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding()
                            
                    }
                        .background(Color.black)
                    
                    
                }
                
                    
                
                ZStack{
                    
                      Rectangle()
                        .frame(minWidth: 250, maxWidth: 335, minHeight: 50, maxHeight: 75, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .background(Color.gray
                                .offset(x: 3, y: 3)
                            )
                            .padding()
                    
                    VStack{
                        
                        Text("\(self.result)円")
                            .font(.title2.bold())
                                  .foregroundColor(.black)
                        
                        
                    }
                    
                }
                
                
                
            }
            
        }
        
        
            
        
            
           
            
        
        
        
        
       
    }
        
}



struct OneTabacoCaluView_Previews: PreviewProvider {
    static var previews: some View {
        OneTabacoCaluView()
    }
}
