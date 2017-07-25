# Higher Order Functions in Objective-C
The project is trying to implement similar manners at higher order function  in *Swift* standard library. Currently `Map`, `Filter`, `Reduce` and `FlatMap` with/without class restrictor have been implemented for NSArray.

## Usage:
> Map:   
> Iterate an array and applies the same block operation to each element in it.

*Without class restrictor*
```objectivec
[array map:^id(id obj) { return [(NSString *)obj uppercaseString]; }]
```

*With class restrictor*
```objectivec
[array map:^id(id obj) { return [(NSString *)obj uppercaseString]; } class:[NSString class]]
```

> Filter:   
> Iterate an array and return elements that meet a condition.

*Without class restrictor*
```objectivec
[array filter:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"o"]; }]
```

*With class restrictor*
```objectivec
[array filter:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"o"]; } class:[NSString class]]
```

> Reduce:  
> Combine all elements in an array to create a single output.

*Without class restrictor*
```objectivec
[array reduce:@"Hey, " block:^id(id obj ,id _obj) { return [NSString stringWithFormat:@"%@%@", obj, _obj]; }]
```

*With class restrictor*
```objectivec
[array reduce:@"Hey, " block:^id(id obj ,id _obj) { return [NSString stringWithFormat:@"%@%@", obj, _obj]; } class:[NSString class]]
```

> FlatMap:  
> Flatten an array of arrays.

*Without class restrictor*
```objectivec
[array flatMap:^id(id obj) { return obj; }]
```

*With class restrictor*
```objectivec
[array flatMap:^id(id obj) { return obj; } class:[NSString class]]
```
