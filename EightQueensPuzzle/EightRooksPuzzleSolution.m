//
//  EightRooksPuzzleSolution.m
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EightRooksPuzzleSolution.h"
#import "SolutionsDataStorage.h"

@implementation EightRooksPuzzleSolution

//A static function that initiates a class instance and launches the solving algorythm
+(void) StartSolving
{
    NSMutableArray* _boardArray = [[[NSMutableArray alloc]init]autorelease];
    EightRooksPuzzleSolution* _tempInstance = [[[EightRooksPuzzleSolution alloc] init] autorelease];
    [_tempInstance PlacePiece:_boardArray];
}

//A function that cycles through the partial solutions in an attempt to find a complete solution
-(void) PlacePiece:(NSMutableArray*) _currentBoard
{
    //Cycle through all 8 horizontal positions
    for(int i=0;i<8;i++)
    {
        //The number of rooks already on the board (determines the y-coordinate of a new rook)
        int _numberOfRooks = [_currentBoard count];
        
        //Create a new rook and adds it to solutions array
        CGPoint _coordinates = CGPointMake(i,_numberOfRooks);
        [_currentBoard addObject:[NSValue valueWithCGPoint:_coordinates]];
      
        //Check if a new rook is valid based on the already-placed rooks
        if([self CheckNewPieceValidity:_currentBoard])
        {
            //If there are 8 rooks on the board we have a solution
            if([_currentBoard count]==8)
            {
                //Add the solution to the storage
                [[SolutionsDataStorage sharedInstance] AddSolution:_currentBoard];
            } else {
                //If there are fewer than 8 rooks on the board
                //place the next rook by calling the same function recursively
                [self PlacePiece:_currentBoard];
            }
        }
        //If the new rook conflicts with the rooks already on the board - remove it
        [_currentBoard removeLastObject];
    }
}

//Check if the newly placed rook is valid
-(BOOL) CheckNewPieceValidity:(NSArray*) _CurrentBoard
{    
    CGPoint _lastRookPosition = [[_CurrentBoard lastObject] CGPointValue];
    
    //Check against all rooks in the array (except for the last one, which is our current rook)
    for(int i=0; i<[_CurrentBoard count]-1;i++)
    {
        //We check only the x position, since the algorithm doesn't allow for two rooks to be placed on the same row
        if(_lastRookPosition.x == [[_CurrentBoard objectAtIndex:i]CGPointValue].x)
        {
            return NO;
        }
    }
    return YES;
}


@end
