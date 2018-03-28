//
//  LinearLightsOutGame.h
//  Lights Out
//
//  Created by Ryan Greenlee on 3/28/18.
//  Copyright © 2018 Ryan Greenlee. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_NUM_LIGHTS 100

@interface LinearLightsOutGame : NSObject {
    BOOL lightStates[MAX_NUM_LIGHTS];
}

@property (nonatomic) NSInteger movesTaken;
@property (nonatomic) int numLights;

- (id) initWithNumLights:(NSInteger) numLights;
- (BOOL) pressedLightAtIndex:(NSInteger) lightIndex; // returns YES if won
- (BOOL) isLightOnAtIndex:(NSInteger) lightIndex;
- (BOOL) checkForWin;

@end
