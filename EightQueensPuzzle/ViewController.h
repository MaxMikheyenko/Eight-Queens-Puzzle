//
//  ViewController.h
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentSolutionIndex;
    NSMutableArray* currentSolution;
    IBOutlet UIButton *PrevButton;
    IBOutlet UIButton *NextButton;
    IBOutlet UIImageView *ChessBoard;
}
@property (retain, nonatomic) NSMutableArray* currentSolution;
@property (retain, nonatomic) IBOutlet UILabel *currentSolutionNumberLabel;
- (IBAction)HandlePrevButton:(id)sender;
- (IBAction)HandleNextButton:(id)sender;
- (void) DrawSolution:(NSArray*) _solution;
- (void) ClearBoard;
@end
