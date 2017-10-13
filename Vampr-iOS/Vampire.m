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
    <#code#>;
}

- (BOOL)isMoreSeniorThan:(Vampire *)vampire { 
    <#code#>;
}

- (NSUInteger)numberOfVampiresFromOriginal { 
    <#code#>;
}

- (NSUInteger)numberOfOffspring { 
    <#code#>;
}

- (void)addOffspring:(Vampire *)vampire { 
    <#code#>;
}

@end
