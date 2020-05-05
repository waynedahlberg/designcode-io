//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Wayne Dahlberg on 5/4/20.
//  Copyright © 2020 Wayne Dahlberg. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData /// Now we can use this from any view in the app
}
