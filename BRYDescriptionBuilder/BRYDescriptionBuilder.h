//
//  BRYDescriptionBuilder.h
//  BRYDescriptionBuilder
//
//  Created by Bryan Irace on 2/23/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

// http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ToStringBuilder.html
@interface BRYDescriptionBuilder : NSObject

+ (instancetype)builderWithObject:(id)object;

- (BRYDescriptionBuilder *)appendSuper;

- (BRYDescriptionBuilder *)appendObject:(id)object withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendInteger:(NSInteger)integer withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendBool:(BOOL)boolean withName:(NSString *)name;

- (BRYDescriptionBuilder *)appendFloat:(CGFloat)floatValue withName:(NSString *)name;

- (NSString *)description;

@end
