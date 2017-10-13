//
//  Vampire.m
//  Vampr-iOS
//
//  Created by Sam Meech-Ward on 2017-10-13.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "Vampire.h"

@implementation Vampire

- (instancetype)initWithName:(NSString *)name yearConverted:(int)yearConverted {
    self = [super init];
    if (self) {
        _name = name;
        _yearConverted = yearConverted;
    }
    return self;
}

- (Vampire *)closestCommonAncestorTo:(Vampire *)vampire { 
    return nil;
}

- (BOOL)isMoreSeniorThan:(Vampire *)vampire { 
    return NO;
}

- (NSUInteger)numberOfVampiresFromOriginal { 
    return 0;
}

- (NSUInteger)numberOfOffspring { 
    return 0;
}

- (void)addOffspring:(Vampire *)vampire { 
}

@end
