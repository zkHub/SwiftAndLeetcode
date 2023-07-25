# Swift


## 基本语法

- 没有显式的`main`函数，以`@main`为入口
- 单句代码后面可不加`;`，单行多句必须使用`;`隔开
- let定义常量（只能赋值一次），var定义变量，两者初始化之前都不能使用

### 常见数据类型

- 值类型（value type）
    - 枚举（enum）：Optional
    - 结构体（struct）：
        Bool，Int，Float，Double，Character
        String，Dictionary，Array，Set
- 引用类型（reference type）
    - 类（class）

Int最大最小值：Int.max;Int.min
Float 32位，精度是6位
Double 64位，精度至少有15位

整数，浮点数都可以增加`0`或者用`_`分隔来增加可读性：`100_0000` `0.100_022` `000_100_000`
不同类型计算需要转换类型：
```swift
let a = 1
let b = 2.1
let sum = Double(a) + b

let a = 1 + 2.1  // 字面量是可以直接计算的
```

### 元组（tuple）

```swift
let tuple = (1, "a")
print("tuple is \(tuple.0) and \(tuple.1)")

let tuple2 = (num: 2, sting: "b")
print("tuple2 is \(tuple2.num) and \(tuple2.sting)")
```


### 流程控制

#### if
if后面的条件必须是Bool类型
if后面的小括号可以省略，但是大括号不可以省略

```swift
let age = 1
if age == 0 {
    
} else if age == 1 {
    
} else {
    
}
```


#### while

```swift
while age < 5 {
    age = age + 1
    print("age2:\(age)")
}

// repeat-while相当于C中的do-while
repeat {
    age = age - 1
    print("age3:\(age)")
} while age > 0
```

#### for

闭区间运算符：`a...b`即大于等于a，小于等于b
半开区间运算符：`a..<b`即大于等于a，小于b
单侧区间：`a...`和`...b`即大于等于a和小于等于b

```swift
let range1 = 0...4 // ClosedRange<Int>
let range2 = 0..<4 // Range<Int>
let range3 = 0... // PartialRangeFrom<Int>
let range4 = ...4 // PartialRangeThrough<Int>

var array = [1,2,3,4,5]
for i in range1 {
    print(array[i])
}
for num in array[0...4] {
    print(num)
}
for num in array[...4] {
    print(num)
}

// 带间隔的区间 13579
for trick in stride(from: 1, to: 10, by: 2) {
    print("stride from to:\(trick)")
}
for trick in stride(from: 1, through: 10, by: 2) {
    print("stride from through:\(trick)")
}
```

#### switch

case、default后面不写大括号，而且至少要有一行语句（只写break也行）
默认不用写break，不会执行到下个case
如果需要执行下个case需要写fallthrough
必须保证处理所有情况（此时不写default也行）
支持Int，enum，Character，String，区间，元组，值绑定

```swift
enum Answer {
    case right, wrong
}
let answer = Answer.right
switch answer {
case .right:
    print("right")
case .wrong:
    print("wrong")
}

let a = "a"
switch a {
case "a", "b": // 复合条件（或者使用fallthrough）
    print("a")
default:
    print("false")
}
```


#### where

可以用在for和switch语句中作为判断条件

```swift
let point = (1, 1)
switch point {
case let (x, y) where x == y :
    print("x == y")
case let (x, y) where x == -y:
    print("x == -y")
default:
    print("x y")
}

let numbers = [1, -1, 2, -2]
for num in numbers where num > 0 {
    print("num = \(num)")
}
```


### 函数


返回值可以是元组，返回多个值

```swift
/**
    文档注释
    加一
 - Note: num是参数标签 也可以是_ 表示省略标签
 - Returns: +1
 - Parameter a: a
*/

func f(num a: Int) -> Int {
    a + 1 // 如果函数体是一个单一表达式，那么函数会隐式的返回这个表达式
}
    
```

#### 函数类型

函数作为参数，作为返回值

```swift
func test() {} // () -> Void 或 () -> ()
```

#### typealias

类型别名

```swift
public typealias Void = () // swift 标准库 Void就是空元组(）
```


#### 可变参数

一个函数只能有一个可变参数
紧跟其后的参数不能省略参数标签

```swift
func print(_ items: Any..., separator: String = " ", terminator: String = "\n")
```

#### 输入输出参数：inout

可以在函数内部修改外部实参的值，本质是地址传递（引用传递）
不可以修饰可变参数，不能有默认值，只能是可被多次赋值的参数

```swift
func swapValues(_ v1: inout Int, _ v2: inout Int) {
    (v1, v2) = (v2, v1)
}

var n1 = 1
var n2 = 2
swapValues(&n1, &n2)
```

#### 函数重载

规则：函数名相同，参数个数不同或参数类型不同或参数标签不同
注意点：返回值类型不同不在范围内会有报错；遇到默认参数值时有二义性但不会报错（会调用没有默认值参数的）；可变参数、省略参数标签，函数重载一起使用时会有二义性，编译器可能会报错



### 枚举

```swift
enum Direct {
    case north, south, east, west
}
enum Direct {
    case north
    case south
    case east 
    case west
}
```

#### 原始值

原始值不占用枚举变量的内存

