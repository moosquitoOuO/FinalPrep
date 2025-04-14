//
//  RowView.swift
//  FinalPrep
//
//  Created by MosquitoOuO on 2025-04-13.
//

import SwiftUI

struct RowView: View {
    @Bindable var temp: Tempreture
    var body: some View {
        Text("\(temp.tempreture) C")
    }
}

#Preview {
    @Previewable @State var temp = Tempreture(tempreture: 25.5)
    RowView(temp: temp)
}
