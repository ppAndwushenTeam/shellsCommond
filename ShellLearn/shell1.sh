#https://www.runoob.com/linux/linux-shell-basic-operators.html


echo "Hellow World !"

your_name="qinjx"
echo $your_name

myUrl="https://www.google.com"
readonly myUrl #!只读


echo $myUrl

unset your_name
echo $your_name


your_name='runoob'
str="Hello, I know you are \"$your_name\"! \n"
echo $str


# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3


string="abcd"
echo ${#string} #输出 4
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo


#查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
string="runoob is a great site"
#echo `expr index "$string" io`  # 输出 4


array_name=(
"value0"
"value1"
"value2"
"value3"
)

echo $array_name
echo ${array_name[1]}
echo ${array_name[@]} #所有数组元素
echo ${#array_name} #数组长度

#注释案例
#--------------------------------------------
# 这是一个注释
# author：菜鸟教程
# site：www.runoob.com
# slogan：学的不仅是技术，更是梦想！
#--------------------------------------------
##### 用户配置区 开始 #####
#
#
# 这里可以添加脚本描述信息
#
#
##### 用户配置区 结束  #####


#多行注释
#:<<EOF
#注释内容...
#注释内容...
#注释内容...
#EOF
#EOF 也可以使用其他符号
#:<<'
#注释内容...
#注释内容...
#注释内容...
#'
#
#:<<!
#注释内容...
#注释内容...
#注释内容...
#!


#--------------------------------------------
#参数传递相关
#--------------------------------------------
echo "Shell 传递参数实例！"
echo "执行的文件名：$0"
echo "第一个参数为：$1"
echo "第二个参数为：$2"
echo "第三个参数为：$3"
echo "参数个数为为：$#"
echo "传递的参数作为一个字符串显示：$*";

echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i
done

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done


#--------------------------------------------
#数组
#--------------------------------------------
echo "数组的元素为: ${array_name[*]}"
echo "数组的元素为: ${array_name[@]}"

echo "数组元素个数为: ${#array_name[*]}"
echo "数组元素个数为: ${#array_name[@]}"


#--------------------------------------------
#数据运算
#--------------------------------------------
val=`expr 3 + 2`
echo $val

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a 等于 b"
fi
if [ $a != $b ]
then
   echo "a 不等于 b"
fi


#--------------------------------------------
#关系运算符  关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
#--------------------------------------------



if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi


#--------------------------------------------
#布尔运算符
#运算符    说明    举例
#!    非运算，表达式为 true 则返回 false，否则返回 true。    [ ! false ] 返回 true。
#-o    或运算，有一个表达式为 true 则返回 true。    [ $a -lt 20 -o $b -gt 100 ] 返回 true。
#-a    与运算，两个表达式都为 true 才返回 true。    [ $a -lt 20 -a $b -gt 100 ] 返回 false。
#--------------------------------------------
echo "-------------布尔运算符---------------"

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi



#--------------------------------------------
#逻辑运算符
#运算符    说明    举例
#&&    逻辑的 AND    [[ $a -lt 100 && $b -gt 100 ]] 返回 false
#||    逻辑的 OR    [[ $a -lt 100 || $b -gt 100 ]] 返回 true
#--------------------------------------------
echo "-------------#逻辑运算符---------------"

if [[ $a -lt 100 && $b -gt 100 ]] #注意⚠️ 必须有内部[] 也不能这样搞 [[ $a -lt 100 ] && [ $b -gt 100 ]]
then
   echo "$a 小于100 并且 $b 大于100 ： 返回true"
else
   echo "$a 小于100 并且 $b 大于100 ： 返回false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "$a 小于100 或者 $b 大于100 ： 返回true"
else
   echo "$a 小于100 或者 $b 大于100 ： 返回false"
fi




#-----------------------------------------
#字符串运算符
#=    检测两个字符串是否相等，相等返回 true。    [ $a = $b ] 返回 false。
#!=    检测两个字符串是否不相等，不相等返回 true。    [ $a != $b ] 返回 true。
#-z    检测字符串长度是否为0，为0返回 true。    [ -z $a ] 返回 false。
#-n    检测字符串长度是否不为 0，不为 0 返回 true。    [ -n "$a" ] 返回 true。
#$    检测字符串是否为空，不为空返回 true。    [ $a ] 返回 true。
#-----------------------------------------
echo "-------------字符串运算符---------------"
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi





#-----------------------------------------
#文件测试运算符
#操作符    说明    举例
#-b file    检测文件是否是块设备文件，如果是，则返回 true。    [ -b $file ] 返回 false。
#-c file    检测文件是否是字符设备文件，如果是，则返回 true。    [ -c $file ] 返回 false。
#-d file    检测文件是否是目录，如果是，则返回 true。    [ -d $file ] 返回 false。
#-f file    检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。    [ -f $file ] 返回 true。
#-g file    检测文件是否设置了 SGID 位，如果是，则返回 true。    [ -g $file ] 返回 false。
#-k file    检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。    [ -k $file ] 返回 false。
#-p file    检测文件是否是有名管道，如果是，则返回 true。    [ -p $file ] 返回 false。
#-u file    检测文件是否设置了 SUID 位，如果是，则返回 true。    [ -u $file ] 返回 false。
#-r file    检测文件是否可读，如果是，则返回 true。    [ -r $file ] 返回 true。
#-w file    检测文件是否可写，如果是，则返回 true。    [ -w $file ] 返回 true。
#-x file    检测文件是否可执行，如果是，则返回 true。    [ -x $file ] 返回 true。
#-s file    检测文件是否为空（文件大小是否大于0），不为空返回 true。    [ -s $file ] 返回 true。
#-e file    检测文件（包括目录）是否存在，如果是，则返回 true。    [ -e $file ] 返回 true。
#其他检查符：
#
#-S: 判断某文件是否 socket。
#-L: 检测文件是否存在并且是一个符号链接。
#-----------------------------------------
echo "--------------------------------文件可读--------------------------------"

project_path=$(cd `dirname $0`; pwd)

file="$project_path/shell1.sh"

echo "$file"


if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi

#---------------------echo命令-----------------
#read name
#echo "$name Is a test"
#
#echo -e "OK! \n" #-e 开启转义
#echo "It is a test"

echo '$your_name\"#$%^'

echo `date`



#---------------------Shell printf 命令-----------------
echo "Hello, Shell"
printf "Hello, Shell\n"


printf "%-10s %-8s %-4s\n" 姓名 性别  体重"(KG)"
printf "%-10s %-8s %-4.2f\n" 朱元璋 男  67.23343
printf "%-10s %-8s %-4.3f\n" 猪八戒 无  234.4556



#----------------------------------------------------
#test 命令-
#----------------------------------------------------
num1=10
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi


result=$[num1+num2]
echo "结果：$result"


int=1
while(( $int<=5 )) #()内部括号不可省略
do
    echo $int
    let "int++"  #重新赋值
done


#echo '按下 <CTRL-D> 退出'
#echo -n '输入你最喜欢的网站名: '
#while read FILM
#do
#    echo "是的！$FILM 是一个好网站"
#done


#while true
#do
#  echo "呵"
#done




#while :
#do
#    echo -n "输入 1 到 5 之间的数字:"
#    read aNum
#    case $aNum in
#        1|2|3|4|5) echo "你输入的数字为 $aNum!"
#        ;;
#        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
#            break
#        ;;
#    esac
#done

#修改如下   "游戏结束" 永远不会执行
#while :
#do
#    echo -n "输入 1 到 5 之间的数字: "
#    read aNum
#    case $aNum in
#        1|2|3|4|5) echo "你输入的数字为 $aNum!"
#        ;;
#        *) echo "你输入的数字不是 1 到 5 之间的!"
#            continue
#            echo "游戏结束"
#        ;;
#    esac
#done


#----------------------------------------------------
# 函数
#----------------------------------------------------
demoFun(){
    echo "这是我的第一个 shell 函数!"
}
echo "-----函数开始执行-----"
demoFun
echo "-----函数执行完毕-----"


funWithReturn(){
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: "
    read aNum
    echo "输入第二个数字: "
    read anotherNum
    echo "两个数字分别为 $aNum 和 $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn
echo "输入的两个数字之和为 $? !" #函数返回值在调用该函数后通过 $? 来获得。
