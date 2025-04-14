//
//  ContentView.swift
//  FinalPrep
//
//  Created by MosquitoOuO on 2025-04-13.
//

import SwiftUI
import SwiftData
//struct DetailView: View{
//    @Binding var tempreture: Double
//    var body: some View{
//        HStack{
//            Slider(value: tempreture)
//        }
//        
//    }
//}





struct ContentView: View {
//    @State private var current = 0
//    @State private var gaugeList = ["gauge.with.dots.needle.0percent", "gauge.with.dots.needle.33percent", "gauge.with.dots.needle.50percent", "gauge.with.dots.needle.67percent", "gauge.with.dots.needle.100percent"]
//    func decGauge(){
//        if(current > 0){
//            current -= 1
//        }
//    }
//    func incGauge(){
//        if(current < gaugeList.count - 1){
//            current += 1
//        }
//    }
//    
//    var body: some View {
//        HStack{
//            Button(action: decGauge){
//                Image(systemName: "arrowshape.left").resizable().frame(width: 50, height: 50)
//            }
//            Image(systemName: gaugeList[current]).resizable().frame(width: 50, height: 50)
//            Button(action: incGauge){
//                Image(systemName: "arrowshape.right").resizable().frame(width: 50, height: 50)
//            }
//        }
//    }
//    @State private var pickedColor = Color.blue
//    @State private var showPicker = false
//    func openColorPicker(){
//            
//    }
//    var body: some View {
//        NavigationStack{
//            VStack{
//                Image(systemName: "globe").resizable().frame(width: 50, height: 50).foregroundStyle(pickedColor)
//                
//            }
//            .toolbar{
//                ToolbarItemGroup{
//                    ColorPicker("", selection: $pickedColor).opacity(20).overlay(
//                        Image(systemName: "paintbrush.fill")
//                            .foregroundColor(.primary))
//                }
//            }
//        }
//    }
    @Query private var temps: [Tempreture]
    @Environment(\.modelContext) private var modelContext
    var body: some View{
        VStack{
            NavigationStack{
                VStack {
                    List{
                        ForEach(temps) { temp in
                            NavigationLink(destination: DetailView(temp: temp)) {
                                RowView(temp: temp)
                                                    .frame(width:100, height:100)
                            }
                        }.onDelete{
                            if let index = $0.first{
                                modelContext.delete(temps[index])
                            }
                        }
                    }
                }.toolbar{
                    HStack{
                        EditButton()
                        Button(action: addTemp){
                            Image(systemName: "plus")
                        }
                    
                    }
                }
            }
        }
    }
    func addTemp(){
        let newTemp = Tempreture(tempreture: 25.5)
        modelContext.insert(newTemp)
    }


    
}
struct DetailView: View{
    @Bindable var temp: Tempreture
    var body: some View{
        HStack{
            Slider(value: $temp.tempreture, in: -50...50)
            Text("\(temp.tempreture, specifier: "%.1f")°C")
        }

    }
}

#Preview {
    ContentView()
            .modelContainer(for: Tempreture.self)
}
