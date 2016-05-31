/*
focus slideView
 焦点图展示 调用方法示例
 $("id").slideView({
          vertical:true,                                //是否垂直显示
          timer : 3000,                                 // 运动时间
          showtype:{ 
              smallImg:$("#id>li")      				//小图数组
          },
          evt:"hover"                                   // 鼠标事件
    });
 */

define(function (require, exports, modules) {
    var $ = require("jquery");
    
    $.fn.extend({
        slideView: function(option) {
            var defaultOption = {
                displayNum: 1,
                scrollNum: 1,
                duration: 500,
                continuous: true,
                autoScroll: true,
                timer: 1000,
                displayLabel: "li",
                labelParent: "ul",
                showtype: '',
                showPos: 0,
                evt: "click",
                animate: 'slide',
                controller: '',
                onSlide: function(){}
            };
            $.extend(true, defaultOption, option);
            return this.each(function() {
                var first = true,
                    $this = $(this),
                    btWrap = defaultOption.btWrap,
                    displayNum = defaultOption.displayNum,
                    ldisplayNum = displayNum - 1,
                    displayLabel = defaultOption.displayLabel,
                    labelParent = defaultOption.labelParent,
                    duration = defaultOption.duration,
                    timer = defaultOption.timer,
                    scrollContainer = $this.find("[scroll=true]"),
                    scrollList = scrollContainer.find(">" + labelParent),
                    scrollItem = scrollList.find(">" + displayLabel),
                    scrollItemLen = scrollItem.length,
                    isEnough = scrollItemLen > displayNum,
                    scrollItemWorH = defaultOption.vertical ? scrollItem.outerHeight(true) : scrollItem.outerWidth(true),
                    isMouseDown = false,
                    rightDirection = true,
                    scrollAxis = defaultOption.vertical ? 'top' : 'left',
                    cssWorH = defaultOption.vertical ? 'height' : 'width',
                    scrollNum = defaultOption.scrollNum || 1,
                    startCount = 0,
                    scrollCount = 0,
                    scrollMax = scrollItemLen - displayNum,
                    animateLock = false,
                    autoScroll = defaultOption.autoScroll,
                    lastScroll = scrollMax % scrollNum,
                    num = defaultOption.num,
                    type = defaultOption.showtype,
                    title = type.title,
                    titleClass = type.titleClass || "cur",
                    smallImg = type.smallImg,
                    smallImgClass = type.smallImgClass || "cur",
                    leftRight = defaultOption.leftRight || "right",
                    global = displayNum,
                    showPosition = defaultOption.showPos,
                    imgIndex = 0,
                    mouseover = false,
                    click = false,
                    evt = defaultOption.evt,
                    animate = defaultOption.animate,
                    controller = defaultOption.controller,
                    conAttr = false;
                if (isNaN(showPosition) || showPosition < 0 || !scrollContainer[0] || !scrollList[0] || !scrollItemLen) {
                        return;
                    }
                if ( !! btWrap) {
                        var leftButton = btWrap.find(".scroll_up"),
                            rightButton = btWrap.find(".scroll_down");
                    } else {
                        var leftButton = $this.find(".scroll_up"),
                            rightButton = $this.find(".scroll_down");
                    }
                if ( !! controller) {
                        controller.click(function() {
                            clearInterval(autoScroll);
                            if (!conAttr) {
                                autoScroll = false;
                                conAttr = true;
                            } else {
                                conAttr = false;
                                autoScroll = true;
                                _autoScroll();
                            }
                        });
                    }
                if (scrollAxis === 'left') {
                        scrollItem.css({
                            "float": "left",
                            "display": "block"
                        });
                        scrollList.css({
                            "left" : 0
                        });
                        scrollContainer.css("height", scrollItem.outerHeight() + 'px');
                    }
                scrollContainer.css({
                        "position": "relative",
                        "overflow": "hidden",
                        "display": "block"
                    });
                scrollContainer.css(cssWorH, displayNum * scrollItemWorH + 'px');
                scrollList.css({
                        "position": "absolute"
                    });
                scrollList.css({
                        cssWorH: scrollItem.length * scrollItemWorH + 'px'
                    });
                _autoScroll();
                if (isEnough) {
                    rightButton.unbind("mousedown mouseup");
                    leftButton.unbind("mousedown mouseup");
                        rightButton.bind('mousedown', function() {
                            clearInterval(autoScroll);
                            _scrollRight(true);
                        }).bind('mouseup', function() {
                            isMouseDown = false;
                            _autoScroll();
                        });
                        leftButton.bind('mousedown', function() {
                            clearInterval(autoScroll);
                            _scrollLeft(true);
                        }).bind('mouseup', function() {
                            isMouseDown = false;
                            _autoScroll();
                        });
                    }
                if ( !! type) {
                        if (evt === 'click') {
                            smallImg.bind("click", function() {
                                click = true;
                                var index = smallImg.index($(this));
                                imgIndex = index;
                                clearInterval(autoScroll);
                                if ( !! rightDirection) {
                                    if (index === 0) {
                                        global = scrollItemLen + 1;
                                    } else {
                                        global = index + 1;
                                    }
                                } else {
                                    if (index === scrollItemLen) {
                                        global = 0;
                                    } else {
                                        global = index;
                                    }
                                }
                                if ( !! smallImg) {
                                    if (smallImg.find(">a").length > 0) {
                                        smallImg.eq(index).find(">a").addClass(smallImgClass).end().siblings().find(">a").removeClass(smallImgClass);
                                    }
                                    smallImg.eq(index).addClass(smallImgClass).siblings().removeClass(smallImgClass);
                                }
                                if ( !! title) {
                                    if (title.find(">a").length > 0) {
                                        title.eq(index).find(">a").removeClass("none").end().siblings().find(">a").addClass("none");
                                    }
                                    title.eq(index).removeClass("none").siblings().addClass("none");
                                }
                                if ( !! num) {
                                    num.eq(0).html(index + 1);
                                    num.eq(1).html(scrollItemLen);
                                }
                                if (animate === 'slide') {
                                    _animate(global);
                                } else {
                                    _fade(imgIndex);
                                }
                                return false;//取消默认事件
                            }).bind("mouseout", function() {
                                click = false;
                                _autoScroll();
                            }).bind("mouseover", function() {
                                clearInterval(autoScroll);
                            });
                        } else {
                            smallImg.bind("mouseover", function() {
                                clearInterval(autoScroll);
                                mouseover = true;
                                imgIndex = smallImg.index($(this));
                                if (animate === 'slide') {
                                    scrollList.each(function() {
                                        $(this).stop(false, true);
                                    });
                                }
                                if ($(this).find(">a").length > 0) {
                                    $(this).find(">a").addClass(smallImgClass);
                                    $(this).siblings().find(">a").removeClass(smallImgClass);

                                } else {
                                    $(this).addClass(smallImgClass).siblings().removeClass(smallImgClass);
                                }
                                if ( !! title) {
                                    if (title.find(">a").length > 0) {
                                        title.eq(imgIndex).find(">a").removeClass("none").end().siblings().find(">a").addClass("none");
                                    } else {
                                        title.eq(imgIndex).removeClass("none").siblings().addClass("none");
                                    }
                                }
                                if ( !! num) {
                                    num.eq(0).html(imgIndex + 1);
                                    num.eq(1).html(scrollItemLen);
                                }
                                if (animate === 'slide') {
                                    _animate(imgIndex + 1);
                                } else {
                                    _fade(imgIndex);
                                }
                            }).bind("mouseout", function() {
                                clearInterval(autoScroll);
                                mouseover = false;
                                _autoScroll();
                            });

                        }
                    }
                scrollItem.hover(function() {
                        clearInterval(autoScroll);
                    }, function() {
                        _autoScroll();
                    });

                function _scrollLeft(mouseDown) {
                        if (scrollCount < 0 || animateLock) return;
                        rightDirection = false;
                        isMouseDown = mouseDown || false;
                        global--;
                        imgIndex--;
                        scrollCount = global;
                        if (imgIndex < 0) {
                            imgIndex += scrollItemLen;
                        }
                        if (scrollCount < 0) {
                            scrollCount = global = scrollItemLen - 1;
                        }
                        if (animate === 'slide') {
                            _animate(scrollCount);
                        } else {
                            _fade(imgIndex);
                        }
                    }

                function _scrollRight(mouseDown) {
                        if (animateLock) return;

                        isMouseDown = mouseDown || false;
                        rightDirection = true;
                        global++;
                        imgIndex++;
                        scrollCount = global;
                        if (scrollCount > scrollItemLen + displayNum) {
                            scrollCount = global = displayNum + 1;
                        }
                        if (imgIndex >= scrollItemLen) {
                            imgIndex -= scrollItemLen;
                        }
                        if (scrollCount == displayNum) {
                            scrollCount = displayNum - 1;
                        }
                        if (animate === 'slide') {
                            _animate(scrollCount);
                        } else {
                            _fade(imgIndex);
                        }

                    };

                function _autoScroll() {
                        if ( !! first && displayNum === 1) {
                            if ( !! type) {
                                if ( !! smallImg) {
                                    if (smallImg.find(">a").length > 0) {
                                        smallImg.eq(showPosition).find(">a").addClass(smallImgClass).end().siblings().find(">a").removeClass(smallImgClass);
                                    }
                                    smallImg.eq(showPosition).addClass(smallImgClass).siblings().removeClass(smallImgClass);
                                }
                                if ( !! title) {
                                    if (title.find(">a").length > 0) {
                                        title.eq(showPosition).find(">a").removeClass("none").end().siblings().find(">a").addClass("none");
                                    }
                                    title.eq(showPosition).removeClass("none").siblings().addClass("none");
                                }
                            }
                            if ( !! num) {
                                num.eq(0).html(showPosition + 1);
                                num.eq(1).html(scrollItemLen);
                            }

                            if ( !! showPosition) {
                                if (animate === 'slide') {
                                    _animate(showPosition);
                                } else {
                                    _fade(showPosition);
                                }

                                global = showPosition;
                            }
                        }
                        if (!autoScroll || !isEnough) return;

                        if (leftRight == "left") {
                            autoScroll = setInterval(function() {
                                _scrollLeft();
                            }, timer);
                        } else if (leftRight == "right") {
                            autoScroll = setInterval(function() {
                                _scrollRight();

                            }, timer);
                        }
                    }
                function _fade(count) {
                        first = false;
                        scrollList.css({
                            "left": 0
                        });
                        scrollItem.each(function() {
                            $(this).css({
                                "opacity": 0.7,
                                "zIndex": 1,
                                "left": 0,
                                "position": "absolute"
                            });
                        });
                        scrollItem.eq(count).fadeTo("normal", 1).css("zIndex", 11).siblings().fadeTo("normal", 0.7);
                        if ( !! type) {
                            if ( !! smallImg) {
                                if (smallImg.find(">a").length > 0) {
                                    smallImg.eq(count).find(">a").addClass(smallImgClass).end().siblings().find(">a").removeClass(smallImgClass);
                                }
                                smallImg.eq(count).addClass(smallImgClass).siblings().removeClass(smallImgClass);
                            }
                            if ( !! title) {
                                if (title.find(">a").length > 0) {
                                    title.eq(count).find(">a").removeClass("none").end().siblings().find(">a").addClass("none");
                                }
                                title.eq(count).removeClass("none").siblings().addClass("none");
                            }
                        }
                    }
                function _animate(count) {
                        if (!animateLock) {
                            animateLock = true;
                            var index = null;
                            if (count > scrollItemLen + displayNum) return;
                            scrollCount = count;
                            if ( !! rightDirection) {
                                if (count === scrollItemLen + displayNum) {
                                    index = 0;
                                    if ( !! num) {
                                        num.eq(0).html(1);
                                    }
                                } else if (count === displayNum - 1) {

                                    scrollCount = scrollItemLen + displayNum;
                                    index = 0;
                                    if ( !! num) {
                                        num.eq(0).html(1);
                                    }
                                } else if (count === displayNum) {
                                    scrollCount = displayNum;
                                    index = 1;
                                    if ( !! num) {
                                        num.eq(0).html(1);
                                    }
                                }
                                else {
                                    index = count - 1;
                                    if ( !! num) {
                                        num.eq(0).html(count);
                                    }
                                }
                            } else {
                                if (count === 0) {
                                    index = scrollItemLen - 1;
                                    if ( !! num) {
                                        num.eq(0).html(scrollItemLen);
                                    }
                                } else if (count === scrollItemLen) {
                                    scrollCount = displayNum - 1;
                                    index = scrollItemLen;
                                    if ( !! num) {
                                        num.eq(0).html(scrollItemLen);
                                    }
                                } else {
                                    index = count;
                                    if ( !! num) {
                                        num.eq(0).html(index);
                                    }
                                }
                            }
                            if ( !! type) {
                                if ( !! mouseover) {
                                    index = imgIndex;
                                }
                                if ( !! rightDirection) {
                                    if ( !! smallImg) {
                                        if (smallImg.find(">a").length > 0) {
                                            smallImg.eq(index).find(">a").addClass(smallImgClass).end().siblings().find(">a").removeClass(smallImgClass);
                                        }
                                        smallImg.eq(index).addClass(smallImgClass).siblings().removeClass(smallImgClass);
                                    }
                                    if ( !! title) {
                                        if (title.find(">a").length > 0) {
                                            title.eq(index).find(">a").removeClass("none").end().siblings().find(">a").addClass("none");
                                        }
                                        title.eq(index).removeClass("none").siblings().addClass("none");
                                    }
                                } else {
                                    if ( !! smallImg) {
                                        if (smallImg.find(">a").length > 0) {
                                            smallImg.eq(count - 1).find(">a").addClass(smallImgClass).end().siblings().find(">a").removeClass(smallImgClass);
                                        }
                                        smallImg.eq(count - 1).addClass(smallImgClass).siblings().removeClass(smallImgClass);
                                    }
                                    if ( !! title) {
                                        if (title.find(">a").length > 0) {
                                            title.eq(count - 1).find(">a").removeClass("none").end().siblings().find(">a").addClass("none");
                                        }
                                        title.eq(count - 1).removeClass("none").siblings().addClass("none");
                                    }

                                }
                            }
                            if ( !! num) {
                                num.eq(1).html(scrollItemLen);
                            }
                            if ( !! click && scrollCount > scrollItemLen) {
                                scrollCount = 1;
                            }
                            first = false;
                            var property = {};
                            property[scrollAxis] = '-' + scrollCount * scrollItemWorH + 'px';
                            scrollList.animate(property, duration, function() {
                                animateLock = false;
                                if ( !! mouseover && animate === 'slide') {
                                    global = index + 1;
                                }
                                if (defaultOption.continuous) {
                                    if (rightDirection && scrollCount >= scrollMax) {
                                        scrollList.css(scrollAxis, '-' + startCount * scrollItemWorH + 'px');
                                        scrollCount = startCount;
                                    } else if (scrollCount <= 0) {
                                        scrollList.css(scrollAxis, '-' + scrollItemLen * scrollItemWorH + 'px');
                                    }
                                }
                            });
                            defaultOption.onSlide(count);
                        }
                    };
                if (defaultOption.continuous && isEnough) {
                        _buildHTML();
                    }

                function _buildHTML() {
                        var len = scrollItemLen;
                        var prepandNodes = scrollItem.slice(len - displayNum, len).clone().prependTo(scrollList);
                        var appendNodes = scrollItem.slice(0, displayNum).clone().appendTo(scrollList);
                        len += displayNum * 2;
                        scrollCount = startCount = displayNum;
                        scrollMax += displayNum * 2;
                        var property = {};
                        property[cssWorH] = len * scrollItemWorH + 'px';
                        property[scrollAxis] = '-' + startCount * scrollItemWorH + 'px';
                        scrollList.css(property);
                    };
                if (defaultOption.eventType) {
                        scrollList.bind(defaultOption.eventType, function(e) {
                            defaultOption.eventHandler(e);
                        });
                    }
            });
        }
    })

    modules.exports = $.slideView;
})