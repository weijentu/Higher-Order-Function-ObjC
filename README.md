# Higher Order Functions in Objective-C
The project is trying to implement similar manners to higher order functions in *Swift* standard library. Currently `Map`, `Filter`, `Reduce`, `Contains`, `ForEach` and `FlatMap` with/without class restrictor have been implemented for NSArray.

## Map:   
> Iterate an array and applies the same block operation to each element in it.

*Without class restrictor*
```objectivec
[array map:^id(id obj) { return [(NSString *)obj uppercaseString]; }]
```

*With class restrictor*
```objectivec
[array map:^id(id obj) { return [(NSString *)obj uppercaseString]; } class:[NSString class]]
```

## Filter:   
> Iterate an array and return elements that meet a condition.

*Without class restrictor*
```objectivec
[array filter:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"o"]; }]
```

*With class restrictor*
```objectivec
[array filter:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"o"]; } class:[NSString class]]
```

## Reduce:  
> Combine all elements in an array to create a single output.

*Without class restrictor*
```objectivec
[array reduce:@"Hey, " block:^id(id obj1, id obj2) { return [NSString stringWithFormat:@"%@%@", obj1, obj2]; }]
```

*With class restrictor*
```objectivec
[array reduce:@"Hey, " block:^id(id obj1, id obj2) { return [NSString stringWithFormat:@"%@%@", obj1, obj2]; } class:[NSString class]]
```

## Contains:  
> Iterate an array and check if any element satisfies a condition.

*Without class restrictor*
```objectivec
[array contains:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"H"]; }]
```

*With class restrictor*
```objectivec
[array contains:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"H"]; } class:[NSString class]]
```

## ForEach:  
> A short-hand for the for loop.

*Without class restrictor*
```objectivec
[array forEach:^(id obj) { NSLog(@"%@", obj); } ]
```

*With class restrictor*
```objectivec
[array forEach:^(id obj) { NSLog(@"%@", obj); } class:[NSString class]]
```

## FlatMap:  
> Flatten an array of arrays.

*Without class restrictor*
```objectivec
[array flatMap:^id(id obj) { return obj; }]
```

*With class restrictor*
```objectivec
[array flatMap:^id(id obj) { return obj; } class:[NSString class]]
```
