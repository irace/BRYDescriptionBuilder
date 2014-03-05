//
//  BRYDescriptionBuilderTests.m
//  BRYDescriptionBuilderTests
//
//  Created by Bryan Irace on 2/23/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BRYDescriptionBuilder.h"

@interface BRYDescriptionBuilderTests : XCTestCase

@end

@interface BRYDescriptionBuilderTestObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *age;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy) NSArray *friends;

@end

@implementation BRYDescriptionBuilderTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    BRYDescriptionBuilderTestObject *object = [BRYDescriptionBuilderTestObject new];
    object.name = @"Samuel";
    object.age = @19;
    object.height = 175.26f;
    object.friends = @[@"Woody", @"Ernesto"];
    NSString *expected = [NSString stringWithFormat:@"{\n\t" "super = <%@: %p>" ",\n\t" "name = %@" ",\n\t" "age = %@" ",\n\t" "height = %f" ",\n\t" "friends = %@" "\n}", NSStringFromClass([object class]), object, object.name, object.age, object.height, [object.friends.description stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"]];
    XCTAssertEqualObjects(object.description, expected, @"The description should match the expected value");
}

@end

@implementation BRYDescriptionBuilderTestObject

- (NSString *)description
{
    return [[[[[[BRYDescriptionBuilder builderWithObject:self]
                appendSuperDescription:[super description]]
               appendObject:self.name withName:@"name"]
              appendObject:self.age withName:@"age"]
             appendFloat:self.height withName:@"height"]
            appendObject:self.friends withName:@"friends"].description;
}

@end
