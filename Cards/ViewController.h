//
//  ViewController.h
//  Cards
//
//  Created by Dominic Chang on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView * cardTableView;
@property (nonatomic, strong) Deck * theShoe;

- (IBAction)addDeckPressed:(id)sender;

@end
