//
//  EightRooksPuzzleSolution.h
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EightRooksPuzzleSolution : NSObject

-(void) PlacePiece:(NSMutableArray*) _currentBoard;
-(BOOL) CheckNewPieceValidity:(NSArray*) _currentBoard;
+(void) StartSolving;
@end
