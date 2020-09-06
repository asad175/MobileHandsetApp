//
//  Result.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/4/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
