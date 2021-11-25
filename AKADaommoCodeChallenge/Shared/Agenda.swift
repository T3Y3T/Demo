//
//  Agenda.swift
//  AKADaommoCodeChallenge
//
//  Created by tongtong on 11/24/21.
//

import Foundation
import SwiftUI

struct Agenda: Identifiable {
    var id = UUID()
    var date: String
    var link: String
    var presenter: String
}

#if DEBUG
let testData = [
    Agenda(date: "12/10/2021", link: "https://www.youtube.com", presenter:"Sam Li; Ye Liu; Victory Wong"),
    Agenda(date: "12/11/2021", link: "https://www.youtube.com", presenter:"Maria Green; Ye Liu; Victory Wong"),
    Agenda(date: "12/12/2021", link: "https://www.youtube.com", presenter:"Ye Liu; Victory Wong"),
    Agenda(date: "12/13/2021", link: "https://www.youtube.com", presenter:"Saki Min; Ye Liu; Victory Wong"),
    Agenda(date: "12/14/2021", link: "https://www.youtube.com", presenter:"Andy Zhao; Ye Liu; Victory Wong"),
]
#endif

