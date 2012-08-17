//
//  Solution.h
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Solution : NSManagedObject

@property (nonatomic, retain) NSNumber * solutionID;
@property (nonatomic, retain) NSMutableArray * queensPositions;

- (void)initWithData:(NSMutableArray *)data index:(int)index;

@end
