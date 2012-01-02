//
//  Card.h
//  Cards
//
//  Created by Dominic Chang on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	spades,
	hearts,
	clubs,
	diamonds
} CardSuit;

typedef enum {
    Ace,
	Two,
	Three,
	Four,
	Five,
	Six,
	Seven,
	Eight,
	Nine,
	Ten,
	Jack,
	Queen,
	King
} CardRank;



@interface CardUtility : NSObject

+ (NSString *)suitName:(CardSuit)suit;
+ (NSString *)rankName:(CardRank)rank;
+ (NSString *)faceName:(CardRank)rank;

@end




@interface Card : NSObject

@property (nonatomic, readonly) CardSuit suit;
@property (nonatomic, readonly) CardRank rank;
@property (nonatomic, readonly) UIImage * cardImage;

@end




@interface Deck : NSObject

@property (nonatomic, readonly) NSUInteger numberOfDecks;
@property (nonatomic, readonly) Card * currentCard;
@property (nonatomic, strong) NSMutableArray *shoe;
@property (nonatomic, readonly) NSInteger count;

- (id) initWithNumDecks: (NSUInteger) numDecks;
- (Card *) deal;
- (void) shuffle;
- (Card *) cardAtIndex:(NSUInteger)index;
- (void) addDecks:(NSUInteger) numDecks;

@end
