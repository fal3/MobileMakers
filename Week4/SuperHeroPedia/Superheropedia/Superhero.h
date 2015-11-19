//
//  Superhero.h
//  Superheropedia
//
//  Created by alex fallah on 6/1/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SuperheroCompletionBlock)(NSArray*);
typedef void (^SuperheroAvatarFetchCompletionBlock)(UIImage *image);

@interface Superhero : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *textDescription;




-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


+(void)fetch:(SuperheroCompletionBlock)block;

-(void)fetchAvatarImage:(SuperheroAvatarFetchCompletionBlock)block;

@end
