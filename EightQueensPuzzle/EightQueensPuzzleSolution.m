//
//  EightQueensPuzzleSolution.m
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EightQueensPuzzleSolution.h"

@implementation EightQueensPuzzleSolution

//A static function that initiates a class instance and launches the solving algorythm
+(void) StartSolving
{
    NSMutableArray* _boardArray = [[[NSMutableArray alloc]init]autorelease];
    
    EightQueensPuzzleSolution* _tempInstance = [[[EightQueensPuzzleSolution alloc]init]autorelease];

    //Place Piece method is not overridden in this class - super implementation is used
    [_tempInstance PlacePiece:_boardArray];
}

//Check if the queen postion is valid
-(BOOL) CheckNewPieceValidity:(NSArray *)_currentBoard
{
    //Call super method to find out if there are no other queens in the same column
    if([super CheckNewPieceValidity:_currentBoard])
    {
        //Add a check against other queens that can attack the current queen diagonally
        CGPoint _currentQueen = [[_currentBoard objectAtIndex:[_currentBoard count]-1]CGPointValue];
        for(int i=0; i<[_currentBoard count]-1;i++)
        {
            CGPoint _queenOnBoard = [[_currentBoard objectAtIndex:i]CGPointValue];
            
            int _verticalDifference = _currentQueen.y - _queenOnBoard.y;
            
            if(_currentQueen.x + _verticalDifference == _queenOnBoard.x ||
               _currentQueen.x - _verticalDifference == _queenOnBoard.x)
            {
                return NO;
            }
        }
    } else {
        //If the rook check (super) failed, return NO
        return NO;
    }
    //If all checks are passed return YES
    return YES;
}


@end
