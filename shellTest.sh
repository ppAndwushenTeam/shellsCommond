#####http://c.biancheng.net/cpp/view/2737.html

#echo "Hello word!"


#echo "What is your name?"
#read PERSON
#echo "Hello, $PERSON"

#****************************************************************************************
#url=http://c.biancheng.net
#echo $url
#name='C语言中文网'
#echo $name
#author="严长生"
#echo $author

#****************************************************************************************
#author="严长生"
#echo $author
#echo ${author}
#
#skill="Java"
#echo "I am good at ${skill}Script"


#********************************************
#以单引号' '包围变量的值时，单引号里面是什么就输出什么，即使内容中有变量和命令（命令需要反引起来）也会把它们原样输出。这种方式比较适合定义显示纯字符串的情况，即不希望解析变量、命令等的场景。
#
#以双引号" "包围变量的值时，输出时会先解析里面的变量和命令，而不是把双引号中的变量名和命令原样输出。这种方式比较适合字符串中附带有变量和命令并且想将其解析后再输出的变量定义。

#url="http://c.biancheng.net"
#website1='C语言中文网：${url}'
#website2="C语言中文网：${url}"
#echo $website1
#echo $website2

#****************************************************************************************
#Shell 也支持将命令的执行结果赋值给变量，常见的有以下两种方式：
#variable=`command`
#variable=$(command)


#****************************************************************************************
#使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
#myUrl="http://see.xidian.edu.cn/cpp/shell/"
#readonly myUrl
#myUrl="http://see.xidian.edu.cn/cpp/danpianji/"


#****************************************************************************************
#myUrl="http://see.xidian.edu.cn/cpp/u/xitong/"
#unset myUrl
#echo $myUrl



#****************************************************************************************
#表示当前Shell进程的ID，即pid，看下面的代码：
#echo $$

#echo $0

#变量    含义
#$0    当前脚本的文件名
#$n    传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
#$#    传递给脚本或函数的参数个数。
#$*    传递给脚本或函数的所有参数。
#$@    传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
#$?    上个命令的退出状态，或函数的返回值。
#$$    当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。


#echo "File Name: $0"
#echo "First Parameter : $1"
#echo "First Parameter : $2"
#echo "Quoted Values: $@"
#echo "Quoted Values: $*"
#echo "Total Number of Parameters : $#"





#echo "\$*=" $*
#echo "\"\$*\"=" "$*"
#echo "\$@=" $@
#echo "\"\$@\"=" "$@"
#echo "print each param from \$*"
#for var in $*
#do
#    echo "$var"
#done
#echo "print each param from \$@"
#for var in $@
#do
#    echo "$var"
#done
#echo "print each param from \"\$*\""
#for var in "$*"
#do
#    echo "$var"
#done
#echo "print each param from \"\$@\""
#for var in "$@"
#do
#    echo "$var"
#done

#执行: ./shellTest.sh  "a" "b" "c" "d"


#DATE=`date`
#echo "Date is $DATE"
#
#USERS=`who | wc -l`
#echo "Logged in user are $USERS"
#
#UP=`date ; uptime`
#echo "Uptime is $UP"






#*************************Shell替换：Shell变量替换，命令替换，转义字符*****************************#
#echo ${var:-"Variable is not set"}
#echo "1 - Value of var is ${var}"
#
#echo ${var:="Variable is not set"}
#echo "2 - Value of var is ${var}"
#
#unset var
#echo ${var:+"This is default value"}
#echo "3 - Value of var is $var"
#
#var="Prefix"
#echo ${var:+"This is default value"}
#echo "4 - Value of var is $var"
#
#echo ${var:?"Print this message"}
#echo "5 - Value of var is ${var}"
