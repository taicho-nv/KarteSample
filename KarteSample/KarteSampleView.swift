//
//  ContentView.swift
//  KarteSample
//
//  Created by 今村圭佑 on 2022/08/26.
//

import SwiftUI
import KarteCore
import opencv2

struct KarteSampleView: View {
    @State private var eventName = "favorite"
    @State private var showingAlert = false
    var body: some View {
        VStack{
            Text("Karte Sample App")
                .padding()
            TextField("イベント名", text: $eventName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black, width: 1)
                .padding()
            Button("送信"){
                print("ログが送信されました")
                
                //event logをKarteを使って送信する
                Tracker.track(eventName, values: [:])
                showingAlert = true
            }.alert(isPresented: $showingAlert) {
                showingAlert = false
                return Alert(title: Text("ログが送信されました"),
                             message: Text("イベントログ「\(eventName)」がKarte Insightに送信されました"))
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KarteSampleView()
    }
}
