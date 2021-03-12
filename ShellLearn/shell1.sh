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
