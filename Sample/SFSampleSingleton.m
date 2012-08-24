//
//  SFSampleSinglton.m
//  SFSinglton
//
//  Created by Plato on 8/24/12.
//  Copyright (c) 2012 hand. All rights reserved.
//

#import "SFSampleSingleton.h"

@implementation SFSampleSingleton
@synthesize testString = _testString;
@synthesize testNumber = _testNumber;
@synthesize testBool = _testBool;

- (id)init
{
    self = [super init];
    if (self) {
        self.testString = @"test";
        self.testNumber = @1;
        self.testBool = YES;
    }
    return self;
}

- (void)dealloc
{
    TT_RELEASE_SAFELY(_testString);
    TT_RELEASE_SAFELY(_testNumber);
    [super dealloc];
}
@end

/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
@implementation SFSampleSingleton2
@synthesize testArray = _testArray;
@synthesize testDictionary = _testDictionary;

- (id)init
{
    self = [super init];
    if (self) {
        self.testArray = @[ @"1",@"2",@3 ];
        self.testDictionary = @{ @"1-1" : @"1",@"2-2":@2};
    }
    return self;
}

- (void)dealloc
{
    TT_RELEASE_SAFELY(_testArray);
    TT_RELEASE_SAFELY(_testDictionary);
    [super dealloc];
}
@end


/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
@implementation SFSampleSingleton3
@synthesize testObject = _testObject;

- (id)init
{
    self = [super init];
    if (self) {
        self.testObject = [SFSampleSingleton2 shareObject];
    }
    return self;
}

- (void)dealloc
{
    TT_RELEASE_SAFELY(_testObject);
    [super dealloc];
}
@end