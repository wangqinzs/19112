
var listObj = getAllData();
var table = document.getElementById("table")
var box = document.getElementById("box")
var tbody = document.getElementById("tbody");
var totalPrice = document.getElementById("totalPrice");
var allCheck = document.getElementById("allCheck");

if(listObj.length == 0) { //购物车为空
  box.className = "box";
  table.className = "hide";
} else {
  box.className = "box hide";
  table.className = "";
  for(var i = 0, len = listObj.length; i < len; i++) {
    var tr = document.createElement("tr"); //createElement() 方法通过指定名称创建一个元素
    tr.setAttribute("pid", listObj[i].pid);
    //setAttribute() 方法创建或改变某个新属性。如果指定属性已经存在,则只设置该值。
    //{"pid":值,"pImg":值,"pName":值,"pDesc":值,"price":值,"pCount":1},
    tr.innerHTML = '<td style="text-align: center;">' +
        '<input type="checkbox" class="ck"  />' +
        '</td>' +
        '<td>' +
        '<img src="' + listObj[i].pImg + '" alt="" />' +
        '</td>' +
        '<td style="color: #1E5494; font-size: 14px;">' + '<p style="margin: 0 25%;">'+ listObj[i].pDesc + '</p>' +
        '</td>' +
        '<td>' +
        '<button style="margin-left: 35%" class="down">-</button>' +
        '<input style="width: 10%;" type="text" value="' + listObj[i].pCount + '" readonly="readonly" />' +
        '<button class="up">+</button>' +
        '</td>' +
        '<td>' +
        '<span style="font-size: 16px;font-family: 微软雅黑,宋体;font-weight: bold;display: block;text-align: center;">'+ listObj[i].price +  '</span>' +
        '</td>' +
        '<td>' +
        '<span style="font-size: 16px;font-family: 微软雅黑,宋体;font-weight: bold;display: block;text-align: center;">'+ listObj[i].price * listObj[i].pCount + '</span>' +
        '</td>' +
        '<td>' +
        '<button style="display: block; margin:auto;" class="del" >删除</button>' +
        '</td>';
    tbody.appendChild(tr);//appendChild() 方法向节点添加最后一个子节点。
  }
}

/*
 功能：计算总价格
 */
var cks = document.querySelectorAll("tbody .ck");
//querySelectorAll()方法返回匹配指定 CSS 选择器元素的所有元素 。
function getTotalPrice() {
  cks = document.querySelectorAll("tbody .ck");
  var sum = 0;
  for(var i = 0, len = cks.length; i < len; i++) {
    if(cks[i].checked) { //如果当前被选中
      var tr = cks[i].parentNode.parentNode;
      //parentNode 属性以 Node 对象的形式返回指定节点的父节点。如果指定节点没有父节点，则返回 null。
      var temp = tr.children[5].firstElementChild.innerHTML;
      sum = Number(temp) + sum;
    }
  }
  return sum;
}
/*循环遍历为每一个checkbox添加一个onchange事件*/
for(var i = 0, len = cks.length; i < len; i++) {
  cks[i].onchange = function() {
    checkAllChecked();
    totalPrice.innerHTML = getTotalPrice();
  }
}

/*全选实现*/
allCheck.onchange = function() {
  if(this.checked) {
    for(var i = 0, len = cks.length; i < len; i++) {
      cks[i].checked = true;
    }
  } else {
    for(var i = 0, len = cks.length; i < len; i++) {
      cks[i].checked = false;
    }
  }
  totalPrice.innerHTML = getTotalPrice();
}

var downs = document.querySelectorAll(".down"); //一组减的按钮
var ups = document.querySelectorAll(".up"); //一组加的按钮
var dels = document.querySelectorAll(".del"); //一组删除按钮
for(var i = 0, len = downs.length; i < len; i++) {
  downs[i].onclick = function() {
    var txtObj = this.nextElementSibling;//下一个兄弟节点
    var tr = this.parentNode.parentNode;
    var pid = tr.getAttribute("pid"); //getAttribute() 方法返回指定属性名的属性值。
    txtObj.value = txtObj.value - 1;
    if(txtObj.value < 1) {
      txtObj.value = 1;
      updateObjById(pid, 0)
    } else {
      updateObjById(pid, -1)
    }
    tr.children[0].firstElementChild.checked = true;
    checkAllChecked();
    var price = tr.children[4].firstElementChild.innerHTML;
    tr.children[5].firstElementChild.innerHTML = price * txtObj.value;
    totalPrice.innerHTML = getTotalPrice();

  }

  ups[i].onclick = function() {
    var txtObj = this.previousElementSibling;//上一个兄弟节点
    var tr = this.parentNode.parentNode;
    var pid = tr.getAttribute("pid");
    txtObj.value = Number(txtObj.value) + 1;
    updateObjById(pid, 1)
    tr.children[0].firstElementChild.checked = true;
    checkAllChecked()
    var price = tr.children[4].firstElementChild.innerHTML;
    tr.children[5].firstElementChild.innerHTML = price * txtObj.value;
    totalPrice.innerHTML = getTotalPrice();
  }

  dels[i].onclick = function() {
    var tr = this.parentNode.parentNode;
    var pid = tr.getAttribute("pid")
    if(confirm("确定删除？")) {
      //remove()  移除
      tr.remove();
      listObj = deleteObjByPid(pid);
    }
    if(listObj.length == 0) { //购物车为空
      box.className = "box";
      table.className = "hide";
    } else {
      box.className = "box hide";
      table.className = "";
    }
    totalPrice.innerHTML = getTotalPrice();
  }
}

/*检测是否要全选*/
function checkAllChecked() {
  var isSelected = true; //全选是否会选中
  for(var j = 0, len = cks.length; j < len; j++) {
    if(cks[j].checked == false) {
      isSelected = false;
      break;
    }
  }
  allCheck.checked = isSelected;
}
