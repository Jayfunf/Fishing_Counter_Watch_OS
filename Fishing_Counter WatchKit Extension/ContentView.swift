//
//  ContentView.swift
//  Fishing_Counter WatchKit Extension
//
//  Created by Minhyun Cho on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    var body: some View {
        VStack{
            Text("오늘은 몇 마리를 잡을까?")
            Text("\(count)").font(.system(size: 50))
            HStack{
                Button(action: {self.count = self.count + 1}){
                    Text("+").font(.headline)
                }
                Button(action: {self.count = self.count - 1}){
                    Text("-").font(.headline)
                }
                Button(action: {self.count = 0}){
                    Text("ø").font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
