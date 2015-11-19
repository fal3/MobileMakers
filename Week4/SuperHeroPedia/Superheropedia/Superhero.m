//
//  Superhero.m
//  Superheropedia
//
//  Created by alex fallah on 6/1/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "Superhero.h"

@interface Superhero()

@property NSURL *avatarURL;

@end

@implementation Superhero





+(void)fetch:(SuperheroCompletionBlock)block{
    NSMutableArray* heroes = [NSMutableArray new];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *rq = [NSURLRequest requestWithURL:url];

    id q = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:rq queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
         for (NSDictionary *dictionary in json)
         {
             Superhero *hero = [[Superhero alloc]initWithDictionary:dictionary];
             //the array you pass in
             [heroes addObject:hero];
         }

         block(heroes);
     }];
}


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    self.name = [dictionary objectForKey:@"name"];
    self.textDescription = [dictionary objectForKey:@"description"];
    self.avatarURL = [NSURL URLWithString:[dictionary objectForKey:@"avatar_url"]];

    return self;
}

-(void)fetchAvatarImage:(SuperheroAvatarFetchCompletionBlock)block
{
    NSURLRequest *rq = [NSURLRequest requestWithURL:self.avatarURL];
    [NSURLConnection sendAsynchronousRequest:rq queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        block([UIImage imageWithData:data]);
    }];

}

@end
