//
//  BRYDescriptionBuilder.h
//  BRYDescriptionBuilder
//
//  Created by Bryan Irace on 2/23/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

/**
 Utility for producing object descriptions, based on Apache Commons [EqualsBuilder](http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ToStringBuilder.html). Useful for implemeting `-[NSObject description]` methods.
 
 - (NSString *)description {
     return [[[[[[BRYDescriptionBuilder builderWithObject:object]
                 appendObject:self.name withName:@"name"]
                appendBool:self.isHidden withName:@"isHidden"]
               appendFloat:self.width withName:@"width"]
              appendInteger:self.index withName:@"index"]
             description];
 }
 */
@interface BRYDescriptionBuilder : NSObject

/**
 Factory method for acquiring a `BRYDescriptionBuilder` instance.
 
 @param object Object to produce a string description for
 @return `BRYDescriptionBuilder` instance seeded with the initial value and multiplier
 */
+ (instancetype)builderWithObject:(id)object;

- (BRYDescriptionBuilder *)appendObject:(id)object withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendInteger:(NSInteger)integer withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendBool:(BOOL)boolean withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendFloat:(CGFloat)floatValue withName:(NSString *)name;

- (NSString *)description;

@end
