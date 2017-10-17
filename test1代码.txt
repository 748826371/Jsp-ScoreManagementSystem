using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sample8_1
{
    class Program
    {
        static void Main(string[] args)
        {
        Console.WriteLine("*************时间确认*************");
        int k = (int)DateTime.Now.DayOfWeek;//获取代表星期几的返回值
          switch(k)
          {
              case (int)MyDate.Sun:Console.WriteLine("今天是星期日"); break;
              case (int)MyDate.Mon:Console.WriteLine("今天是星期一"); break;
              case (int)MyDate.Tue:Console.WriteLine("今天是星期二"); break;
              case (int)MyDate.Wed:Console.WriteLine("今天是星期三"); break;
              case (int)MyDate.Thi:Console.WriteLine("今天是星期四"); break;
              case (int)MyDate.Fri:Console.WriteLine("今天是星期五"); break;
              case (int)MyDate.Sat:Console.WriteLine("今天是星期六"); break;
          }
            Console.WriteLine("*************驾驶员身份确认*************");
            oldriver g1 = new oldriver();
            g1.name = "陈亮";
            Student s1 = g1; // 隐式转换
            Student s2 = new Student();
            s2.name = "宋燕燕";
            oldriver g2 = (oldriver)s1; // 显式转换
            Console.WriteLine("驾驶员为："+g2.name);
            if(g2 is oldriver)
                {Console.WriteLine(g2.name+"是老司机");}
            else
                {Console.WriteLine(g2.name+"不是老司机");}
            //Graduate g3 = (Graduate)s2; // 错误：转换失败！
            oldriver[] gs1 = new oldriver[] { g1, g2 };
            Student[] ss1 = gs1;
            oldriver[] gs2 = (oldriver[])ss1;
            Console.WriteLine("*************驾驶工具确认*************");
            Car car = new Car("小汽车");
            car.Show();
            car.Move();
            car.GetWheel();
            
            Console.WriteLine("*************驾驶工具状态确认*************");
            object[] objArray = new object[4];//定义数组，该数组的长度为6，包含的数据类型为object
            objArray[0] = "0.1%";//第3个元素被赋予字符串
            objArray[1] = 12;//第4个元素被赋予整型数据
            objArray[2] = 23.3;//第5个元素被赋予浮点数
            objArray[3] = null;//第6个元素被赋予空

            for (int i = 0; i < objArray.Length; ++i)//遍历数组objArray
            {
                string s = objArray[i] as string;//把数组元算转换为字符串
                Console.Write("{0}号车轮磨损状况:", i);//输出该元算
                if (s != null)//如果转换结果不为空
                {
                    Console.WriteLine(s);//输出转换结果
                }
                else//否则
                {
                    Console.WriteLine("无法得到数据");
                }
            }
        
        int[,] x = new int[6, 1] {{1}, {1},{1},{1},{1},{1} };
        Console.WriteLine("车牌为："+x.Length+"位数");
        
        Stack<int> a = new Stack<int> (100);
        a.Push(888888);
//a.Push("8888");//这一行编译不通过，因为类a只接收int类型的数据
        int x1=a.Pop();
        //实例化只能保存string类型的类
        Stack<string> b = new Stack<string>(100);
        b.Push("888888");
        string y = b.Pop();
        Console.WriteLine("*************车牌号确认*************");
        Console.WriteLine(x1);
        Console.WriteLine("*************车牌号再次确认*************");
        Console.WriteLine(y);
        Console.ReadLine();
        }
    }

     enum MyDate //使用enum创建枚举
     {
         Sun=0,
         Mon=1,
         Tue=2,
         Wed=3,
         Thi=4,
         Fri=5,
         Sat=6
     }
   
    //定义抽象类，表示交通工具
    abstract class Travel
    {
        protected string _name;//交通工具的名称

        public abstract string Name//定义抽象属性，表示交通工具的名称
        {
            get;
            set;
        }

        public void Show()//定义一般方法，用来显示是何种交通工具
        {
            Console.WriteLine("这是{0}",_name);
        }
        public abstract void GetWheel();//获取轮子的数量
    }
    //定义接口
    interface IAction
    {
        //注意这个方法同抽象类中的方法GetWheel的区别
        //任何东西都可以具有移动行为，而只有交通工具才有轮子
        void Move();//表示交通工具行驶的行为
    }
    class Car : Travel, IAction
    {
        public override string Name//重写抽象类属性
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
        public Car(string name)
        {
            _name = name;
        }
        public void Move()//实现接口方法
        {
            Console.WriteLine("小汽车行走在公路上");
        }

        public override void GetWheel()//重写抽象类方法
        {
            Console.WriteLine("小汽车有4个轮子");
        }
    
    }
    
    class Student       //转换
    {
        public string name;
        public int age;
        public int grade;
        public void Register() { }
    }

    class oldriver : Student
    {
        public string supervisor = null;
    }
    
    
    //泛型！
      public class Stack<T>
    {
        private T[] s;

        int pos;

        public Stack(int size)
        {
            s = new T[size];
            pos = 0;
        }

        public void Push(T val)
        {
            s[pos] = val;
            pos++;
        }

        public T Pop()
        {
            pos--;
            return s[pos];
        }

}
}