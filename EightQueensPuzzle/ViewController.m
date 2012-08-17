//
//  ViewController.m
//  EightQueensPuzzle
//
//  Created by Max Mikheyenko on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SolutionsDataStorage.h"

@implementation ViewController
@synthesize currentSolutionNumberLabel;
@synthesize currentSolution;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Since the first solution is shown, the "prev" button is disabled
    [PrevButton setUserInteractionEnabled:NO];
    currentSolution = [[NSMutableArray alloc] init];
    currentSolutionIndex = 0;
    currentSolutionNumberLabel.text = [NSString stringWithFormat:@"%i",currentSolutionIndex+1];
    
    //Display the first solution
    [self DrawSolution:[[SolutionsDataStorage sharedInstance] SolutionAtIndex:currentSolutionIndex]];
}

- (void)viewDidUnload
{
    [self setCurrentSolutionNumberLabel:nil];
    [PrevButton release];
    PrevButton = nil;
    [NextButton release];
    NextButton = nil;
    [ChessBoard release];
    ChessBoard = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [currentSolutionNumberLabel release];
    [PrevButton release];
    [NextButton release];
    [ChessBoard release];
    [super dealloc];
}

#pragma mark - View Controller Functions

//Jump to the previous solution
- (IBAction)HandlePrevButton:(id)sender
{
    [NextButton setUserInteractionEnabled:YES];
    
    currentSolutionIndex--;
    [self DrawSolution:[[SolutionsDataStorage sharedInstance] SolutionAtIndex:currentSolutionIndex]];

    if(currentSolutionIndex==0)
    {
        [PrevButton setUserInteractionEnabled:NO];
    }
    currentSolutionNumberLabel.text = [NSString stringWithFormat:@"%i",currentSolutionIndex+1];

}

//Jump to the next solution 
- (IBAction)HandleNextButton:(id)sender
{
    [PrevButton setUserInteractionEnabled:YES];
    
    currentSolutionIndex++;
    [self DrawSolution:[[SolutionsDataStorage sharedInstance] SolutionAtIndex:currentSolutionIndex]];
    
    if(currentSolutionIndex==[[SolutionsDataStorage sharedInstance] numberOfSolutions]-1)
    {
        [NextButton setUserInteractionEnabled:NO];
    }
    currentSolutionNumberLabel.text = [NSString stringWithFormat:@"%i",currentSolutionIndex+1];


}

//Draw the solution on the screen
-(void) DrawSolution:(NSArray*) _solution
{
    [self ClearBoard];
    for(int i=0;i<8;i++)
    {
        UIImageView* _queen = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"queen.png"]]autorelease];
        CGPoint _queenPosition = [[SolutionsDataStorage sharedInstance] ConvertChessNotationToCGPoint:[_solution objectAtIndex:i]];
        [_queen setFrame:CGRectMake(_queenPosition.x*30, _queenPosition.y*30, 30, 30)];
    [ChessBoard addSubview:_queen];
    }
}

//Remove the previous eight queens when a new solution should be displayed
-(void) ClearBoard
{
    for(UIView* _queen in [ChessBoard subviews])
    {
        [_queen removeFromSuperview];
    }
}
@end
