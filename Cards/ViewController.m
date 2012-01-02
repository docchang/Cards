//
//  ViewController.m
//  Cards
//
//  Created by Dominic Chang on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize cardTableView;
@synthesize theShoe;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)addDeckPressed:(id)sender {
	[theShoe addDecks:1];
	[cardTableView reloadData];
	
	self.title = [NSString stringWithFormat:@"%d of decks", self.theShoe.numberOfDecks];
}

- (void) shuffle {
	[theShoe shuffle];
	[cardTableView reloadData];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	

	
	UIBarButtonItem *shuffleBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Shuffle"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(shuffle)];
	[self.navigationItem setRightBarButtonItem:shuffleBarButton];
	
	
	
	
	self.theShoe = [[Deck alloc] initWithNumDecks:1];
	
	self.cardTableView.delegate = self;
	self.cardTableView.dataSource = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{	
    [super viewWillAppear:animated];
	[cardTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

NSString * const kCardTableCellIdentifier = @"CardTableCellIdentifier";

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger) tableView: (UITableView *)table numberOfRowsInSection: (NSInteger) section {
    return theShoe.count;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//reusing cell
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCardTableCellIdentifier];
    
    //create new cell if no reuse cell available 
	if (cell == nil) {
        //initWithStyle is the replacement for initWithFrame: reuseIdentifier
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCardTableCellIdentifier];
    }
	
	//set the color
	cell.contentView.backgroundColor = [UIColor grayColor];
	
	Card * aCard = [theShoe cardAtIndex:indexPath.row];
	[cell.imageView setImage:aCard.cardImage];
	[cell.textLabel setText:aCard.description];
	
	return cell;
}


@end
