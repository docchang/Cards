//
//  CardTableViewController.h
//  Cards
//
//  Created by Dominic Chang on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardTableViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView * currentCardImage;
@property (nonatomic, strong) IBOutlet UILabel * currentCardDesc;
@property (nonatomic, strong) IBOutlet UILabel * numberOfCardsLeft;

- (IBAction)showShoe:(id)sender;
- (IBAction)deal:(id)sender;

@end
