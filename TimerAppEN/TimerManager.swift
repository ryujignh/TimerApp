//
//  TimerManager.swift
//  TimerAppEN
//
//  Created by Ryuji Ganaha on 2020/11/07.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    
    @Published var secondsLeft = 60
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.reset()
                timer.invalidate()
            }
            self.secondsLeft -= 1
            
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = 60
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
}
