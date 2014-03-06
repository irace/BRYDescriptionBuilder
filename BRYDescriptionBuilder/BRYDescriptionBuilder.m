//
//  BRYDescriptionBuilder.m
//  BRYDescriptionBuilder
//
//  Created by Bryan Irace on 2/23/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "BRYDescriptionBuilder.h"

@interface BRYDescriptionBuilder()

@property (nonatomic) id object;
@property (nonatomic) NSMutableArray *mutableComponentStrings;

@end

@implementation BRYDescriptionBuilder

#pragma mark - Initialization

+ (instancetype)builderWithObject:(id)object {
    return [[self alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id)object {
    if (self = [super init]) {
        _object = object;

        _mutableComponentStrings = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - Value appending

- (BRYDescriptionBuilder *)appendObject:(id)object withName:(NSString *)name {
    return [self appendString:[object description] withName:name];
}

- (BRYDescriptionBuilder *)appendInteger:(NSInteger)integer withName:(NSString *)name {
#if defined(__LP64__) && __LP64__
    // on 64-bit archs, NSInteger is typedef'd to long
    return [self appendString:[NSString stringWithFormat:@"%li", integer] withName:name];
#else
    // on 32-bit archs, NSInteger is typedef'd to int
    return [self appendString:[NSString stringWithFormat:@"%i", integer] withName:name];
#endif
}

- (BRYDescriptionBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger withName:(NSString *)name {
#if defined(__LP64__) && __LP64__
    // on 64-bit archs, NSUInteger is typedef'd to unsigned long
    return [self appendString:[NSString stringWithFormat:@"%lu", unsignedInteger] withName:name];
#else
    // on 32-bit archs, NSUInteger is typedef'd to unsigned int
    return [self appendString:[NSString stringWithFormat:@"%u", unsignedInteger] withName:name];
#endif
}

- (BRYDescriptionBuilder *)appendBool:(BOOL)boolean withName:(NSString *)name {
    return [self appendString:boolean ? @"YES" : @"NO" withName:name];
}

- (BRYDescriptionBuilder *)appendFloat:(CGFloat)floatValue withName:(NSString *)name {
#if defined(__LP64__) && __LP64__
    // on 64-bit archs, CGFloat is typedef'd to double
    return [self appendString:[NSString stringWithFormat:@"%e", floatValue] withName:name];
#else
    // on 32-bit archs, CGFloat is typedef'd to float
    return [self appendString:[NSString stringWithFormat:@"%f", floatValue] withName:name];
#endif
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ {%@\n}", self.object, [self.mutableComponentStrings componentsJoinedByString:@","]];
}

#pragma mark - Private

- (BRYDescriptionBuilder *)appendString:(NSString *)string withName:(NSString *)name {
    [self.mutableComponentStrings addObject:[NSString stringWithFormat:@"\n\t%@ = %@", name, string]];
    
    return self;
}


@end
