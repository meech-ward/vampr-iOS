//
//  Vampire.h
//  Vampr-iOS
//
//  Created by Sam Meech-Ward on 2017-10-13.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vampire : NSObject

- (instancetype)initWithName:(NSString *)name yearConverted:(int)yearConverted;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int yearConverted;
@property (nonatomic, strong) NSMutableArray <Vampire *> *offspring;
@property (nonatomic, weak) Vampire *creator;

/// Adds the vampire as an offspring of this vampire
- (void)addOffspring:(Vampire *)vampire;

/// Returns the total number of vampires created by that vampire
- (NSUInteger)numberOfOffspring;

/// Returns the number of vampires away from the original vampire this vampire is
- (NSUInteger)numberOfVampiresFromOriginal;

/// Returns true if this vampire is more senior than the other vampire (Who is closer to the original vampire)
- (BOOL)isMoreSeniorThan:(Vampire *)vampire;

/// Returns the closest common ancestor of two vampires
- (Vampire *)closestCommonAncestorTo:(Vampire *)vampire;

@end
