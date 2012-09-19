//
//  SFSingltonObject.m
//  SFSinglton
//
//  Created by Plato on 8/24/12.
//  Copyright (c) 2012 hand. All rights reserved.
//

#import "SFSingletonObject.h"

static NSMutableDictionary * _gSingltonSet;

@implementation SFSingletonObject

+(id)shareObject
{
    if (_gSingltonSet == nil) {
        _gSingltonSet =[[NSMutableDictionary alloc]init];
    }
    
    NSString * className = [NSString stringWithUTF8String:object_getClassName(self)];
    @synchronized(self){
        if ([_gSingltonSet valueForKey:className] == nil)
        {
            id object = [[[self alloc] init] autorelease];
            [_gSingltonSet setObject:object forKey:className];
        }
    }
    return  [_gSingltonSet valueForKey:className];
}

+(id) allocWithZone:(NSZone *)zone{
    @synchronized(self){
        NSString * className = [NSString stringWithUTF8String:object_getClassName(self)];
        if ([_gSingltonSet valueForKey:className] == nil) {
            id object = [super allocWithZone:zone];
            [_gSingltonSet setValue:object forKey:className];
            return  object;
        }
    }
    
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

-(unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (id)autorelease
{
    return self;
}

-(oneway void)release
{
    
}

@end
