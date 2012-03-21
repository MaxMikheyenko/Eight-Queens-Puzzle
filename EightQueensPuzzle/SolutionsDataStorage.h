//
//  SolutionsDataStorage.h
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolutionsDataStorage : NSObject
{
    NSMutableArray* solutions;
}

+(SolutionsDataStorage*)sharedInstance;

-(void) AddSolution:(NSMutableArray*)_solution;
-(NSMutableArray*) SolutionAtIndex:(int) index;
-(int) TotalNumberOfSolutions;
-(NSMutableArray*) ConvertToChessNotation:(NSMutableArray*) _solution;
-(NSString*) DigitToLetter:(int)_digit;
-(CGPoint)ConvertChessNotationToCGPoint:(NSMutableString*)_chessNotation;
-(NSString*)ConvertCGPointToChessNotation:(CGPoint)_cgPointPosition;
@end
