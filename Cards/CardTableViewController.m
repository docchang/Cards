//
//  CardTableViewController.m
//  Cards
//
//  Created by Dominic Chang on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CardTableViewController.h"
#import "ViewController.h"

@interface CardTableViewController()

@property (nonatomic, strong) IBOutlet ViewController *shoeViewController;

@end


@implementation CardTableViewController

@synthesize shoeViewController;
@synthesize currentCardImage;
@synthesize currentCardDesc;
@synthesize numberOfCardsLeft;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) updateNumberOfCards {
	numberOfCardsLeft.text = [NSString stringWithFormat:@"%d cards left", shoeViewController.theShoe.count];
}

- (IBAction)showShoe:(id)sender {
	[self.navigationController pushViewController:shoeViewController animated:YES];
}

- (IBAction)deal:(id)sender {
	Card *dealtCard = [shoeViewController.theShoe deal];
	
	[currentCardImage setImage:dealtCard.cardImage];
	[currentCardDesc setText:dealtCard.description];
	
	[self updateNumberOfCards];
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self updateNumberOfCards];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
