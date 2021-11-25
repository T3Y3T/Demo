//
//  ItemRow.swift
//  AKADaommoCodeChallenge
//
//  Created by tongtong on 11/24/21.
//

import Foundation
import SwiftUI

struct ItemRow : View {
    let item: MeetingItem

    var body: some View {
        VStack(alignment: .leading) {
                Text(item.name)
                Text("Duration time for hours: \(item.duration)")
                Text("Presenters: \(item.restrictions)")
            }
    }
}
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MeetingItem.example)
    }
}
