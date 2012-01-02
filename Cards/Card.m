//
//  Card.m
//  Cards
//
//  Created by Dominic Chang on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Card.h"

@implementation CardUtility

static NSDictionary * cardNames;
NSString * const kFace = @"Face";
NSString * const kSuit = @"Suits";
NSString * const kRank = @"Ranks";

+ (void) initialize {
	cardNames = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CardNames" ofType:@"plist"]];
}

+ (NSString *)suitName:(CardSuit)suit {
	return (NSString *)[(NSArray *)[cardNames objectForKey:kSuit] objectAtIndex:suit];
}

+ (NSString *)rankName:(CardRank)rank; {
	return (NSString *)[(NSArray *)[cardNames objectForKey:kRank] objectAtIndex:rank];
}

+ (NSString *)faceName:(CardRank)rank {
	return (NSString *)[(NSArray *)[cardNames objectForKey:kFace] objectAtIndex:rank];
}

@end




@implementation Card

@synthesize rank;
@synthesize suit;

- (id) initWithSuit:(CardSuit)s rank:(CardRank)r {
	if ((self = [super init])) {
		suit = s;
		rank = r;
	}
	return self;
}
- (NSString *) description {
	return [NSString stringWithFormat:@"%@ of %@", [CardUtility rankName:rank], [CardUtility suitName:suit]];
}
- (NSString *)imageName {
	return [NSString stringWithFormat:@"%@-%@-150.png",
			[[CardUtility suitName:suit] lowercaseString], 
			[CardUtility faceName:rank]];
}
- (UIImage *)cardImage {
	return [UIImage imageNamed:[self imageName]];
}

@end






@interface Deck()

@property (nonatomic, assign) NSUInteger currentIndex;

@end


@implementation Deck
@synthesize currentIndex;

@synthesize numberOfDecks;
@synthesize shoe;

NSUInteger const kNumberOfSuits = 4;
NSUInteger const kNumberOfRanks = 13;
NSUInteger const kNumberOfCardsPerDeck = kNumberOfSuits * kNumberOfRanks;

- (id) initWithNumDecks: (NSUInteger) numDecks {
	if ((self = [super init])) {		
		//allocate the shoe
		shoe = [[NSMutableArray alloc] initWithCapacity:numDecks * kNumberOfCardsPerDeck];

		//add decks
		[self addDecks:numDecks];
		
		currentIndex = 0;
	}
	return self;
}

- (NSString *) description {
	return [NSString stringWithFormat:@"%d decks\n%@", numberOfDecks, shoe];
}

- (void) addDecks: (NSUInteger) numDecks {
	numberOfDecks += numDecks;
	
	//given number of decks
	for (int d = 0; d < numDecks; d++) {
		
		//game specified number of suits
		for (CardSuit s = spades; s < kNumberOfSuits; s++) {
			
			//game specified number of ranks
			for (CardRank r = Ace; r < kNumberOfRanks; r++) {
				
				//create card and insert into the shoe
				[shoe addObject:[[Card alloc] initWithSuit:s rank:r]];
			}
		}			
	}
}

- (Card *) currentCard {
	return [shoe objectAtIndex:currentIndex];
}

- (Card *) deal {
	if (currentIndex < shoe.count) {
		return [shoe objectAtIndex:currentIndex++];
	}
	return nil;
}

- (NSInteger) count {
	return self.shoe.count - currentIndex;
}

- (Card *)cardAtIndex:(NSUInteger)index {
	if (currentIndex + index < shoe.count) {
		return [shoe objectAtIndex:currentIndex + index];
	}
	return nil;
}

+ (NSInteger) getRandFrom: (NSInteger) min to: (NSInteger) max {
	return (arc4random() % (max - min)) + min; 
}


/**
 Simple shuffle: each card gets a random index between 0 to shoe.count
 */
- (void) shuffle {
	if (currentIndex == shoe.count) {
		currentIndex = 0;
	}
	
	for (int i = currentIndex; i < shoe.count; i++) {		
		[shoe exchangeObjectAtIndex:i
				  withObjectAtIndex:[Deck getRandFrom:currentIndex to:shoe.count]];
	}
}


@end