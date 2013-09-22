//= require jquery-1.10.1.min
//= require_tree .
$(function(){
  $("body").iealert({
    support: 'ie8',
    title: '你的浏览器太旧了，无法正常显示网页内容。',
    text: '你现在使用的IE浏览器长期无更新，不安全，速度慢，不支持新的网页标准。强烈建议你升级、安装最新版的浏览器，以便正常浏览网站内容。',
    upgradeTitle: '选择新版浏览器下载',
    upgradeLink: 'http://whatbrowser.org/'
  });
});
