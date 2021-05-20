//
//  PizzaHistoryView.swift
//  HuliPizzaPages
//
//  Created by Steven Lipton on 5/16/21.
//

import SwiftUI
import MapKit

struct PizzaHistoryView:View{
    @Binding var history:HistoryItem
    var mapRect:MKMapRect{
        let size = MKMapSize(width:5000000, height:5000000)
        let centerCoordinate = CLLocationCoordinate2D(latitude: history.latitude, longitude: history.longitude)
        var origin = MKMapPoint(centerCoordinate)
        origin.x -= size.width / 2.0
        origin.y -= size.height / 2.0
        return MKMapRect(origin: origin, size:size)
    }
    var body:some View{
        VStack {
            HStack {
                Spacer()
                Text("History of " +  history.name + " Pizza")
                    .font(.headline)
                
            }
            Map(mapRect: .constant(mapRect), annotationItems:[history]){ item in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude:item.latitude, longitude: item.longitude), tint: .blue)
            }
                .frame(height:200)
                .padding(.bottom)
            
            ScrollView{
                Text(history.history)
            }
        }
        
    }
}

struct PizzaHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaHistoryView(history: .constant(HistoryModel().historyItems[9]))
    }
}
