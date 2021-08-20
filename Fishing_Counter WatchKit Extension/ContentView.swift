//
//  ContentView.swift
//  Fishing_Counter WatchKit Extension
//
//  Created by Minhyun Cho on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    @State private var isShowAlert = false
    @State private var isEmpty = false
    @State private var isCelev = false
    var body: some View {
        VStack{
            Text("\(count)").font(.system(size: 50))
            Button("+"){
                if (self.count + 1)%10 == 0 {
                    WKInterfaceDevice.current().play(.success)
                    self.count = self.count + 1
                    isCelev = true
                }else{
                    self.count = self.count + 1
                    WKInterfaceDevice.current().play(.success)
                }
            }.alert(isPresented: $isCelev, content: {
                Alert(title: Text("축하합니다!"),message: Text("벌써 \(count) 마리!").font(.largeTitle))
            })
            /*Button(action: {
            if self.count != 0 {
                self.count = self.count - 1
            }
            else{
                let btnEmpty = Alert.Button.default(Text("Test"))
                    return Alert(title: Text("이미 0마리 입니다."),message: Text("잘좀 누르시지예"))
                }
            })
            {
                Text("-").font(.headline)
            }*/
            HStack{
                Button("-"){ //두 번 누르거나 어망에서 나간 경우 하나 지우는 용도
                    if self.count != 0{
                        self.count = self.count-1
                    }
                    else{
                        isEmpty = true
                    }
                }.alert(isPresented: $isEmpty, content: {
                    Alert(title: Text("한 마리도 잡지 못했습니다."),message: Text("마이너스 하시게요?"))
                })
                
                Button("Reset"){ //초기화
                    isShowAlert = true
                }.alert(isPresented: $isShowAlert, content: {
                    //Alert(title: Text("초기화를 진행합니다."),message: Text("OK를 누르면 초기화됩니다."))
                    let btnCancel = Alert.Button.destructive(Text("Cancel")){
                        WKInterfaceDevice.current().play(.notification)
                    }
                    let btnSelect = Alert.Button.default(Text("OK"), action: {
                        WKInterfaceDevice.current().play(.notification)
                        self.count = 0
                    })
                    return Alert(title: Text("Warning"),
                                         message: Text("정말 초기화 하시겠습니까?"),
                                         primaryButton: btnCancel,
                                         secondaryButton: btnSelect)
                })
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
