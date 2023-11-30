//
//  ResultPage.swift
//  FeedbackCounter
//
//  Created by Adriel Bernard Rusli on 23/11/23.
//

import SwiftUI

struct ResultPage: View {
    @Binding var yesResult: Int
    @Binding var noResult: Int
    @Binding var openResultPage : Bool
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Image("Background")

                    .frame(width: geometry.size.width , height: geometry.size.height)
                Image("Logo")
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.1)
                    .onTapGesture {
                        openResultPage = false
                    }
                
                VStack{
                    Text("Result")
                        .foregroundColor(Color("blue"))
                        .bold()
                        .font(.system(size: 100))
                       
                    
                    HStack{
                        
                        VStack(alignment: .center){
                            Text("Yes")
                                .foregroundColor(.green)
                                .bold()
                                .font(.system(size: 70))
                            
                            Text("\(yesResult)")
                                .foregroundColor(.green)
                                .bold()
                                .font(.system(size: 70))
                            
                            
                            
                        }
                        Divider()
                            .frame(width:3,height: 200)
                            .background(Color.blue)
                            .foregroundColor(.black)
                            .padding(40)
                            
                           
    
                        
                        VStack(alignment: .center){
                            Text("No")
                                .foregroundColor(.red)
                                .bold()
                                .font(.system(size: 70))
                            
                            Text("\(noResult)")
                                .foregroundColor(.red)
                                .bold()
                                .font(.system(size: 70))
                            
                            
                        }
                    }.frame(width: geometry.size.width * 0.3)
                }
                
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ResultPage(yesResult: .constant(30),noResult: .constant(10), openResultPage: .constant(true))
}
