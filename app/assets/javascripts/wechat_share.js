function wxCallback(wxServerConfig) {
  wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: wxServerConfig.app_id, // 必填，公众号的唯一标识
    timestamp: wxServerConfig.timestamp , // 必填，生成签名的时间戳
    nonceStr: wxServerConfig.noncestr, // 必填，生成签名的随机串
    signature: wxServerConfig.signature,// 必填，签名，见附录1
    jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
  });

  wx.ready(function(){
    // 朋友圈
    wx.onMenuShareTimeline({
      title: wxData.title + ": " + wxData.desc, // 分享标题
      link: wxData.link, // 分享链接
      imgUrl: wxData.imgUrl, // 分享图标
      success: function () {
          // 用户确认分享后执行的回调函数
      },
      cancel: function () {
          // 用户取消分享后执行的回调函数
      }
    });

    // 朋友
    wx.onMenuShareAppMessage({
      title: wxData.title, // 分享标题
      desc: wxData.desc, // 分享描述
      link: wxData.link, // 分享链接
      imgUrl: wxData.imgUrl, // 分享图标
      type: 'link', // 分享类型,music、video或link，不填默认为link
      dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
      success: function () {
          // 用户确认分享后执行的回调函数
      },
      cancel: function () {
          // 用户取消分享后执行的回调函数
      }
    });
  })
}

(function() {
  var ticket = document.createElement("script");
  ticket.src = "//wechat-test1.eggman.tv/wechat/ticket.js?url=" + encodeURIComponent(window.location.href.split('#')[0]) + "&callback=wxCallback";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(ticket, s);
})();
