<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("p").click(function() {
			$(this).hide();
		});
	});
	//web-inf

	var testlist = "${userList}";
	console.log(testlist);
	/* console.log(listuser); */
</script>
</head>

<body>
	<p>web-if:If you click on me, I will disappear.</p>
	<%-- ${requestScope} --%>
	${requestScope.userList}
	<!-- Page、Request、Session、Application范围 -->
	<%--
pageScope
将页面范围的变量名称映射到其值。例如，EL 表达式可以使用 ${pageScope.objectName} 访问一个 JSP 中页面范围的对象，还可以使用 ${pageScope .objectName. attributeName} 访问对象的属性。
requestScope
将请求范围的变量名称映射到其值。该对象允许访问请求对象的属性。例如，EL 表达式可以使用 ${requestScope. objectName} 访问一个 JSP 请求范围的对象，还可以使用 ${requestScope. objectName. attributeName} 访问对象的属性。
sessionScope
将会话范围的变量名称映射到其值。该对象允许访问会话对象的属性。例如：
${sessionScope. name}
applicationScope
将应用程序范围的变量名称映射到其值。该隐式对象允许访问应用程序范围的对象。
--%>
	${userList}
	<!-- 返回的类型是List<User>，页面使用${userList} -->
</body>

</html>

<%--
《http://www.aichengxu.com/java/27608.htm》

springMVC教程（八）controller中方法的返回值类型

2014-06-20 10:10 本站整理 浏览(6053)
springMVC教程（八）controller中方法的返回值类型，有需要的朋友可以参考下。

controller中方法的返回值类型

springMvc中controller中方法的返回值除了可以返回String和ModelAndView两种类型外还有其他类型。

在这里上面用过的两种类型不再赘述。

其他类型还包括:void、ModelMap、Map、Object、map、List、Set。一般建议使用String。

1、void 返回值类型为void 则只是纯粹的执行了方法中的程序，然后响应的url依然为请求的url

例如案例中请求为index.do 则响应的url为 index 在视图解析器解析之后得到的最终的url为 /WEB-INF/jsp/index.jsp

示例：

//返回值为vood

@RequestMapping(value="/index.do",params="type=void")

publicvoid resultVoid(HttpServletRequest request){

request.setAttribute("void",

"resultVoid");

}

2、ModelMap 返回值为modelMap时，响应的url和void一致。

只是存储在MpdelMap中的数据可以在jsp页面中取出。

示例：

//返回值为ModelMap

@RequestMapping(value="index.do",params="type=modelMap")

public ModelMap resultModelMap(ModelMap map){

map.put("msg",

"这里是modleMap中的数据");

return map;

}

3、Map 和modelMap几乎完全一直。

示例：

//返回值为Map

@RequestMapping(value="index.do",params="type=map")

public

Map resultMap(){

Map<String,String> map =

new HashMap<String,String>();

map.put("msg",

"这里是Map中的数据");

return map;

}

4、List 返回list是响应的url和void一致。

只是spring会将list对象存储在request中，而该对象的存储的key为：当list中存储为String类型数据时 key为：stringList,当存储为User对象时 key为:userList。其他的类型的可以类比。
//返回值为List<String>

@RequestMapping(value="index.do",params="type=list_string")

public

List resultList_String(){

List ls = new

ArrayList();

ls.add("list1");ls.add("list2");ls.add("list3");

return ls;

}
//返回值为List<User>

@RequestMapping(value="index.do",params="type=list_user")

public List<User> resultList_User(){

List<User> ls = new ArrayList<User>();

ls.add(new User("张三"));

ls.add(new User("张四"));

return ls;

}

5、Set 返回Set类型的数据时和List除了没有顺序之外，其他都一直。
//返回值为Set<User>

@RequestMapping(value="index.do",params="type=set_user")

public Set<User> resultSet_User(){

Set<User> ls = new HashSet<User>();

ls.add(new User("张三"));

ls.add(new User("张四"));

return ls;

}

6、Object 返回object时，响应的url和以上一直，spirng也会将返回的对象存储在request中，该对象在request中的key为该对象类型的类名（首字母小写）

//返回值为User

@RequestMapping(value="index.do",params="type=user")

public User resultUser(){

returnnew User("张四");

}

所有的返回值类型页面获取方式为:

<h1>返回值类型</h1>

<p>

<h3>Void</h3>

<a

href="index.do?type=void">无返回值类型</a><br/>

${requestScope.void }

</p>

<p>

<h3>ModelMap</h3>

<a

href="index.do?type=modelMap">返回ModelMap</a><br/>

${requestScope.msg }

</p>

<p>

<h3>Map</h3>

<a

href="index.do?type=map">返回map</a><br/>

${requestScope.msg }

</p>

<p>

<h3>List</h3>

<a

href="index.do?type=list_string">返回List&lt;String&gt;</a><br/>

${requestScope.stringList }

</p>

<p>

<h3>List</h3>

<a

href="index.do?type=list_user">返回List&lt;User&gt;</a><br/>

${requestScope.userList }

</p>

<h3>Set</h3>

<a

href="index.do?type=set_user">返回Set&lt;User&gt;</a><br/>

${requestScope.userSet }

</p>

<h3>User(Object)</h3>

<a

href="index.do?type=user">返回User(Object)</a><br/>

${requestScope.user }

</p>
--%>