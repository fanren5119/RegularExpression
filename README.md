# 正则表达式
## NSPredicate
### 1.NSPredicate常用的语法格式
	① 比较运算符>,<,==,>=,<=,!=可用于数值及字符串;例
	@"number" > 100
	② 范围运算符:IN,BETWEEN.例    
	@"number BETWEEN {1,5}"
	@"address IN {'shanghai','beijing'}"
	③ 字符串本身:SELF.例
     `@"SELF == 'APPLE'"`
    ④ 字符串相关:BEGINSWITH,ENDSWITH,CONTAINS.例
     `@"name CONTAIN[cd] 'ang'" //包含某个字符串`
     `@"name BEGINSWITH[c] 'sh'" //以某个字符串开头`
     `@"name ENDSWITH[d] 'ang'" //以某个字符串结束`
     住:[c]不区分大小写[d]不区分发音符号即没有重音符号
    ⑤ 速配符:LIKE.例
     `@"name LIKE[cd] '*er*'" //*代表通配符,Like也接受[cd]`
     `@"name LIKE[cd] '???er*'" `
    ⑥ 正则表达式: MATCHES.例
     `NSString *regex = @"^A.+e$"; //以A开头,e结尾`
     @"name MATCHES %@", regex
### 2.NSPredicate的应用
      ① NSPredicate可以用来检测字符串是否符合某种规则,例如判断字符串是否是电话号码
    字符串是否是邮件格式等;
      ② NSPredicate还可以用来对数据进行过滤,类似于SQL中的where,我们可以从数组中过
    滤出想要的数据;
  
## NSRegularExpression
      NSRegularExpression是ios对正则的封装;可以通过正则判断字符串是否符合某种规则,
    也可通过正则对字符串进行截取(截取出需要的字符串);
      例:
```
    NSString *string = @"1[aaa]e[bbb]f[ccc]2";
    NSString *regx = @"(?<=\\[)([^(\\[\\])]*)(?=\\])";

    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regx 
                                                                             options:0 
                                                                             error:nil];
    NSArray *array = [regular matchesInString:string
                                      options:(NSMatchingReportCompletion) 
                                        range:NSMakeRange(0, string.length)];

    for (NSTextCheckingResult *result in array) {
        NSString *component = [string substringWithRange:result.range];
        NSLog(@"component = %@", component);
    }
    打印结果: [aaa] [bbb] [ccc]
```
