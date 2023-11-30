//
//  ContentView.swift
//  FeedbackCounter
//
//  Created by Adriel Bernard Rusli on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOpen = false
    @State var isOpenResult = false
    @AppStorage("yesCounter") var yesCounter: Int = 0
    @AppStorage("noCounter") var noCounter: Int = 0
    
    
    var body: some View {
        GeometryReader { geomerty in
            ZStack(alignment: .center){
                
                Image("Background")
                    .frame(width: geomerty.size.width, height: geomerty.size.height)
                Image("Logo")
                    .position(x: geomerty.size.width / 2, y: geomerty.size.height * 0.1)
                //                .position(x: UIScreen.main.bounds.width * 0.1 , y: UIScreen.main.bounds.height * 0.1)
                VStack(alignment: .center){
                    
                    VStack{
                        Text("If Chez Terra was sold on the market,")
                            .font(.system(size: 44))
                        HStack{
                            Text("would you be")
                                .font(.system(size: 44))
                            Text("interested in buying it?")
                                .foregroundColor(Color("blue"))
                                .font(.system(size: 44))
                        }
                    }.frame(width: geomerty.size.width * 0.7)/*.frame(width: UIScreen.main.bounds.width * 0.7)*/
                    
                    HStack {
                        
                        Button{
                            
                            yesCounter += 1
                            isOpen = true
                        }label: {
                            Image("InterestedButton")
                                .scaledToFit()
                                .frame(width: 400 , height: 100)
                            
                            
                            
                        }
                        
                        Spacer()
                        Button{
                         
                                noCounter += 1
                            isOpen = true
                            
                        }label: {
                            Image("NotInterestedButton")
                        }
                    }.padding(.top, 50)
                        .frame(width: geomerty.size.width * 0.7)
                }
            }.fullScreenCover(isPresented: $isOpen){
                EndPage(isOpen: $isOpen)
            } .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .onEnded {_ in 
                        isOpenResult = true
                    }
            ).fullScreenCover(isPresented: $isOpenResult){
                ResultPage(yesResult: $yesCounter, noResult: $noCounter, openResultPage: $isOpenResult)
            }
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
