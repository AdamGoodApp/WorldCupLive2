//
//  ARModal.h
//  WorldCupLive
//
//  Created by Adam Rais on 14/06/2014.
//  Copyright (c) 2014 Adam Rais. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARModal : NSObject {
    NSArray *blogData;
}

@property(nonatomic,strong) NSString *home;
@property(nonatomic,strong) NSString *away;
@property(nonatomic,strong) NSString *result;
@property(nonatomic,strong) NSString *info;
@property(nonatomic,strong) NSString *homeImage;
@property(nonatomic,strong,readonly) NSArray *blogData;
@property(nonatomic,strong) NSMutableArray *jsonMutable;

-(id)initWithHome:(NSString *)home;
+(id)blogPostWithHome:(NSString *)home;

-(NSURL *)jsonURL;
-(NSString *)bst;
-(UIImage *)imageUI;

@end
