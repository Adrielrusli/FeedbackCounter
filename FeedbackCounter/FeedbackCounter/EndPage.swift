//
//  EndPage.swift
//  FeedbackCounter
//
//  Created by Adriel Bernard Rusli on 23/11/23.
//

import SwiftUI

struct EndPage: View {
    @Binding var isOpen : Bool
   
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Image("Background")
                    .frame(width: geometry.size.width , height: geometry.size.height)
                Image("Logo")
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.1)
                
                VStack(alignment: .center){
                    
                    Text("Thank you for sharing your thoughts!")
                        .font(.system(size: 40))
                    
                    Spacer()
                    Button{
                        isOpen = false
                    }label: {
                        Text("Back to survey")
                            .font(.system(size: 30))
                    }
                }.frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.15)
                
                
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    EndPage(isOpen: .constant(true))
}
