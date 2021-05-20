//
//  ContentView.swift
//  PizzaHistoryMap
//
//  Created by Steven Lipton on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    @State var historyItems:[HistoryItem] = HistoryModel().historyItems
    @State var id:Int = 0
    var body: some View {
        VStack{
            Picker(selection: $id, label: Text("Pizza History").font(.headline)) {
                ForEach(historyItems){ item in
                    Text(item.name)
                }
            }.pickerStyle(MenuPickerStyle())
            PizzaHistoryView(history: .constant(historyItems[id]))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
