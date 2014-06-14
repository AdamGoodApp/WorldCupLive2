//
//  ARModal.m
//  WorldCupLive
//
//  Created by Adam Rais on 14/06/2014.
//  Copyright (c) 2014 Adam Rais. All rights reserved.
//

#import "ARModal.h"

@implementation ARModal

-(id)initWithHome:(NSString *)home {
    self = [super init];
    
    if (self) {
        _home = home;
        _away = nil;
        _result = nil;
        _info = nil;
        _homeImage = nil;
    }
    return self;
}

+(id)blogPostWithHome:(NSString *)home {
    return [[self alloc] initWithHome:home];
}

-(NSArray *)blogData {
    NSURL *jsonURL = [NSURL URLWithString:@"http://www.kimonolabs.com/api/2nfgfo2s?apikey=1a1f5f323969d5157af8a8be857026c2"];
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonURL];
    
    NSError *jsonError = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    
    NSArray *jsonArray = [[jsonDictionary objectForKey:@"results"] objectForKey:@"collection1"];
    
    if (blogData == nil) {
        blogData = jsonArray;
    }
    return blogData;
}

-(NSURL *)jsonURL {
    return [NSURL URLWithString:self.homeImage];
}

-(NSString *)bst {

    NSString *sentence = self.result;
    NSString *word = @"-";
    NSString *wordTwo = @"00.00";
    NSString *wordThree = @"01.00";
    NSMutableArray *bstArray = [NSMutableArray array];
    
    if ([sentence rangeOfString:word].location != NSNotFound) {
        NSLog(@"Found the string");
        [bstArray addObject:sentence];
    } else if ([sentence rangeOfString:wordTwo].location != NSNotFound) {
        NSLog(@"time is 23:00");
        [bstArray addObject:@"23:00"];
    } else if ([sentence rangeOfString:wordThree].location != NSNotFound) {
        NSLog(@"time is 00:00");
        [bstArray addObject:@"00:00"];
    } else {
        float floatOne = [sentence floatValue];
        float floatFinal = floatOne - 1.000000;
        NSString *str = [NSString stringWithFormat:@"%f", floatFinal];
        NSString *bstFinal = [str substringToIndex:[str length] - 4];
        [bstArray addObject:bstFinal];
    }
    return [bstArray objectAtIndex:0];
}

@end
