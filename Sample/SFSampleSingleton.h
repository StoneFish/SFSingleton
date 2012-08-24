//
//  SFSampleSinglton.h
//  SFSinglton
//
//  Created by Plato on 8/24/12.
//  Copyright (c) 2012 hand. All rights reserved.
//

#import "SFSingletonObject.h"
#import "TTCorePreprocessorMacros.h"


/////////////////////////////////////////////////////////
@interface SFSampleSingleton : SFSingletonObject

@property(nonatomic,copy) NSString * testString;
@property(nonatomic,retain) NSNumber * testNumber;
@property(nonatomic,assign) BOOL testBool;

@end


/////////////////////////////////////////////////////////
@interface SFSampleSingleton2 : SFSingletonObject

@property(nonatomic,copy) NSArray * testArray;
@property(nonatomic,retain) NSDictionary * testDictionary;

@end


/////////////////////////////////////////////////////////
@interface SFSampleSingleton3 : SFSingletonObject

@property(nonatomic,copy) SFSampleSingleton2 * testObject;

@end