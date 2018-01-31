//
//  KeyWordViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/27.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "KeyWordViewController.h"

@interface KeyWordViewController ()

@end

@implementation KeyWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGECOLOR" object:@"这是通知传进来的值"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGECOLOR" object:self userInfo:nil];
}
/*
 
 http://www.cocoachina.com/ios/20171018/20833.html
 
 1.浅Copy:只是多了一个指向该内存的指针，公用一块内存。
   深Copy:内存的复制，两块内存是完全不同的，也就是两个对象指针指向不同的内存，互不干涉。
 
 2.atomic是Objc使用的一种线程保护技术，
 
 基本上来讲，是防止在写未完成的时候被另外一个线程读取，
 
 造成数据错误。而这种机制是耗费系统资源的，
 
 所以在iPhone这种小型设备上，如果没有使用多线程间的通讯编程，
 
 那么nonatomic是一个非常好的选择。
 
 
 2.各种属性的解析
 weak:
 
 <修饰Object类型，ARC下修饰delegate属性>
 
 1.在ARC环境下，所有指向这个对象的weak指针都将被置为nil。
 
 这个特性很有用，很多codeer都有被指针指向已释放的对象所造成的EXC_BAD_ACCESS困扰过，使用ARC以后，不论是strong还是weak类型的指针，都不会再指向一个已经销毁的对象，从根本上解决了意外释放导致的crash。
 
 2.修饰Object类型，修饰的对象在释放后，指针地址会被置为nil，是一种弱引用。在ARC环境下，为避免循环引用，往往会把delegate属性用weak修饰；在MRC下使用assign修饰。weak和strong不同的是：当一个对象不再有strong类型的指针指向它的时候，它就会被释放，即使还有weak型指针指向它，那么这些weak型指针也将被清除。
 
 assign:
 
 < 用于非指针变量。用于基础数据类型 （例如NSInteger）和C数据类型（int, float, double, char, 等），另外还有id >
 
 1.用于对基本数据类型进行复制操作，不更改引用计数。也可以用来修饰对象，但是，被assign修饰的对象在释放后，指针的地址还是存在的，也就是说指针并没有被置为nil，成为野指针。如果后续在分配对象到堆上的某块内存时，正好分到这块地址，程序就会crash。之所以可以修饰基本数据类型，因为基本数据类型一般分配在栈上，栈的内存会由系统自动处理，不会造成野指针。
 
 我们常见的id delegate往往是用assign方式的属性而不是retain方式的属性，赋值不会增加引用计数，就是为了防止delegation两端产生不必要的循环引用。如果一个UITableViewController 对象a通过retain获取了UITableView对象b的所有权，这个UITableView对象b的delegate又是a， 如果这个delegate是retain方式的，那基本上就没有机会释放这两个对象了。自己在设计使用delegate模式时，也要注意这点。因为循环引用而产生的内存泄露也是Instrument无法发现的，所以要特别小心。
 
 copy:
 
 修饰NSString、NSArray、NSDictionary等有对应可变类型的对象
 
 建立一个索引计数为1的对象，然后释放旧对象。
 
 是内容拷贝,会在内存里拷贝一份对象，两个指针指向不同的内存地址。一般用来修饰NSString、NSArray等有对应可变类型的对象，因为他们有可能和对应的可变类型（NSMutableString）之间进行赋值操作，为确保对象中的字符串不被修改 ，应该在设置属性是拷贝一份。而若用strong修饰，如果对象在外部被修改了，会影响到属性。
 
 在不可变对象之间进行转换，strong与copy作用是一样的，但是如果在不可变与可变之间进行操作，我比较推荐copy,这也就是为什么很多地方用copy，而不是strong修饰NSString,NSArray等存在对应不可变类型的对象了，避免出现意外的数据操作.
 
 strong
 
 ARC下的strong等同于MRC下的retain都会把对象引用计数加1。
 
 1.在ARC环境下，只要某一对象被一个strong指针指向，该对象就不会被销毁。如果对象没有被任何strong指针指向，那么就会被销毁。在默认情况下，所有的实例变量和局部变量都是strong类型的。可以说strong类型的指针在行为上跟MRC下得retain是比较相似的
 
 retain
 
 释放旧的对象，将旧对象的值赋予输入对象，再提高输入对象的索引计数为1
 
 在MRC中，你需要自己retain一个想要保持的对象，ARC环境下就不需要了。现在唯一要做的就是用一个指针指向这个对象，只要指针没有被重置为空，对象就会一直在堆上。当指针指向新值的时候，原来的对象就会被release一次。这对实例变量，sunthesize的变量或者是局部变量都是实用的。
 
 3.属性之间区别
 
 在iOS开发中我们知道一般nsstring，就用copy，定义一个模型对象，就用strong，只是赋值的，例如int、double、char 以及CGRect类似的就用assign。但具体为什么可能很多人不是很清楚。
 
 这里进行简单的解释：
 
 这些关键字基本上是针对属性的set方法。
 
 当用copy时，set方法会先release旧值，再copy一个新的对象，reference count 为1（减少了对上下文的依赖）；当用assign，直接赋值，无retain操作。当用retain，release旧值，retain新值；
 
 strong与weak的区别
 
 strong类似于retain，会将对象的引用计数器+1，分配内存地址。
 
 weak类似于指针，只是单纯的指向某个地址，但是本身并未分配内存地址。当指向的地址被销毁时，该指针会自动nil。
 
 例子：
 
 @synthesize string1;
 
 @synthesize string2;
 
 来猜一下，下面输出是什么？
 
 1.    self.string1 = [[NSString alloc] initWithUTF8String:"string 1"];
 2.    self.string2 = self.string1;
 3.    self.string1 = nil;
 4.    NSLog(@"String 2 = %@", self.string2);
 结果是：String 2 = null
 
 分析一下，由于self.string1与self.string2指向同一地址，且string2没有retain内存地址，而 self.string1=nil释放了内存，所以string1为nil。声明为weak的指针，指针指向的地址一旦被释放，这些指针都将被赋值为 nil。这样的好处能有效的防止野指针。在c/c++开发过程中，指针的空间释放了后，都要将指针赋为NULL. 在这儿用weak关键字做了这一步。
 
 assign和weak的区别
 
 对于assign来说，一是非指针变量，比如说NSInteger之类的基础数据类型、C数据类型，还有就是避免出现循环引用的时候，
 
 对于weak，其和assign差不多，但是它多了一点，就是，它会自动对该类型变量设置为nil。
 */



@end
