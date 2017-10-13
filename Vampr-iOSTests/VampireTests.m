//
//  VampireTests.m
//  Vampr-iOSTests
//
//  Created by Sam Meech-Ward on 2017-10-13.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

#import "Vampire.h"

SpecBegin(Vampire)

describe(@"Vampire", ^{
    
    __block Vampire *rootVampire;
    beforeEach(^{
        rootVampire = [[Vampire alloc] initWithName:@"root" yearConverted:1];
    });

    describe(@"add new vampires as offspring", ^{

        __block Vampire *offspring1;
        __block Vampire *offspring2;
        beforeEach(^{
            offspring1 = [[Vampire alloc] initWithName:@"andrew" yearConverted:2];
            offspring2 = [[Vampire alloc] initWithName:@"sarah" yearConverted:3];
            [rootVampire addOffspring:offspring1];
            [rootVampire addOffspring:offspring2];
        });
        
        it(@"new vampires should get added as offspring", ^{
            expect(rootVampire.offspring[0]).to.equal(offspring1);
            expect(rootVampire.offspring[1]).to.equal(offspring2);
        });
        
        it(@"new vampires should have parent set as creator", ^{
            expect(offspring1.creator).to.equal(rootVampire);
            expect(offspring2.creator).to.equal(rootVampire);
        });

    });

    describe(@"get number of offspring", ^{
        
        it(@"should have 0 offspring to start with", ^{
           expect(rootVampire.numberOfOffspring).to.equal(0);
        });

        it(@"should get the correct number of offspring", ^{
            [rootVampire addOffspring:[Vampire new]];
            expect(rootVampire.numberOfOffspring).to.equal(1);
            [rootVampire addOffspring:[Vampire new]];
            expect(rootVampire.numberOfOffspring).to.equal(2);
            [rootVampire addOffspring:[Vampire new]];
            [rootVampire addOffspring:[Vampire new]];
            [rootVampire addOffspring:[Vampire new]];
            expect(rootVampire.numberOfOffspring).to.equal(5);
        });
    });

    describe(@"get number of vampires from original", ^{

        __block Vampire *offspring1, *offspring2, *offspring3, *offspring4;
        before(^{
            offspring1 = [Vampire new];
            offspring2 = [Vampire new];
            offspring3 = [Vampire new];
            offspring4 = [Vampire new];

            [rootVampire addOffspring:offspring1];
            [offspring1 addOffspring:offspring2];
            [offspring2 addOffspring:offspring3];
            [offspring3 addOffspring:offspring4];
        });

        it(@"root should be 0 from original", ^{
            expect(rootVampire.numberOfVampiresFromOriginal).to.equal(0);
        });

        it(@"offspring 1 should be 1 from original", ^{
            expect(offspring1.numberOfVampiresFromOriginal).to.equal(1);
        });

        it(@"offspring 2 should be 2 from original", ^{
            expect(offspring2.numberOfVampiresFromOriginal).to.equal(2);
        });

        it(@"offspring 4 should be 4 from original", ^{
            expect(offspring4.numberOfVampiresFromOriginal).to.equal(4);
        });
    });

    describe(@"check which vampire is more senior", ^{

        __block Vampire *offspring1, *offspring2, *offspring3, *offspring4;
        beforeEach(^{
            offspring1 = [Vampire new];
            offspring2 = [Vampire new];
            offspring3 = [Vampire new];
            offspring4 = [Vampire new];

            [rootVampire addOffspring:offspring1];
            [rootVampire addOffspring:offspring2];
            [rootVampire addOffspring:offspring3];
            [offspring3 addOffspring:offspring4];
        });

        it(@"the original vampire should always be more senior", ^{
            expect([rootVampire isMoreSeniorThan:offspring1]).to.beTruthy();
            expect([rootVampire isMoreSeniorThan:offspring2]).to.beTruthy();
            expect([rootVampire isMoreSeniorThan:offspring3]).to.beTruthy();
            expect([rootVampire isMoreSeniorThan:offspring4]).to.beTruthy();

            expect([offspring1 isMoreSeniorThan:rootVampire]).to.beFalsy();
            expect([offspring2 isMoreSeniorThan:rootVampire]).to.beFalsy();
            expect([offspring3 isMoreSeniorThan:rootVampire]).to.beFalsy();
            expect([offspring4 isMoreSeniorThan:rootVampire]).to.beFalsy();
        });

        it(@"offspring 3 should be more senior", ^{
            expect([offspring3 isMoreSeniorThan:offspring4]).to.beTruthy();
            expect([offspring4 isMoreSeniorThan:offspring3]).to.beFalsy();
        });

    });

    describe(@"get the closest common ancestor", ^{

        __block Vampire *offspring1, *offspring2, *offspring3, *offspring4, *offspring5, *offspring6, *offspring7, *offspring8;
        beforeEach(^{
            offspring1 = [[Vampire alloc] initWithName:@"a" yearConverted:0];
            offspring2 = [[Vampire alloc] initWithName:@"b" yearConverted:0];
            offspring3 = [[Vampire alloc] initWithName:@"c" yearConverted:0];
            offspring4 = [[Vampire alloc] initWithName:@"d" yearConverted:0];;
            offspring5 = [[Vampire alloc] initWithName:@"e" yearConverted:0];;
            offspring6 = [[Vampire alloc] initWithName:@"f" yearConverted:0];;
            offspring7 = [[Vampire alloc] initWithName:@"g" yearConverted:0];;
            offspring8 = [[Vampire alloc] initWithName:@"h" yearConverted:0];;

            [rootVampire addOffspring:offspring1];
            [rootVampire addOffspring:offspring2];
            [rootVampire addOffspring:offspring3];
            [offspring3 addOffspring:offspring4];
            [offspring3 addOffspring:offspring5];
            [offspring5 addOffspring:offspring6];
            [offspring6 addOffspring:offspring7];
            [offspring2 addOffspring:offspring8];
        });

        it(@"should be the root vampire for any vampire and the root vampire", ^{
            expect([rootVampire closestCommonAncestorTo:offspring2].name).to.equal(rootVampire.name);
            expect([rootVampire closestCommonAncestorTo:offspring7].name).to.equal(rootVampire.name);
        });

        it(@"should be the root vampire for first two offspring", ^{
            expect([offspring1 closestCommonAncestorTo:offspring2].name).to.equal(rootVampire.name);
        });

        it(@"should be offspring 3 for offspring 4 and 7", ^{
            expect([offspring4 closestCommonAncestorTo:offspring7].name).to.equal(offspring3.name);
        });

        it(@"should be that vampire if same vampire is used", ^{
            expect([offspring4 closestCommonAncestorTo:offspring4].name).to.equal(offspring4.name);
        });

        it(@"should be root for offspring 8 and offspring 7", ^{
            expect([offspring7 closestCommonAncestorTo:offspring8].name).to.equal(rootVampire.name);
        });
    });
});

SpecEnd
