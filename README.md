# BRYDescriptionBuilder

Utility for determining object equality, based on Apache Commons [ToStringBuilder](http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ToStringBuilder.html).

```objectivec
- (NSString *)description {
    return [[[[[[BRYDescriptionBuilder builderWithObject:object]
                appendObject:self.name withName:@"name"]
               appendBool:self.isHidden withName:@"isHidden"]
              appendFloat:self.width withName:@"width"]
             appendInteger:self.index withName:@"index"]
            description];
}
```

## License

Available for use under the MIT license: [http://bryan.mit-license.org](http://bryan.mit-license.org)
