//
//  Solution.m
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Solution.h"


@implementation Solution

@dynamic solutionID;
@dynamic queensPositions;

- (void)initWithData:(NSMutableArray *)data index:(int)index
{
    self.queensPositions = data;
    self.solutionID = [NSNumber numberWithInt:index];
}

@end
