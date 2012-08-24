//
//  SFSingletonTests.m
//  SFSingletonTests
//
//  Created by Plato on 8/24/12.
//  Copyright (c) 2012 hand. All rights reserved.
//

#import "SFSingletonTests.h"
#import "SFSampleSingleton.h"

@implementation SFSingletonTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    SFSampleSingleton * obj =[SFSampleSingleton shareObject];
    NSLog(@"\n string:%@\n number:%@ \n bool:%i",obj.testString,obj.testNumber,obj.testBool);
    
    STAssertNil([[SFSampleSingleton alloc]init], @"alloc test fialed");
    [obj release];
    STAssertTrue([obj retainCount] == -1, @"did not overwrite relase");
    [obj autorelease];
    STAssertTrue([obj retainCount] == -1, @"did not overwrite autorelease");
    [obj retain];
    STAssertTrue([obj retainCount] == -1, @"did not overwrite retain");
    
    SFSampleSingleton * newObj = [SFSampleSingleton shareObject];
    STAssertTrue((obj == newObj), @"create 2 objects");
    
    SFSampleSingleton2 * obj2 = [SFSampleSingleton2 shareObject];
    SFSampleSingleton3 * obj3 = [SFSampleSingleton3 shareObject];
    STAssertTrue(obj2 == obj3.testObject, @"create 2 different objects of SFSampleSinglton2");
    
    obj2.testArray = @[@"new"];
    STAssertEqualObjects(obj3.testObject.testArray, obj2.testArray, @"create 2 different objects of SFSampleSinglton2");
}

@end
