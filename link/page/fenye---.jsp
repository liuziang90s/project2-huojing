<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
    <div align="center" class="my_page" id="my_page">
        <div class="sum" style="display:none;">
            ${requestScope.endpage}
        </div>
        <!--从后台得到总页码数-->
        <div class="current" style="display:none;">
            ${requestScope.currpage}
        </div>
        <!--从后台得到当前页码-->
        <div class="mypage">
            <div class="page_all">
                <div class="page_all">
                    <a href="page_servlet?forpage=user-front&currpage=1">
                        首页
                    </a>
                </div>
                <div class="page_all">
                    <a href="page_servlet?forpage=user-front&currpage=${requestScope.prepage}">
                        上一页
                    </a>
                </div>
                <div class="one page_all">
                </div>
                <div class="page_all">
                    <a href="page_servlet?forpage=user-front&currpage=${requestScope.nextpage}">
                        下一页
                    </a>
                </div>
                <div class="page_all">
                    <a href="page_servlet?forpage=user-front&currpage=${requestScope.endpage}">
                        末页
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {

        function page() {
            $(".one").html("");
            var sum = parseInt($(".sum").text()),
            //总页数
                    num = parseInt($(".current").text()); //当前页码
            var num_my = 9,
            //每页限制显示的页码数量
                    num_prev = 4,
            //当前页前面显示的的页码数量
                    num_next = 4; //当前页后面显示的的页码数量
            var n = sum - num; //总页数与当前页的差值
            var n1 = parseInt(num - num_prev); //页码显示行显示的第一个页码
            var n2 = parseInt(num) + parseInt(num_next); //页码显示行显示的最后一个页码
            var n3 = parseInt(num + ((sum - num)));
            var n4 = parseInt(sum - num);
            //如果总页码小于每页限制显示的数量
            if (sum <= num_my) {
                for (var i = 1; i <= sum; i++) {
                    $(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage=" + i + "'>" + i + "</a></div>");
                }
            } else { //否则则执行以下代码
                //如果总页数与当前页的差值大于或等于每页限制数
                if (num <= num_my) {
                    for (var i = 1; i <= num_my; i++) {
                        $(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage=" + i + "'>" + i + "</a></div>");
                    }

                } else {
                    if (n4 >= num_next) {
                        for (var i = n1; i <= n2; i++) {
                            $(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage=" + i + "'>" + i + "</a></div>");
                        }
                    } else {
                        for (var i = n1; i <= n3; i++) {
                            $(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage=" + i + "'>" + i + "</a></div>");
                        }
                    }
                }
            }
            //当前页码样式设置
            $(".one div a").each(function() {
                var txt = parseInt($(this).text()); //页码存储文本
                if (txt == num) {
                    $(this).parent().addClass("page_live");
                }
            });
        }
        page();

    })
</script>    