//
//  EightQueensPuzzleTests.m
//  EightQueensPuzzleTests
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EightQueensPuzzleTests.h"
#import "SolutionsDataStorage.h"

@implementation EightQueensPuzzleTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//Check that the algorithm found all 92 solutions to the problem
- (void)testNumberOfSolutions
{
    int _solutions = [[SolutionsDataStorage sharedInstance] TotalNumberOfSolutions];
    STAssertEquals(_solutions, 92, @"Incorrect Number of Solutions", _solutions);
}

@end
