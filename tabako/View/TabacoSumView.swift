//
//  TabacoSumView.swift
//  tabako
//
//  Created by 高阪侑真 on 2022/04/22.
//

import SwiftUI

struct TabacoSumView: View {
    
    @State var SumpriceOfTabaco = 0.0 {
        didSet{
            UserDefaults.standard.set(SumpriceOfTabaco, forKey: "SumpriceOfTabaco")
        }
    }
    
    @Binding var result:Double
    
    var body: some View {
        
        ZStack{
            
            Color(red: 0.96, green: 0.96, blue: 0.96)
                
            
            VStack{
                
                ZStack{
                    
                    Rectangle()
                        .frame(minWidth: 200, maxWidth: 330, minHeight: 75,maxHeight: 150, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .background(Color.gray
                            .offset(x: 3, y: 3))
                        .padding()
                                    
                    
                    VStack{
                        Text("合計額")
                            .font(.title.bold())
                            .padding()
                        Text("\(self.SumpriceOfTabaco)円")
                            .font(.title.bold())
                            .foregroundColor(.black)
                            .padding()
                    }
                    
            }
                    
                    
                    VStack{
                        Text("合計額")
                            .font(.title.bold())
                            .padding()
                        
                        Text("\(self.SumpriceOfTabaco)円")
                            .font(.title.bold())
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                
                HStack{
                           
                          Button {
                              
                              self.SumpriceOfTabaco = SumpriceOfTabaco - result
                             
                          } label: {
                            Text(" − ")
                              .font(.title3.bold())
                              .foregroundColor(.white)
                              .padding()
                               
                          }
                            .background(Color.black)
                            .padding()
                           
                           
                           
                           
                          Button {
                              
                              self.SumpriceOfTabaco = SumpriceOfTabaco + result
                             
                          } label: {
                            Text("＋")
                              .font(.title3.bold())
                              .foregroundColor(.white)
                              .padding()
                               
                          }
                            .background(Color.black)
                            .padding()
                           
                        }
                
                
                ZStack{
                    
                    Rectangle()
                        .frame(minWidth: 0, maxWidth: 335, minHeight: 0,  maxHeight: 400, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .background(Color.gray
                            .offset(x: 3, y: 3)
                        )
                        
                    
                    VStack{
                        Text("あなたのたばこ総消費額は")
                            .font(.title3)
                        
                        showImage()
                            .frame(minWidth: 0,maxWidth: 200, minHeight: 0,maxHeight: 250, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            
                           
                        
                        showText()
                            .aspectRatio(contentMode: .fit)
                           
                    }
                    
                }

                
               
                
                
                
            }
        }
        
    
    
    
    
    func showImage() -> AnyView{
        switch self.SumpriceOfTabaco{
        case 0...99:
            return AnyView(Image("start").resizable().scaledToFit())
        case 100...299:
            return AnyView(Image("100yen").resizable().scaledToFit())
        case 300...499:
            return AnyView(Image("300yen").resizable().scaledToFit())
        case 500...999:
            return AnyView(Image("500yen").resizable().scaledToFit())
        case 1000...1499:
            return AnyView(Image("1000yen").resizable().scaledToFit())
        case 1500...2999:
            return AnyView(Image("1500yen").resizable().scaledToFit())
        case 3000...4999:
            return AnyView(Image("3000yen").resizable().scaledToFit())
        case 5000...9999:
            return AnyView(Image("5000yen").resizable().scaledToFit())
        case 10000...29999:
            return AnyView(Image("10000yen").resizable().scaledToFit())
        case 30000...49999:
            return AnyView(Image("3man").resizable().scaledToFit())
        case 50000...99999:
            return AnyView(Image("5man").resizable().scaledToFit())
        case 100000...149999:
            return AnyView(Image("10man").resizable().scaledToFit())
        case 150000...299999:
            return AnyView(Image("15man").resizable().scaledToFit())
        case 300000...499999:
            return AnyView(Image("30man").resizable().scaledToFit())
        case 500000...999999:
            return AnyView(Image("50man").resizable().scaledToFit())
        case 1000000...4999999:
            return AnyView(Image("100man").resizable().scaledToFit())
        case 5000000...9999999:
            return AnyView(Image("500man").resizable().scaledToFit())
        case 10000000...30000000:
            return AnyView(Image("1000man").resizable().scaledToFit())
                
        default:
            return AnyView(Image("default").resizable().scaledToFit())
        }
    }
    
    func showText() -> AnyView{
        switch self.SumpriceOfTabaco{
            case 0...99:
                return AnyView(Text("計測スタートです！！"))
            case 100...299:
                return AnyView(Text("缶ジュース1個分です"))
            case 300...499:
                return AnyView(Text("うどん1杯分です"))
            case 500...999:
                return AnyView(Text("マンガ1冊分です"))
            case 1000...1499:
                return AnyView(Text("千円カット1回分です"))
            case 1500...2999:
                return AnyView(Text("映画チケット1枚分です"))
            case 3000...4999:
                return AnyView(Text("そこそこ良いイヤホン1個分です"))
            case 5000...9999:
                return AnyView(Text("遊園地チケット1枚分です"))
            case 10000...29999:
                return AnyView(Text("新幹線で東京 → 名古屋へ行くことができます"))
            case 30000...49999:
                return AnyView(Text("高級レストランへでの食事1回分です"))
            case 50000...99999:
                return AnyView(Text("高級旅館に１泊分です"))
            case 100000...149999:
                return AnyView(Text("ノートパソコン1台分です"))
            case 150000...299999:
                return AnyView(Text("冷蔵庫1台分です"))
            case 300000...499999:
                return AnyView(Text("贅沢なハワイ旅行1回分です"))
            case 500000...999999:
                return AnyView(Text("高級腕時計1個分です"))
            case 1000000...4999999:
                return AnyView(Text("軽自動車1台分です"))
            case 5000000...9999999:
                return AnyView(Text("田舎の住宅1軒分です"))
            case 10000000...30000000:
                return AnyView(Text("高級スポーツカー1台分です"))
                
                
                
            default:
                return AnyView(Text("測定不能です"))
        }
    }
    
    


struct TabacoSumView_Previews: PreviewProvider {
    static var previews: some View {
        TabacoSumView(result: .constant(156.0))
    }
}

}