```swift
enum Grade : String {
    case perfect = "A"
    case great = "B"
    case good = "C"
    case bad = "D"
}
print(Grade.perfect) // perfect
print(Grade.perfect.rawValue) // A
```

如果原始值是Int、String类型，Swift会隐式的分配原始值

```swift
enum Direction : String {
    case north, south, east, west
}
print(Direction.north) // north

enum Season : Int {
    case spring, summer, autumn = 3, winter
}
// 0,1,3,4
```

#### 关联值

枚举成员值可以关联其他类型的值

```swift
enum Score {
    case points(Int)
    case grade(String)
}
var score = Score.points(98)
score = .grade("A")

switch score {
    case let .points(i):
        print("points", i)
    case let .grade(i)
        print("grade", i)
}
// grade A

```

### Optional 可选类型

可选项允许值是nil，类型名称后加`?`来定义，非空时的值是Optional(v)，是对原类型包装了一层
- 使用`!`可以强制解包，但是如果值是nil那么会发生运行时错误
- 使用可选项绑定解包，if、guard、while中把可选项赋值给let或var，返回true（非nil）或false（nil）
- 空合并运算符`a ?? b`解包，a必须是可选项，b可以是也可以不是，但ab存储类型必须相同，a为nil返回b，a非nil返回a（但如果b非可选项则a会自动解包）
- 隐式解包，如果可选项一直保持有值，那么可以在类型后面加`!`，定义一个隐式解包的可选项，使用时就是其存储类型（保证非nil）

```swift
var age: Int? // 默认值是nil
age = 10 
print(age) // Optional(10)

if let num = age {
    // 非nil
}

// guard 条件为false时才会执行大括号中的代码，guard中使用可选绑定时，绑定的值也可以在外层作用域中使用
guard let num = age else {
    
}

```

### 结构体

Swift标准库中绝大部分都是结构体类型，Bool，Int，String，Array，Dictionary等
编译器会帮结构体自动生成初始化器（可能是多个），保证所有成员（存储类型）都有初始值
但是如果自己定义了初始化器，那么编译器便不会帮你生成其它的初始化器了

```swift
struct Point {
    var x: Int
    var y: Int
    init() {
        x = 0
        y = 0
    }
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
```


### 类
类与结构体的结构类似，但是编译器不会帮生成可以传入成员值的初始化器，但是所有成员在定义时就有值的话，编译器会自动生成无参的初始化器

```swift
class Point {
    var x: Int = 0
    var y: Int = 0
}
var a = Point()
// 上下等价
class Point {
    var x: Int
    var y: Int
    init() {
        x = 0
        y = 0
    }
}
var a = Point()

```


#### 结构体和类的区别
结构体是值类型（枚举也是值类型，内存占用是在栈空间），类是引用类型（指针类型，内存占用在堆空间）

值类型赋值let或var或函数传参，是直接将所有内容拷贝一份，属于深拷贝
在Swift标准库中，为了提升性能，String，Array，Dictionary，Set采用了copy on write技术（仅当有write操作时，才执行copy操作）

引用类型赋值let或var或函数传参时，是将内存地址拷贝一份，属于浅拷贝

Swift中创建类时，需要向堆空间申请内存，大致流程：
-class.__allocating_init()
-libswiftCore.dylib: _swift_allocObject_
-libswiftCore.dylib: _swift_slowAlloc_
-libsystem_malloc.dylib: malloc

在MACOS、iOS中malloc分配的内存大小总是16的倍数（class_getInstanceSize可以获取至少需要多少内存）

值类型和引用类型用let修饰时的区别
值类型本身以及成员都不可修改，而引用类型本身不可修改，成员可修改
```swift
struct Point {
    var x: Int
    var y: Int
}

class Size {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
let p = Point(x: 1, y: 2)
//        p = Point() // Cannot assign to value: 'p' is a 'let' constant
//        p.x = 3 // Cannot assign to property: 'p' is a 'let' constant
//        p.y = 4 // Cannot assign to property: 'p' is a 'let' constant
let s = Size(x: 1, y: 2)
//        s = Size(x: 3, y: 4) // Cannot assign to value: 's' is a 'let' constant
s.x = 3
s.y = 4
```

#### 枚举、结构体、类都可以定义方法
一般把定义在枚举、结构体、类内部的函数叫做方法，所以方法不占用对象的内存，存放在代码段


### 闭包

在Swift中，可以通过func定义一个函数，也可以通过闭包表达式定义一个函数

```swift
var fn = {
    (v1: Int, v2: Int) -> Int in
    return v1 + v2
}
fn(10, 20)
```

#### 尾随闭包

如果用一个闭包表达式作为函数的最后一个实参，使用尾随闭包可以增强函数的可读性，是一个写在函数括号外面的闭包表达式

如果闭包表达是函数的唯一实参，而且使用尾随闭包的语法，那么函数的小括号`()`也可以省略

```swift
func exec (v1: Int, v2: Int, fn: (Int, Int) -> Int) {
    print(fn(v1, v2))
}

exec(v1: 1, v2: 2) {
    $0 + $1
}

func exe(fn: (Int, Int) -> Int) {
    print(fn(1, 2))
}
exe{$0 + $1}

```

#### 闭包




