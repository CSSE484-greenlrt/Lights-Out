//
//  LinearLightsOutGame.m
//  Lights Out
//
//  Created by Ryan Greenlee on 3/28/18.
//  Copyright © 2018 Ryan Greenlee. All rights reserved.
//

#import "LinearLightsOutGame.h"

@implementation LinearLightsOutGame

- (id) initWithNumLights:(NSInteger) numLights {
    for(int i = 0; i < numLights; ++i) {
        lightStates[i] = false;
    }
    NSInteger randomNumber = arc4random_uniform(numLights);
    for (int i = 0; i < randomNumber; ++i) {
        lightStates[arc4random_uniform(numLights)] = true;
    }
    _movesTaken = 0;
    self.numLights = numLights;
    return self;
}

- (BOOL) pressedLightAtIndex:(NSInteger) lightIndex { // returns YES if won
    if ([self checkForWin]) {
        return true;
    }
    lightStates[lightIndex] = !lightStates[lightIndex];
    if (lightIndex == 0) {
        lightStates[lightIndex + 1] = !lightStates[lightIndex + 1];
    } else if (lightIndex == self.numLights - 1) {
        lightStates[lightIndex - 1] = !lightStates[lightIndex - 1];
    } else {
        lightStates[lightIndex + 1] = !lightStates[lightIndex + 1];
        lightStates[lightIndex - 1] = !lightStates[lightIndex - 1];
    }
    _movesTaken += 1;
    return [self checkForWin];
}

- (BOOL) isLightOnAtIndex:(NSInteger) lightIndex {
    return lightStates[lightIndex];
}

- (BOOL) checkForWin {
    for (int i = 0; i < self.numLights; ++i) {
        if (lightStates[i]) {
            return false;
        }
    }
    return true;
}

- (NSString*) description {
    NSString *result = @"Lights: ";
    for (int i = 0; i < self.numLights; ++i) {
        if (lightStates[i]) {
            result = [result stringByAppendingString: @"1"];
        } else {
            result = [result stringByAppendingString: @"0"];
        }
    }
    return [NSString stringWithFormat: @"%@ Moves: %ld", result, (long)[self movesTaken]];
}

@end
