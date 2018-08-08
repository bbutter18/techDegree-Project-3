//
//  Event.swift
//  'BoutTimeApp
//
//  Created by Woodchuck on 8/8/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//

import Foundation


struct eventCreator {

    var event: String
    var date: Int
    
    init(event: String, date: Int) {
        self.event = event
        self.date = date
    }
}

extension eventCreator: Equatable {

    static func == (lhs: eventCreator, rhs: eventCreator) -> Bool {
        return lhs.event == rhs.event
    }
}


