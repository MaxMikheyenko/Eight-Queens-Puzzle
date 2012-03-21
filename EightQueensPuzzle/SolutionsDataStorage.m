//
//  SolutionsDataStorage.m
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SolutionsDataStorage.h"
#import "EightQueensPuzzleSolution.h"

//A static instance
static SolutionsDataStorage* SolutionsDataStorageInstance = nil;


@implementation SolutionsDataStorage

#pragma mark -
#pragma mark Singleton Initialization


//A shared instance of the singleton
+(SolutionsDataStorage*)sharedInstance
{
	@synchronized([SolutionsDataStorage class])
	{
		if (!SolutionsDataStorageInstance){
            
			[[self alloc] init];
		}
		
		return SolutionsDataStorageInstance;
	}
	
	return nil;
}

//All Methods that affect the reference count are overridden to do nothing
-(oneway void) release
{
    
}

-(id)autorelease
{
    return self;
}

-(id)retain
{
    return self;
}


+(id)alloc
{
	@synchronized([SolutionsDataStorage class])
    {
		NSAssert(SolutionsDataStorageInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		SolutionsDataStorageInstance = [super alloc];
		return SolutionsDataStorageInstance;
	}
	
	return nil;
}

#pragma mark - Data Storage Functions

-(id) init
{
    if(self = [super init])
    {
        solutions = [[NSMutableArray alloc] init];
        [EightQueensPuzzleSolution StartSolving];
    }
    return self;
}

//Add a new solution to the storage
-(void) AddSolution:(NSMutableArray*)_solution
{
    [solutions addObject:[self ConvertToChessNotation:_solution]];  
}

//Return a solution based on the index
-(NSMutableArray*) SolutionAtIndex:(int) index
{
    if(index<=[solutions count])
    {
        return [solutions objectAtIndex:index];
    }
    return nil;
}

//Return the total number of solutions in the storage
-(int) TotalNumberOfSolutions
{
    return [solutions count];
}

#pragma mark - Data Conversion Functions

//Convert the data array given to chess notation (A-H columns, 1-8 rows)
-(NSMutableArray*) ConvertToChessNotation:(NSMutableArray *)_solution
{
    NSMutableArray* _tempArray = [[[NSMutableArray alloc]init]autorelease];
    
    //Cycle through all 8 queens in the solution
    for(int i=0;i<8;i++)
    {
        //Convert the data
        CGPoint _queenData = [[_solution objectAtIndex:i]CGPointValue];
        NSString* _solutionData = [NSString stringWithFormat:@"%@%.0f", [self DigitToLetter:(int)_queenData.x],_queenData.y+1];
        
        //Populate a new array with the data
        [_tempArray addObject:_solutionData];
    }
    return _tempArray;
}

//Convert CGPoint coordinates to chess notation (the function is not used in current implementation)
-(NSString*)ConvertCGPointToChessNotation:(CGPoint)_cgPointPosition
{
    return [NSString stringWithFormat:@"%@%.0f", [self DigitToLetter:(int)_cgPointPosition.x],_cgPointPosition.y+1];        
}

//Convert chess notation to CHPoint so that it can be used to show the solution on the screen
-(CGPoint)ConvertChessNotationToCGPoint:(NSMutableString*)_chessNotation
{
    //Map all the letters
    NSArray* _map = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H", nil];
    
    //Convert and return
    float _xCoordinate = [_map indexOfObject:[_chessNotation substringToIndex:1]];
    float _yCoordinate = [[_chessNotation substringFromIndex:1]floatValue]-1;
    return CGPointMake(_xCoordinate,_yCoordinate);
}

//Convert the digit that represents a column to a chess notation letter
-(NSString*) DigitToLetter:(int)_digit
{
    //Map all the letters
    NSArray* _map = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H", nil];
    
    //Find and return the appropriate index
    return [_map objectAtIndex:_digit]; 
    
}

@end
