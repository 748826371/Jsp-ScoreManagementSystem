using System;        //using是关键字，引用一个System的名称空间
using System.Collections.Generic;  //同上
using System.Linq;    //同上
using System.Text;    //同上

namespace Mynamespace   //声明自己的名称空间，命名空间提供了一种从逻辑上组织类的方式，防止命名冲突。 
{
    class Myclass     //定义类型，隐私性默认值为protected，即对自己及派生类开放成员
    {
        static void Main(string[] args)    //定义一个类下的成员：Main方法 
                                           //static表示该成员是静态的，即程序一开始就分配了内存，使用的时候不需要生成某个类型的对象
                                           //void表示该成员没有返回值
                                           //Main表示该方法是主方法，程序的'入口'
                                           //string[] args表示命令行参数是字符串数组，即，你在命令行（黑框框）里输入的参数可以使多个字符串
                                           //args是用来处理命令行参数的，即，运行这个程序的时候给它传的参数。是可选项，不是必须的。
        {
            System.Console.WriteLine("请输入num的值，回车结束");
            int num = Console.Read();             //定义并获取变量(值类型)
            String str = "not123";                //定义字符串类型变量（引用类型）
     
            if (num == 123)               //判断num是否有值           
            { Console.WriteLine("num = " + num);}   //如果有值就输出num
            else
            { Console.WriteLine(str); }    //如果没有值就输出提示

            Console.ReadKey();       //防止闪退
        }
    }

}