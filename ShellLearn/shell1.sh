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
