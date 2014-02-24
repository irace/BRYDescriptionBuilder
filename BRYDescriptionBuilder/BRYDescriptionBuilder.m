//
//  BRYDescriptionBuilder.m
//  BRYDescriptionBuilder
//
//  Created by Bryan Irace on 2/23/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "BRYDescriptionBuilder.h"

@interface BRYDescriptionBuilder()

@property (nonatomic) NSMutableString *mutableDescription;

@end

@implementation BRYDescriptionBuilder

#pragma mark - Initialization

+ (instancetype)builderWithObject:(id)object {
    return [[self alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id)object {
    if (self = [super init]) {
        _mutableDescription = [[NSMutableString alloc] initWithString:
                               [NSString stringWithFormat:@"%@[", object]];
    }
    
    return self;
}

#pragma mark - Value appending

- (BRYDescriptionBuilder *)appendSuper {
    return [self appendString:[super description] withName:@"super"];
}

- (BRYDescriptionBuilder *)appendObject:(id)object withName:(NSString *)name {
    return [self appendString:[object description] withName:name];
}

- (BRYDescriptionBuilder *)appendInteger:(NSInteger)integer withName:(NSString *)name {
    return [self appendString:[NSString stringWithFormat:@"%li", (long)integer] withName:name];
}

- (BRYDescriptionBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger withName:(NSString *)name {
    return [self appendString:[NSString stringWithFormat:@"%lu", (unsigned long)unsignedInteger] withName:name];
}

- (BRYDescriptionBuilder *)appendBool:(BOOL)boolean withName:(NSString *)name {
    return [self appendString:boolean ? @"YES" : @"NO" withName:name];
}

- (BRYDescriptionBuilder *)appendFloat:(CGFloat)floatValue withName:(NSString *)name {
    return [self appendString:[NSString stringWithFormat:@"%f", floatValue] withName:name];
}

- (NSString *)description {
    return [self.mutableDescription stringByAppendingString:@"]"];
}

#pragma mark - Private

- (BRYDescriptionBuilder *)appendString:(NSString *)string withName:(NSString *)name {
    [self.mutableDescription appendFormat:@", %@=%@", name, string];
    
    return self;
}


@end
