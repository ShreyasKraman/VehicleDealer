//
//  exceptionHandler.swift
//  EmptyApp
//
//  Created by Shreyas Kalyanaraman on 10/27/18.
//  Copyright © 2018 rab. All rights reserved.
//

import Foundation

class exceptionHandler{
    enum ThrowError:Error{
        case IllegalArgumentException
    }
    
    func throwError() -> ThrowError{
        return .IllegalArgumentException
    }
    
}
