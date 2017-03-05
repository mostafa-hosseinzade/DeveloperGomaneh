			(function() {
				function isTouchDevice() {
					return (('ontouchstart' in window) ||
						(navigator.MaxTouchPoints > 0) ||
						(navigator.msMaxTouchPoints > 0));
				}

				function userAgentDetection() {
					var ua = navigator.userAgent.toLowerCase(),
					platform = navigator.platform.toLowerCase(),
					UA = ua.match(/(opera|ie|firefox|chrome|version)[\s\/:]([\w\d\.]+)?.*?(safari|version[\s\/:]([\w\d\.]+)|$)/) || [null, 'unknown', 0],
					mode = UA[1] == 'ie' && document.documentMode;

					window.gemBrowser = {
						name: (UA[1] == 'version') ? UA[3] : UA[1],
						version: UA[2],
						platform: {
							name: ua.match(/ip(?:ad|od|hone)/) ? 'ios' : (ua.match(/(?:webos|android)/) || platform.match(/mac|win|linux/) || ['other'])[0]
							}
					};
						}

				window.updateGemClientSize = function() {
					window.gemOptions.clientWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
					window.gemOptions.clientHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
				};

				window.updateGemInnerSize = function(width) {
					window.gemOptions.innerWidth = width != undefined ? width : document.body.clientWidth;
				};

				window.gemOptions = {
					first: false,
					clientWidth: 0,
					clientHeight: 0,
					innerWidth: -1
				};

				userAgentDetection();
				window.updateGemClientSize(true);

				window.gemSettings = {
					isTouch: isTouchDevice(),
					forcedLasyDisabled: false,
					tabletPortrait: true,
					tabletLandscape: false,
					topAreaMobileDisable: true,
					parallaxDisabled: false,
					fillTopArea: false
				};

				window.gemSettings.lasyDisabled = window.gemSettings.isTouch || window.gemOptions.clientWidth <= 800 || window.gemSettings.forcedLasyDisabled;
			})();


			(function() {
				if ((window.gemSettings.isTouch || window.gemSettings.lasyDisabled) && !window.gemSettings.forcedLasyDisabled) {
					var head  = document.getElementsByTagName('head')[0],
						link  = document.createElement('link');
					link.rel  = 'stylesheet';
					link.type = 'text/css';
					link.href = '../../../thegem2.codexthemes.netdna-cdn.com/thegem/app-one-pager/wp-content/themes/TheGem/css/touch.css';
					head.appendChild(link);
					}

				if (window.gemSettings.parallaxDisabled) {
					var head  = document.getElementsByTagName('head')[0],
						link  = document.createElement('style');
					link.rel  = 'stylesheet';
					link.type = 'text/css';
					link.innerHTML = ".fullwidth-block.fullwidth-block-parallax-vertical .fullwidth-block-background, .fullwidth-block.fullwidth-block-parallax-fixed .fullwidth-block-background { background-attachment: scroll !important; }";
					head.appendChild(link);
				}
			})();

			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/72x72\/","ext":".png","source":{"concatemoji":"http:\/\/codex-themes.com\/thegem\/app-one-pager\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.5.3"}};
			!function(a,b,c){function d(a){var c,d,e,f=b.createElement("canvas"),g=f.getContext&&f.getContext("2d"),h=String.fromCharCode;if(!g||!g.fillText)return!1;switch(g.textBaseline="top",g.font="600 32px Arial",a){case"flag":return g.fillText(h(55356,56806,55356,56826),0,0),f.toDataURL().length>3e3;case"diversity":return g.fillText(h(55356,57221),0,0),c=g.getImageData(16,16,1,1).data,d=c[0]+","+c[1]+","+c[2]+","+c[3],g.fillText(h(55356,57221,55356,57343),0,0),c=g.getImageData(16,16,1,1).data,e=c[0]+","+c[1]+","+c[2]+","+c[3],d!==e;case"simple":return g.fillText(h(55357,56835),0,0),0!==g.getImageData(16,16,1,1).data[0];case"unicode8":return g.fillText(h(55356,57135),0,0),0!==g.getImageData(16,16,1,1).data[0]}return!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g,h,i;for(i=Array("simple","flag","unicode8","diversity"),c.supports={everything:!0,everythingExceptFlag:!0},h=0;h<i.length;h++)c.supports[i[h]]=d(i[h]),c.supports.everything=c.supports.everything&&c.supports[i[h]],"flag"!==i[h]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[i[h]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);


			/* <![CDATA[ */
var LS_Meta = {"v":"5.6.9"};
/* ]]> */


(function() {
			var fullwithData = {
				page: null,
				pageWidth: 0,
				pageOffset: {},
				fixVcRow: true,
				pagePaddingLeft: 0
			};

			function updateFullwidthData() {
				fullwithData.pageOffset = fullwithData.page.getBoundingClientRect();
				fullwithData.pageWidth = parseFloat(fullwithData.pageOffset.width);
				fullwithData.pagePaddingLeft = 0;

				if (fullwithData.page.className.indexOf('vertical-header') != -1) {
					fullwithData.pagePaddingLeft = 45;
					if (fullwithData.pageWidth >= 1600) {
						fullwithData.pagePaddingLeft = 360;
					}
					if (fullwithData.pageWidth < 980) {
						fullwithData.pagePaddingLeft = 0;
					}
				}
			}

			function gem_fix_fullwidth_position(element) {
				if (element == null) {
					return false;
				}

				if (fullwithData.page == null) {
					fullwithData.page = document.getElementById('page');
					updateFullwidthData();
				}

				if (fullwithData.pageWidth < 1170) {
					return false;
				}

				if (!fullwithData.fixVcRow) {
					return false;
				}

				if (element.previousElementSibling != null && element.previousElementSibling != undefined && element.previousElementSibling.className.indexOf('fullwidth-block') == -1) {
					var elementParentViewportOffset = element.previousElementSibling.getBoundingClientRect();
				} else {
					var elementParentViewportOffset = element.parentNode.getBoundingClientRect();
				}

				if (elementParentViewportOffset.top > window.gemOptions.clientHeight) {
					fullwithData.fixVcRow = false;
					return false;
				}

				if (element.className.indexOf('vc_row') != -1) {
					var elementMarginLeft = -21;
					var elementMarginRight = -21;
				} else {
					var elementMarginLeft = 0;
					var elementMarginRight = 0;
				}

				var offset = parseInt(fullwithData.pageOffset.left + 0.5) - parseInt((elementParentViewportOffset.left < 0 ? 0 : elementParentViewportOffset.left) + 0.5) - elementMarginLeft + fullwithData.pagePaddingLeft;

				element.style.position = 'relative';
				element.style.left = offset + 'px';
				element.style.width = fullwithData.pageWidth - fullwithData.pagePaddingLeft + 'px';

				if (element.className.indexOf('vc_row') == -1) {
					element.setAttribute('data-fullwidth-updated', 1);
				}

				if (element.className.indexOf('vc_row') != -1 && !element.hasAttribute('data-vc-stretch-content')) {
					var el_full = element.parentNode.querySelector('.vc_row-full-width-before');
					var padding = -1 * offset;
					0 > padding && (padding = 0);
					var paddingRight = fullwithData.pageWidth - padding - el_full.offsetWidth + elementMarginLeft + elementMarginRight;
					0 > paddingRight && (paddingRight = 0);
					element.style.paddingLeft = padding + 'px';
					element.style.paddingRight = paddingRight + 'px';
				}
			}

			window.gem_fix_fullwidth_position = gem_fix_fullwidth_position;
		})();

		(function() {
				setTimeout(function() {
					var preloader = document.getElementById('page-preloader');
					if (preloader != null && preloader != undefined) {
						preloader.className += ' preloader-loaded';
					}
				}, window.pagePreloaderHideTime || 1000);
			})();

			var htmlDiv = document.getElementById("rs-plugin-settings-inline-css");
            var htmlDivCss = "";
            if (htmlDiv) {
                htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
            } else {
                var htmlDiv = document.createElement("div");
                htmlDiv.innerHTML = "<style>" + htmlDivCss + "</style>";
                document.getElementsByTagName("head")[0].appendChild(htmlDiv.childNodes[0]);
            }

            var htmlDiv = document.getElementById("rs-plugin-settings-inline-css");
                                    var htmlDivCss = "";
                                    if (htmlDiv) {
                                        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                                    } else {
                                        var htmlDiv = document.createElement("div");
                                        htmlDiv.innerHTML = "<style>" + htmlDivCss + "</style>";
                                        document.getElementsByTagName("head")[0].appendChild(htmlDiv.childNodes[0]);
                                    }


           /******************************************
                                 -	PREPARE PLACEHOLDER FOR SLIDER	-
                                 ******************************************/

                                var setREVStartSize = function () {
                                    try {
                                        var e = new Object, i = jQuery(window).width(), t = 9999, r = 0, n = 0, l = 0, f = 0, s = 0, h = 0;
                                        e.c = jQuery('#rev_slider_5_1');
                                        e.responsiveLevels = [1240, 1024, 778, 480];
                                        e.gridwidth = [1240, 1025, 778, 480];
                                        e.gridheight = [868, 768, 960, 720];

                                        e.sliderLayout = "fullscreen";
                                        e.fullScreenAutoWidth = 'off';
                                        e.fullScreenAlignForce = 'off';
                                        e.fullScreenOffsetContainer = '';
                                        e.fullScreenOffset = '';
                                        if (e.responsiveLevels && (jQuery.each(e.responsiveLevels, function (e, f) {
                                            f > i && (t = r = f, l = e), i > f && f > r && (r = f, n = e)
                                        }), t > r && (l = n)), f = e.gridheight[l] || e.gridheight[0] || e.gridheight, s = e.gridwidth[l] || e.gridwidth[0] || e.gridwidth, h = i / s, h = h > 1 ? 1 : h, f = Math.round(h * f), "fullscreen" == e.sliderLayout) {
                                            var u = (e.c.width(), jQuery(window).height());
                                            if (void 0 != e.fullScreenOffsetContainer) {
                                                var c = e.fullScreenOffsetContainer.split(",");
                                                if (c)
                                                    jQuery.each(c, function (e, i) {
                                                        u = jQuery(i).length > 0 ? u - jQuery(i).outerHeight(!0) : u
                                                    }), e.fullScreenOffset.split("%").length > 1 && void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 ? u -= jQuery(window).height() * parseInt(e.fullScreenOffset, 0) / 100 : void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 && (u -= parseInt(e.fullScreenOffset, 0))
                                            }
                                            f = u
                                        } else
                                            void 0 != e.minHeight && f < e.minHeight && (f = e.minHeight);
                                        e.c.closest(".rev_slider_wrapper").css({height: f})

                                    } catch (d) {
                                        console.log("Failure at Presize of Slider:" + d)
                                    }
                                };

                                setREVStartSize();

                                var tpj = jQuery;

                                var revapi5;
                                tpj(document).ready(function () {
                                    if (tpj("#rev_slider_5_1").revolution == undefined) {
                                        revslider_showDoubleJqueryError("#rev_slider_5_1");
                                    } else {
                                        revapi5 = tpj("#rev_slider_5_1").show().revolution({
                                            sliderType: "standard",
                                            jsFileLocation: "//codex-themes.com/thegem/app-one-pager/wp-content/plugins/revslider/public/assets/js/",
                                            sliderLayout: "fullscreen",
                                            dottedOverlay: "none",
                                            delay: 8000,
                                            navigation: {
                                                keyboardNavigation: "off",
                                                keyboard_direction: "horizontal",
                                                mouseScrollNavigation: "off",
                                                mouseScrollReverse: "default",
                                                onHoverStop: "off",
                                                touch: {
                                                    touchenabled: "on",
                                                    swipe_threshold: 75,
                                                    swipe_min_touches: 1,
                                                    swipe_direction: "horizontal",
                                                    drag_block_vertical: false
                                                }
                                                ,
                                                arrows: {
                                                    style: "gyges",
                                                    enable: true,
                                                    hide_onmobile: true,
                                                    hide_under: 0,
                                                    hide_onleave: false,
                                                    tmp: '',
                                                    left: {
                                                        h_align: "left",
                                                        v_align: "center",
                                                        h_offset: 20,
                                                        v_offset: 0
                                                    },
                                                    right: {
                                                        h_align: "right",
                                                        v_align: "center",
                                                        h_offset: 20,
                                                        v_offset: 0
                                                    }
                                                }
                                            },
                                            responsiveLevels: [1240, 1024, 778, 480],
                                            visibilityLevels: [1240, 1024, 778, 480],
                                            gridwidth: [1240, 1025, 778, 480],
                                            gridheight: [868, 768, 960, 720],
                                            lazyType: "none",
                                            parallax: {
                                                type: "mouse",
                                                origo: "slidercenter",
                                                speed: 400,
                                                levels: [-12, -9, -7, -5, -3, -2, -1, 1, 2, 3, 5, 7, 9, 12, 24, 55],
                                                type:"mouse",
                                                        disable_onmobile: "on"
                                            },
                                            shadow: 0,
                                            spinner: "off",
                                            stopLoop: "off",
                                            stopAfterLoops: -1,
                                            stopAtSlide: -1,
                                            shuffle: "off",
                                            autoHeight: "off",
                                            fullScreenAutoWidth: "off",
                                            fullScreenAlignForce: "off",
                                            fullScreenOffsetContainer: "",
                                            fullScreenOffset: "",
                                            hideThumbsOnMobile: "off",
                                            hideSliderAtLimit: 0,
                                            hideCaptionAtLimit: 0,
                                            hideAllCaptionAtLilmit: 0,
                                            debugMode: false,
                                            fallbacks: {
                                                simplifyAll: "off",
                                                nextSlideOnWindowFocus: "off",
                                                disableFocusListener: false,
                                                panZoomDisableOnMobile: "on",
                                            }
                                        });
                                    }
                                });	/*ready*/

			 var htmlDivCss = unescape(".gem-slideshow%20.gem-button_1%3Ahover%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20transition%3A%20all%201s%20linear%3B%0A%09-moz-transition%3A%20all%201s%20linear%3B%0A%09-webkit-transition%3A%20all%201s%20linear%3B%0A%7D%0A.gem-slideshow%20%20.gem-button%20%7B%0A%20%20%20%20%20transition%3A%20all%200.2%20linear%20%21important%3B%0A%09-moz-transition%3A%20all%200.2s%20linear%20%21important%3B%0A%09-webkit-transition%3A%20all%200.2s%20linear%20%21important%3B%0A%20%7D%0A%0Abody%20.slideshow-preloader%20%7B%0A%09height%3A%20100vh%3B%0A%7D%0A.scrolldown%20%7B%0A%20%20%20%20position%3A%20absolute%3B%0A%09z-index%3A9%3B%0A%20%20%20%20background-color%3A%20rgba%2822%2C195%2C241%2C0.8%29%3B%0A%20%20%20%20padding%3A%2020px%2030px%20%21important%3B%0A%20%20%20%20border-radius%3A%2050%25%3B%0A%20%20%20%20text-align%3A%20center%3B%0A%7D%0Aa.scrolldown.mouse-2-sl.scroll-to-anchor%20%7B%0A%20%20%20%20background-color%3A%20transparent%20%21important%3B%0A%7D%0A%0A.scrolldown%20%7B%0A%09position%3A%20absolute%3B%0A%09left%3A%20auto%20%21important%3B%0A%09margin-left%3A%200%20%21important%3B%0A%7D%0A%0A.scrolldown%20img%7B%0A%09-webkit-animation%3A%20scrollmove%201s%20infinite%20ease%3B%0A%20%20%20%20-moz-animation%3A%20scrollmove%201s%20infinite%20ease%3B%0A%20%20%20%20animation%3A%20scrollmove%201s%20infinite%20ease%3B%0A%20%20%20%20width%3A%201.5vw%3B%0A%20%20%20%20%20%20%20%20margin-top%3A%207px%20%21important%3B%0A%7D%0A%0A%0A%40-moz-keyframes%20scrollmove%20%7B%0A%20%20%20%200%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%7D%0A%20%20%20%2050%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%7D%0A%20%20%20%20100%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%7D%0A%7D%0A%40-webkit-keyframes%20scrollmove%20%7B%0A%20%20%20%200%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%7D%0A%20%20%20%2050%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%7D%0A%20%20%20%20100%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%7D%0A%7D%0A%40keyframes%20scrollmove%20%7B%0A%20%20%20%200%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%7D%0A%20%20%20%2050%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%28-10px%29%3B%0A%20%20%20%20%7D%0A%20%20%20%20100%25%20%7B%0A%20%20%20%20%20%20%20%20-moz-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-webkit-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-o-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20-ms-transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%20%20%20%20transform%3A%20translateY%280px%29%3B%0A%20%20%20%20%7D%0A%7D%0A.gem-button-size-medium%20%7B%0A%20%20line-height%3A%204em%20%21important%3B%0A%20%20%20%20height%3A%20auto%20%21important%3B%0A%7D%0A%0A.gem-button-size-large%20%7B%0A%20%20%20%20height%3A%20auto%20%21important%3B%0A%7D");
                                var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                                if (htmlDiv) {
                                    htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                                } else {
                                    var htmlDiv = document.createElement('div');
                                    htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                                    document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                                }


var htmlDiv = document.getElementById("rs-plugin-settings-inline-css");
                                                                                                                    var htmlDivCss = "";
                                                                                                                    if (htmlDiv) {
                                                                                                                        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                                                                                                                    } else {
                                                                                                                        var htmlDiv = document.createElement("div");
                                                                                                                        htmlDiv.innerHTML = "<style>" + htmlDivCss + "</style>";
                                                                                                                        document.getElementsByTagName("head")[0].appendChild(htmlDiv.childNodes[0]);
                                                                                                                    }


var htmlDiv = document.getElementById("rs-plugin-settings-inline-css");
                                                                                                            var htmlDivCss = "";
                                                                                                            if (htmlDiv) {
                                                                                                                htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                                                                                                            } else {
                                                                                                                var htmlDiv = document.createElement("div");
                                                                                                                htmlDiv.innerHTML = "<style>" + htmlDivCss + "</style>";
                                                                                                                document.getElementsByTagName("head")[0].appendChild(htmlDiv.childNodes[0]);
                                                                                                            }
                         /******************************************
                                                                                                         -	PREPARE PLACEHOLDER FOR SLIDER	-
                                                                                                         ******************************************/

                                                                                                        var setREVStartSize = function () {
                                                                                                            try {
                                                                                                                var e = new Object, i = jQuery(window).width(), t = 9999, r = 0, n = 0, l = 0, f = 0, s = 0, h = 0;
                                                                                                                e.c = jQuery('#rev_slider_4_2');
                                                                                                                e.gridwidth = [350];
                                                                                                                e.gridheight = [438];

                                                                                                                e.sliderLayout = "fullwidth";
                                                                                                                if (e.responsiveLevels && (jQuery.each(e.responsiveLevels, function (e, f) {
                                                                                                                    f > i && (t = r = f, l = e), i > f && f > r && (r = f, n = e)
                                                                                                                }), t > r && (l = n)), f = e.gridheight[l] || e.gridheight[0] || e.gridheight, s = e.gridwidth[l] || e.gridwidth[0] || e.gridwidth, h = i / s, h = h > 1 ? 1 : h, f = Math.round(h * f), "fullscreen" == e.sliderLayout) {
                                                                                                                    var u = (e.c.width(), jQuery(window).height());
                                                                                                                    if (void 0 != e.fullScreenOffsetContainer) {
                                                                                                                        var c = e.fullScreenOffsetContainer.split(",");
                                                                                                                        if (c)
                                                                                                                            jQuery.each(c, function (e, i) {
                                                                                                                                u = jQuery(i).length > 0 ? u - jQuery(i).outerHeight(!0) : u
                                                                                                                            }), e.fullScreenOffset.split("%").length > 1 && void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 ? u -= jQuery(window).height() * parseInt(e.fullScreenOffset, 0) / 100 : void 0 != e.fullScreenOffset && e.fullScreenOffset.length > 0 && (u -= parseInt(e.fullScreenOffset, 0))
                                                                                                                    }
                                                                                                                    f = u
                                                                                                                } else
                                                                                                                    void 0 != e.minHeight && f < e.minHeight && (f = e.minHeight);
                                                                                                                e.c.closest(".rev_slider_wrapper").css({height: f})

                                                                                                            } catch (d) {
                                                                                                                console.log("Failure at Presize of Slider:" + d)
                                                                                                            }
                                                                                                        };

                                                                                                        setREVStartSize();

                                                                                                        var tpj = jQuery;

                                                                                                        var revapi4;
                                                                                                        tpj(document).ready(function () {
                                                                                                            if (tpj("#rev_slider_4_2").revolution == undefined) {
                                                                                                                revslider_showDoubleJqueryError("#rev_slider_4_2");
                                                                                                            } else {
                                                                                                                revapi4 = tpj("#rev_slider_4_2").show().revolution({
                                                                                                                    sliderType: "carousel",
                                                                                                                    jsFileLocation: "//codex-themes.com/thegem/app-one-pager/wp-content/plugins/revslider/public/assets/js/",
                                                                                                                    sliderLayout: "fullwidth",
                                                                                                                    dottedOverlay: "none",
                                                                                                                    delay: 9000,
                                                                                                                    navigation: {
                                                                                                                        keyboardNavigation: "off",
                                                                                                                        keyboard_direction: "horizontal",
                                                                                                                        mouseScrollNavigation: "off",
                                                                                                                        mouseScrollReverse: "default",
                                                                                                                        onHoverStop: "on",
                                                                                                                        touch: {
                                                                                                                            touchenabled: "on",
                                                                                                                            swipe_threshold: 75,
                                                                                                                            swipe_min_touches: 1,
                                                                                                                            swipe_direction: "horizontal",
                                                                                                                            drag_block_vertical: false
                                                                                                                        }
                                                                                                                        ,
                                                                                                                        bullets: {
                                                                                                                            enable: true,
                                                                                                                            hide_onmobile: false,
                                                                                                                            style: "ares",
                                                                                                                            hide_onleave: false,
                                                                                                                            direction: "horizontal",
                                                                                                                            h_align: "center",
                                                                                                                            v_align: "bottom",
                                                                                                                            h_offset: 0,
                                                                                                                            v_offset: -145,
                                                                                                                            space: 8,
                                                                                                                            tmp: '<span class="tp-bullet-title">{{title}}</span>'
                                                                                                                        }
                                                                                                                    },
                                                                                                                    carousel: {
                                                                                                                        horizontal_align: "center",
                                                                                                                        vertical_align: "center",
                                                                                                                        fadeout: "on",
                                                                                                                        vary_fade: "on",
                                                                                                                        maxVisibleItems: 5,
                                                                                                                        infinity: "on",
                                                                                                                        space: -30,
                                                                                                                        stretch: "off"
                                                                                                                    },
                                                                                                                    visibilityLevels: [1240, 1024, 778, 480],
                                                                                                                    gridwidth: 350,
                                                                                                                    gridheight: 438,
                                                                                                                    lazyType: "none",
                                                                                                                    shadow: 0,
                                                                                                                    spinner: "off",
                                                                                                                    stopLoop: "off",
                                                                                                                    stopAfterLoops: -1,
                                                                                                                    stopAtSlide: -1,
                                                                                                                    shuffle: "off",
                                                                                                                    autoHeight: "off",
                                                                                                                    disableProgressBar: "on",
                                                                                                                    hideThumbsOnMobile: "off",
                                                                                                                    hideSliderAtLimit: 0,
                                                                                                                    hideCaptionAtLimit: 0,
                                                                                                                    hideAllCaptionAtLilmit: 0,
                                                                                                                    debugMode: false,
                                                                                                                    fallbacks: {
                                                                                                                        simplifyAll: "off",
                                                                                                                        nextSlideOnWindowFocus: "off",
                                                                                                                        disableFocusListener: false,
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                        });	/*ready*/

			 var htmlDivCss = unescape(".tp-static-layers%20%7B%0A%20%20%20%20left%3A%2050%25%3B%0A%20%20%20%20margin-left%3A%20-230px%3B%0A%7D");
                                                                                                        var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                                                                                                        if (htmlDiv) {
                                                                                                            htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                                                                                                        } else {
                                                                                                            var htmlDiv = document.createElement('div');
                                                                                                            htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                                                                                                            document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                                                                                                        }


                                                                                                             var htmlDivCss = unescape(".ares.tp-bullets%20%7B%0A%7D%0A.ares.tp-bullets%3Abefore%20%7B%0A%09content%3A%22%20%22%3B%0A%09position%3Aabsolute%3B%0A%09width%3A100%25%3B%0A%09height%3A100%25%3B%0A%09background%3Atransparent%3B%0A%09padding%3A10px%3B%0A%09margin-left%3A-10px%3Bmargin-top%3A-10px%3B%0A%09box-sizing%3Acontent-box%3B%0A%7D%0A.ares%20.tp-bullet%20%7B%0A%09width%3A12px%3B%0A%09height%3A12px%3B%0A%09position%3Aabsolute%3B%0A%09background%3Argba%28104%2C%20222%2C%20254%2C%201%29%3B%0A%09border-radius%3A50%25%3B%0A%09cursor%3A%20pointer%3B%0A%09box-sizing%3Acontent-box%3B%0A%7D%0A.ares%20.tp-bullet%3Ahover%2C%0A.ares%20.tp-bullet.selected%20%7B%0A%09background%3Argba%28255%2C%20255%2C%20255%2C%201%29%3B%0A%7D%0A.ares%20.tp-bullet-title%20%7B%0A%20%20position%3Aabsolute%3B%0A%20%20color%3A104%2C%20222%2C%20254%3B%0A%20%20font-size%3A10px%3B%0A%20%20padding%3A0px%2010px%3B%0A%20%20font-weight%3A600%3B%0A%20%20right%3A27px%3B%0A%20%20top%3A-4px%3B%20%20%0A%20%20background%3Argba%28255%2C%20255%2C%20255%2C%201%29%3B%0A%20%20visibility%3Ahidden%3B%0A%20%20transform%3Atranslatex%28-20px%29%3B%0A%20%20-webkit-transform%3Atranslatex%28-20px%29%3B%0A%20%20transition%3Atransform%200.3s%3B%0A%20%20-webkit-transition%3Atransform%200.3s%3B%0A%20%20line-height%3A20px%3B%0A%20%20white-space%3Anowrap%3B%0A%7D%20%20%20%20%20%0A%0A.ares%20.tp-bullet-title%3Aafter%20%7B%0A%20%20%20%20width%3A%200px%3B%0A%09height%3A%200px%3B%0A%09border-style%3A%20solid%3B%0A%09border-width%3A%2010px%200%2010px%2010px%3B%0A%09border-color%3A%20transparent%20transparent%20transparent%20rgba%28255%2C%20255%2C%20255%2C%201%29%3B%0A%09content%3A%22%20%22%3B%0A%20%20%20%20position%3Aabsolute%3B%0A%20%20%20%20right%3A-10px%3B%0A%09top%3A0px%3B%0A%7D%0A%20%20%20%20%0A.ares%20.tp-bullet%3Ahover%20.tp-bullet-title%7B%0A%20%20visibility%3Avisible%3B%0A%20%20%20transform%3Atranslatex%280px%29%3B%0A%20%20-webkit-transform%3Atranslatex%280px%29%3B%0A%7D%0A%0A.ares%20.tp-bullet.selected%3Ahover%20.tp-bullet-title%20%7B%0A%20%20%20%20background%3Argba%28255%2C%20255%2C%20255%2C%201%29%3B%7D%0A.ares%20.tp-bullet.selected%3Ahover%20.tp-bullet-title%3Aafter%20%7B%0A%20%20border-color%3Atransparent%20transparent%20transparent%20rgba%28255%2C%20255%2C%20255%2C%201%29%3B%0A%7D%0A.ares.tp-bullets%3Ahover%20.tp-bullet-title%20%7B%0A%20%20visibility%3Ahidden%3B%0A%20%20%0A%7D%0A.ares.tp-bullets%3Ahover%20.tp-bullet%3Ahover%20.tp-bullet-title%20%7B%0A%20%20%20%20visibility%3Avisible%3B%0A%20%20%20%20transform%3AtranslateX%280px%29%20translatey%280px%29%3B%0A%20%20-webkit-transform%3AtranslateX%280px%29%20translatey%280px%29%3B%0A%7D%0A%0A%0A%2F%2A%20VERTICAL%20%2A%2F%0A.ares.nav-dir-vertical.nav-pos-hor-left%20.tp-bullet-title%20%7B%20right%3Aauto%3B%20left%3A27px%3B%20%20transform%3Atranslatex%2820px%29%3B%20-webkit-transform%3Atranslatex%2820px%29%3B%7D%20%20%0A.ares.nav-dir-vertical.nav-pos-hor-left%20.tp-bullet-title%3Aafter%20%7B%20%0A%20%20border-width%3A%2010px%2010px%2010px%200%20%21important%3B%0A%20%20border-color%3A%20transparent%20rgba%28255%2C%20255%2C%20255%2C%201%29%20transparent%20transparent%3B%0A%20%20right%3Aauto%20%21important%3B%0A%20%20left%3A-10px%20%21important%3B%20%20%20%0A%7D%0A.ares.nav-dir-vertical.nav-pos-hor-left%20.tp-bullet.selected%3Ahover%20.tp-bullet-title%3Aafter%20%7B%0A%20%20border-color%3A%20%20transparent%20rgba%28255%2C%20255%2C%20255%2C%201%29%20transparent%20transparent%20%21important%3B%0A%7D%0A%0A%0A%0A%2F%2A%20HORIZONTAL%20BOTTOM%20%26%26%20CENTER%20%2A%2F%0A.ares.nav-dir-horizontal.nav-pos-ver-center%20.tp-bullet-title%2C%0A.ares.nav-dir-horizontal.nav-pos-ver-bottom%20.tp-bullet-title%20%7B%20top%3A-35px%3B%20left%3A50%25%3B%20right%3Aauto%3B%20transform%3A%20translateX%28-50%25%29%20translateY%28-10px%29%3B-webkit-transform%3A%20translateX%28-50%25%29%20translateY%28-10px%29%3B%20%7D%20%20%0A%0A.ares.nav-dir-horizontal.nav-pos-ver-center%20.tp-bullet-title%3Aafter%2C%0A.ares.nav-dir-horizontal.nav-pos-ver-bottom%20.tp-bullet-title%3Aafter%20%7B%20%0A%20%20border-width%3A%2010px%2010px%200px%2010px%3B%0A%20%20border-color%3A%20rgba%28255%2C%20255%2C%20255%2C%201%29%20transparent%20transparent%20transparent%3B%0A%20%20right%3Aauto%3B%0A%20%20left%3A50%25%3B%0A%20%20margin-left%3A-10px%3B%0A%20%20top%3Aauto%3B%0A%20%20bottom%3A-10px%3B%0A%20%20%20%20%0A%7D%0A.ares.nav-dir-horizontal.nav-pos-ver-center%20.tp-bullet.selected%3Ahover%20.tp-bullet-title%3Aafter%2C%0A.ares.nav-dir-horizontal.nav-pos-ver-bottom%20.tp-bullet.selected%3Ahover%20.tp-bullet-title%3Aafter%20%7B%0A%20%20border-color%3A%20%20rgba%28255%2C%20255%2C%20255%2C%201%29%20transparent%20transparent%20transparent%3B%0A%7D%0A%0A.ares.nav-dir-horizontal.nav-pos-ver-center%20.tp-bullet%3Ahover%20.tp-bullet-title%2C%0A.ares.nav-dir-horizontal.nav-pos-ver-bottom%20.tp-bullet%3Ahover%20.tp-bullet-title%7B%0A%20%20%20transform%3AtranslateX%28-50%25%29%20translatey%280px%29%3B%0A%20%20-webkit-transform%3AtranslateX%28-50%25%29%20translatey%280px%29%3B%0A%7D%0A%0A%0A%2F%2A%20HORIZONTAL%20TOP%20%2A%2F%0A.ares.nav-dir-horizontal.nav-pos-ver-top%20.tp-bullet-title%20%7B%20top%3A25px%3B%20left%3A50%25%3B%20right%3Aauto%3B%20transform%3A%20translateX%28-50%25%29%20translateY%2810px%29%3B-webkit-transform%3A%20translateX%28-50%25%29%20translateY%2810px%29%3B%20%7D%20%20%0A.ares.nav-dir-horizontal.nav-pos-ver-top%20.tp-bullet-title%3Aafter%20%7B%20%0A%20%20border-width%3A%200%2010px%2010px%2010px%3B%0A%20%20border-color%3A%20%20transparent%20transparent%20rgba%28255%2C%20255%2C%20255%2C%201%29%20transparent%3B%0A%20%20right%3Aauto%3B%0A%20%20left%3A50%25%3B%0A%20%20margin-left%3A-10px%3B%0A%20%20bottom%3Aauto%3B%0A%20%20top%3A-10px%3B%0A%20%20%20%20%0A%7D%0A.ares.nav-dir-horizontal.nav-pos-ver-top%20.tp-bullet.selected%3Ahover%20.tp-bullet-title%3Aafter%20%7B%0A%20%20border-color%3A%20%20transparent%20transparent%20%20rgba%28255%2C%20255%2C%20255%2C%201%29%20transparent%3B%0A%7D%0A%0A.ares.nav-dir-horizontal.nav-pos-ver-top%20.tp-bullet%3Ahover%20.tp-bullet-title%7B%0A%20%20%20transform%3AtranslateX%28-50%25%29%20translatey%280px%29%3B%0A%20%20-webkit-transform%3AtranslateX%28-50%25%29%20translatey%280px%29%3B%0A%7D%0A%0A%0A");
                                                                                                        var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                                                                                                        if (htmlDiv) {
                                                                                                            htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                                                                                                        } else {
                                                                                                            var htmlDiv = document.createElement('div');
                                                                                                            htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                                                                                                            document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                                                                                                        }
                                                                                                        if (typeof (gem_fix_fullwidth_position) == "function") {
                                                                    gem_fix_fullwidth_position(document.getElementById("fullwidth-block-581059f1ac352"));
                                                                }

                                                                 function revslider_showDoubleJqueryError(sliderID) {
                                        var errorMessage = "Revolution Slider Error: You have some jquery.js library include that comes after the revolution files js include.";
                                        errorMessage += "<br> This includes make eliminates the revolution slider libraries, and make it not work.";
                                        errorMessage += "<br><br> To fix it you can:<br>&nbsp;&nbsp;&nbsp; 1. In the Slider Settings -> Troubleshooting set option:  <strong><b>Put JS Includes To Body</b></strong> option to true.";
                                        errorMessage += "<br>&nbsp;&nbsp;&nbsp; 2. Find the double jquery.js include and remove it.";
                                        errorMessage = "<span style='font-size:16px;color:#BC0C06;'>" + errorMessage + "</span>";
                                        jQuery(sliderID).show().html(errorMessage);
                                    }

                                    function revslider_showDoubleJqueryError(sliderID) {
                var errorMessage = "Revolution Slider Error: You have some jquery.js library include that comes after the revolution files js include.";
                errorMessage += "<br> This includes make eliminates the revolution slider libraries, and make it not work.";
                errorMessage += "<br><br> To fix it you can:<br>&nbsp;&nbsp;&nbsp; 1. In the Slider Settings -> Troubleshooting set option:  <strong><b>Put JS Includes To Body</b></strong> option to true.";
                errorMessage += "<br>&nbsp;&nbsp;&nbsp; 2. Find the double jquery.js include and remove it.";
                errorMessage = "<span style='font-size:16px;color:#BC0C06;'>" + errorMessage + "</span>";
                jQuery(sliderID).show().html(errorMessage);
            }

            /* <![CDATA[ */
            var _wpcf7 = {"loaderUrl": "http:\/\/codex-themes.com\/thegem\/app-one-pager\/wp-content\/plugins\/contact-form-7\/images\/ajax-loader.gif", "recaptchaEmpty": "Please verify that you are not a robot.", "sending": "Sending ...", "cached": "1"};
            /* ]]> */

             /* <![CDATA[ */
            var object = {"ajax_url": "http:\/\/codex-themes.com\/thegem\/app-one-pager\/wp-admin\/admin-ajax.php", "page_data": {"ID": 2, "post_author": "1", "post_date": "2016-04-07 07:43:51", "post_date_gmt": "2016-04-07 07:43:51", "post_content": "[vc_row el_id=\"link\"][vc_column][gem_icon pack=\"elegant\" size=\"medium\" centered=\"1\" icon_elegant=\"e031\" color=\"#ffe670\"][gem_divider margin_top=\"14\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #707070;\">Core Features<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"-6\"][vc_separator color=\"custom\" el_width=\"10\" accent_color=\"#ececec\"][gem_divider margin_top=\"10\"][vc_column_text]\n<p style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit,\u00a0\u00a0sed do eiusmod tempor<\/p>\n[\/vc_column_text][gem_divider margin_top=\"84\"][\/vc_column][\/vc_row][vc_row][vc_column offset=\"vc_col-lg-6\"][gem_image position=\"centered\" disable_lightbox=\"1\" effects_enabled=\"1\" src=\"30\"][\/vc_column][vc_column offset=\"vc_col-lg-6\"][gem_divider margin_top=\"-40\"][gem_quickfinder style=\"classic\" columns=\"1\" alignment=\"left\" icon_position=\"top-float\" effects_enabled=\"1\" quickfinders=\"app-sparta-1\" hover_title_color=\"#707070\" hover_description_color=\"#707070\"][\/vc_column][\/vc_row][vc_row][vc_column][gem_divider margin_top=\"5\"][gem_icon pack=\"elegant\" size=\"medium\" centered=\"1\" icon_elegant=\"e106\" color=\"#ffe670\"][gem_divider margin_top=\"14\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #707070;\">Extra Features<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"-6\"][vc_separator color=\"custom\" el_width=\"10\" accent_color=\"#ececec\"][gem_divider margin_top=\"10\"][vc_column_text]\n<p style=\"text-align: center; max-width: 450px; margin: 0 auto;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.<\/p>\n[\/vc_column_text][gem_divider margin_top=\"85\"][\/vc_column][\/vc_row][vc_row][vc_column offset=\"vc_col-lg-6\"][gem_divider margin_top=\"-40\"][gem_quickfinder style=\"classic\" columns=\"1\" alignment=\"left\" icon_position=\"top-float\" effects_enabled=\"1\" quickfinders=\"app-sparta-2\" hover_title_color=\"#707070\" hover_description_color=\"#707070\"][\/vc_column][vc_column offset=\"vc_col-lg-6\"][gem_image position=\"centered\" disable_lightbox=\"1\" effects_enabled=\"1\" src=\"127\"][\/vc_column][\/vc_row][vc_row full_width=\"stretch_row\" css=\".vc_custom_1461140620903{margin-bottom: 0px !important;background-image: url(http:\/\/codex-themes.com\/thegem\/app-one-pager\/wp-content\/uploads\/2016\/04\/rectangle-8-copy-2.jpg?id=154) !important;background-position: center !important;background-repeat: no-repeat !important;background-size: cover !important;}\" el_id=\"link2\"][vc_column][gem_fullwidth background_style=\"cover\" container=\"1\" background_image=\"16363\" padding_top=\"100\" padding_bottom=\"100\"][gem_icon pack=\"elegant\" size=\"medium\" centered=\"1\" icon_elegant=\"e012\" color=\"#c883e2\"][gem_divider margin_top=\"25\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #929292;\">The App Is Available For<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"87\"][gem_divider margin_top=\"10\"][vc_row_inner][vc_column_inner width=\"1\/6\" css=\".vc_custom_1458986892566{padding-right: 0px !important;padding-left: 0px !important;}\"][gem_divider margin_top=\"20\"][gem_image position=\"centered\" disable_lightbox=\"1\" src=\"33\"][vc_column_text]\n<div class=\"title-h6\" style=\"text-align: center;\"><span style=\"color: #595959;\">tablet<\/span><\/div>\n[\/vc_column_text][vc_column_text]\n<p style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit.<\/p>\n[\/vc_column_text][\/vc_column_inner][vc_column_inner width=\"1\/6\" css=\".vc_custom_1458986701672{padding-right: 5px !important;padding-left: 0px !important;}\"][gem_divider style=\"4\" color=\"#73c2fa\" margin_top=\"70\"][\/vc_column_inner][vc_column_inner width=\"1\/3\"][gem_divider margin_top=\"17\"][gem_image position=\"centered\" disable_lightbox=\"1\" src=\"32\"][vc_column_text]\n<div class=\"title-h6\" style=\"text-align: center;\"><span style=\"color: #595959;\">pc<\/span><\/div>\n[\/vc_column_text][vc_column_text]\n<p style=\"text-align: center; max-width: 199px; margin: 0 auto;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit.<\/p>\n[\/vc_column_text][\/vc_column_inner][vc_column_inner width=\"1\/6\" css=\".vc_custom_1458986710103{padding-right: 0px !important;padding-left: 5px !important;}\"][gem_divider style=\"4\" color=\"#73c2fa\" margin_top=\"70\"][\/vc_column_inner][vc_column_inner width=\"1\/6\" css=\".vc_custom_1458986898590{padding-right: 0px !important;padding-left: 0px !important;}\"][gem_divider margin_top=\"30\"][gem_image position=\"centered\" disable_lightbox=\"1\" src=\"31\"][gem_divider margin_top=\"41\"][vc_column_text]\n<div class=\"title-h6\" style=\"text-align: center;\"><span style=\"color: #595959;\">smartphone<\/span><\/div>\n[\/vc_column_text][vc_column_text]\n<p style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit.<\/p>\n[\/vc_column_text][\/vc_column_inner][\/vc_row_inner][vc_row_inner][vc_column_inner][gem_divider margin_top=\"73\"][\/vc_column_inner][\/vc_row_inner][gem_image position=\"centered\" disable_lightbox=\"1\" src=\"34\"][\/gem_fullwidth][\/vc_column][\/vc_row][vc_row css=\".vc_custom_1460112609651{margin-bottom: 0px !important;}\" el_id=\"link3\"][vc_column css=\".vc_custom_1461140653831{margin-top: 0px !important;padding-top: 0px !important;}\"][gem_fullwidth background_style=\"cover\" container=\"1\" background_image=\"36\" padding_top=\"100\" padding_bottom=\"200\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #ffffff;\">TheGem Messenger Screenshots<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"150\"][vc_row_inner][vc_column_inner][vc_column_text][rev_slider alias=\"app-sparta-content-slider\"][\/vc_column_text][\/vc_column_inner][\/vc_row_inner][\/gem_fullwidth][\/vc_column][\/vc_row][vc_row css=\".vc_custom_1460112660377{margin-bottom: 0px !important;}\"][vc_column][gem_fullwidth background_style=\"cover\" container=\"1\" background_image=\"37\" padding_top=\"190\" padding_bottom=\"173\"][gem_counter_box columns=\"4\" effects_enabled=\"1\"][gem_counter icon_shape=\"circle\" icon_size=\"medium\" to=\"26\" text=\"Social Sharings\" background_color=\"rgba(24,24,40,0.26)\" numbers_color=\"#ffffff\" text_color=\"#ffffff\" from=\"0\" icon_color=\"#3c3950\" icon_background_color=\"#ffffff\" link=\"url:%23||\" hover_icon_color=\"#ffffff\" hover_background_color=\"#19cffd\" icon_elegant=\"e030\"][gem_counter icon_shape=\"circle\" icon_size=\"medium\" to=\"3120\" text=\"Lines of Code\" background_color=\"rgba(24,24,40,0.26)\" numbers_color=\"#ffffff\" text_color=\"#ffffff\" from=\"0\" icon_color=\"#3c3950\" icon_background_color=\"#ffffff\" link=\"url:%23||\" hover_icon_color=\"#ffffff\" hover_background_color=\"#19cffd\" icon_elegant=\"61\"][gem_counter icon_shape=\"circle\" icon_size=\"medium\" to=\"25667\" text=\"App Downloads\" numbers_color=\"#ffffff\" text_color=\"#ffffff\" from=\"0\" icon_color=\"#3c3950\" icon_background_color=\"#ffffff\" link=\"url:%23||\" hover_icon_color=\"#ffffff\" hover_background_color=\"#19cffd\" background_color=\"rgba(24,24,40,0.26)\" icon_elegant=\"e020\"][gem_counter icon_shape=\"circle\" icon_size=\"medium\" to=\"1566\" text=\"Positive Ratings\" background_color=\"rgba(24,24,40,0.26)\" numbers_color=\"#ffffff\" text_color=\"#ffffff\" from=\"0\" icon_color=\"#3c3950\" icon_background_color=\"#ffffff\" link=\"url:%23||\" hover_icon_color=\"#ffffff\" hover_background_color=\"#19cffd\" icon_elegant=\"e031\"][\/gem_counter_box][\/gem_fullwidth][\/vc_column][\/vc_row][vc_row full_width=\"stretch_row\" css=\".vc_custom_1460112646306{margin-bottom: 0px !important;background-color: #f3f3f3 !important;}\" el_id=\"link4\"][vc_column][gem_divider margin_top=\"80\"][gem_icon pack=\"elegant\" size=\"medium\" centered=\"1\" icon_elegant=\"e0e9\" color=\"#53d769\"][gem_divider margin_top=\"30\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #707070;\">Users About Messenger<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"-6\"][vc_separator color=\"custom\" el_width=\"10\" accent_color=\"#d1d1d1\"][gem_divider margin_top=\"10\"][gem_divider margin_top=\"20\"][\/vc_column][\/vc_row][vc_row full_width=\"stretch_row\" css=\".vc_custom_1459000406122{margin-bottom: 0px !important;background-color: #f3f3f3 !important;}\"][vc_column][gem_testimonials set=\"content\" image_size=\"size-medium\"][\/vc_column][\/vc_row][vc_row full_width=\"stretch_row\" css=\".vc_custom_1459000399877{margin-bottom: 0px !important;background-color: #f3f3f3 !important;}\"][vc_column css=\".vc_custom_1460026725540{padding-top: 0px !important;}\"][gem_divider margin_top=\"60\"][\/vc_column][\/vc_row][vc_row css=\".vc_custom_1460112700560{margin-bottom: 0px !important;}\" el_id=\"link6\"][vc_column css=\".vc_custom_1460107519350{padding-top: 0px !important;}\"][gem_fullwidth background_style=\"cover\" container=\"1\" background_image=\"39\" padding_top=\"80\" padding_bottom=\"74\"][gem_divider margin_top=\"40\"][gem_icon pack=\"elegant\" size=\"medium\" centered=\"1\" icon_elegant=\"e100\" color=\"#a3e7f0\"][gem_divider margin_top=\"20\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #ffffff;\">Pricing Plans<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"60\"][gem_pricing_table style=\"8\"][gem_pricing_column cols=\"4\"][gem_pricing_price price=\"$10\" time=\"Per Month\"][gem_pricing_row_title subtitle=\"\"]Starter[\/gem_pricing_row_title][gem_pricing_row]Photo sharing school[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Drop out ramen hustle<\/span>[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Crush revenue traction[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Crush revenue traction[\/gem_pricing_row][gem_pricing_row strike=\"1\"]User base minimum viable[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Lorem ipsum dolor[\/gem_pricing_row][gem_pricing_footer button_1_corner=\"10\" button_1_icon_pack=\"elegant\" button_1_text=\"order \" button_1_text_color=\"#ffffff\" button_1_hover_text_color=\"#ffffff\" button_1_background_color=\"#393d50\" button_1_hover_background_color=\"#10b6fe\" button_1_icon_elegant=\"45\"][\/gem_pricing_column][gem_pricing_column cols=\"4\" top_choice=\"new\" top_choice_background_color=\"#10b6fe\"][gem_pricing_price price=\"$45\" time=\"Per Month\"][gem_pricing_row_title subtitle=\"\"]Advanced[\/gem_pricing_row_title][gem_pricing_row]Photo sharing school[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Drop out ramen hustle<\/span>[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Crush revenue traction<\/span>[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Crush revenue traction[\/gem_pricing_row][gem_pricing_row strike=\"1\"]User base minimum viable[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Lorem ipsum dolor[\/gem_pricing_row][gem_pricing_footer button_1_corner=\"10\" button_1_icon_pack=\"elegant\" button_1_text=\"order \" button_1_text_color=\"#ffffff\" button_1_hover_text_color=\"#ffffff\" button_1_background_color=\"#393d50\" button_1_hover_background_color=\"#10b6fe\" button_1_icon_elegant=\"45\"][\/gem_pricing_column][gem_pricing_column highlighted=\"1\" cols=\"4\"][gem_pricing_price title=\" \" subtitle=\"Best price\/quantity plan *\" price=\"$99\" time=\"Per Month\"][gem_pricing_row_title subtitle=\"\"]Ultimate[\/gem_pricing_row_title][gem_pricing_row]Photo sharing school[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Drop out ramen hustle<\/span>[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Crush revenue traction<\/span>[\/gem_pricing_row][gem_pricing_row]Crush revenue traction[\/gem_pricing_row][gem_pricing_row strike=\"1\"]User base minimum viable[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Lorem ipsum dolor[\/gem_pricing_row][gem_pricing_footer button_1_style=\"outline\" button_1_corner=\"10\" button_1_border=\"2\" button_1_icon_pack=\"elegant\" button_1_text=\"order\" button_1_text_color=\"#10b6fe\" button_1_hover_text_color=\"#ffffff\" button_1_hover_background_color=\"#10b6fe\" button_1_border_color=\"#10b6fe\" button_1_icon_elegant=\"45\"][\/gem_pricing_column][gem_pricing_column cols=\"4\"][gem_pricing_price price=\"$145\" time=\"Per Month\"][gem_pricing_row_title subtitle=\"\"]Diamond[\/gem_pricing_row_title][gem_pricing_row]Photo sharing school[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Drop out ramen hustle<\/span>[\/gem_pricing_row][gem_pricing_row]<span style=\"color: #5f727f;\">Crush revenue traction<\/span>[\/gem_pricing_row][gem_pricing_row]Crush revenue traction[\/gem_pricing_row][gem_pricing_row]User base minimum viable[\/gem_pricing_row][gem_pricing_row strike=\"1\"]Lorem ipsum dolor[\/gem_pricing_row][gem_pricing_footer button_1_corner=\"10\" button_1_icon_pack=\"elegant\" button_1_text=\"order \" button_1_text_color=\"#ffffff\" button_1_hover_text_color=\"#ffffff\" button_1_background_color=\"#393d50\" button_1_hover_background_color=\"#10b6fe\" button_1_icon_elegant=\"45\"][\/gem_pricing_column][\/gem_pricing_table][\/gem_fullwidth][\/vc_column][\/vc_row][vc_row el_id=\"link6\"][vc_column][gem_fullwidth background_style=\"cover\" padding_top=\"222\" padding_bottom=\"215\" background_image=\"36\"][vc_column_text]\n<div class=\"title-h1\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #ffffff;\">TheGem Messenger Download<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"-7\"][vc_separator color=\"white\" el_width=\"10\"][gem_divider margin_top=\"10\"][vc_column_text]\n<p style=\"text-align: center;\"><span style=\"color: #ffffff;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<\/span><\/p>\n[\/vc_column_text][gem_divider margin_top=\"10\"][vc_row_inner el_class=\"custom-position\"][vc_column_inner el_class=\"custom-5\" css=\".vc_custom_1468326964910{margin-right: -40px !important;padding-right: 0px !important;padding-left: 0px !important;}\" offset=\"vc_col-lg-12\"][gem_button style=\"outline\" size=\"medium\" corner=\"15\" border=\"2\" icon_pack=\"material\" text=\"iOs\" icon_material=\"f12a\" text_color=\"#ffffff\" hover_background_color=\"#ffffff\" border_color=\"#ffffff\" hover_text_color=\"#079cfe\"][gem_button style=\"outline\" size=\"medium\" corner=\"15\" border=\"2\" icon_pack=\"material\" text=\"android\" text_color=\"#ffffff\" hover_background_color=\"#ffffff\" border_color=\"#ffffff\" hover_text_color=\"#079cfe\" icon_material=\"f127\"][gem_button style=\"outline\" size=\"medium\" corner=\"15\" border=\"2\" icon_pack=\"fontawesome\" text=\"windows\" text_color=\"#ffffff\" hover_background_color=\"#ffffff\" border_color=\"#ffffff\" hover_text_color=\"#079cfe\" icon_fontawesome=\"f17a\"][\/vc_column_inner][\/vc_row_inner][\/gem_fullwidth][\/vc_column][\/vc_row][vc_row el_id=\"link7\"][vc_column][gem_divider margin_top=\"76\"][gem_icon pack=\"elegant\" size=\"medium\" centered=\"1\" icon_elegant=\"62\" color=\"#10b6fe\"][gem_divider margin_top=\"14\"][vc_column_text]\n<div class=\"title-h2\" style=\"text-align: center;\"><span class=\"light\" style=\"color: #707070;\">Questions &amp; Answers<\/span><\/div>\n[\/vc_column_text][gem_divider margin_top=\"-6\"][vc_separator color=\"custom\" el_width=\"10\" accent_color=\"#ececec\"][gem_divider margin_top=\"10\"][vc_column_text]\n<p style=\"text-align: center; max-width: 450px; margin: 0 auto;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.<\/p>\n[\/vc_column_text][gem_divider margin_top=\"60\"][\/vc_column][\/vc_row][vc_row][vc_column][vc_tta_accordion style=\"flat\" shape=\"round\" spacing=\"20\" c_icon=\"solid_rounded\" active_section=\"1\"][vc_tta_section title=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit?\" tab_id=\"1458991291948-5fe085a6-3086\"][vc_column_text]Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt[\/vc_column_text][\/vc_tta_section][vc_tta_section title=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit?\" tab_id=\"1458991384856-7beb83ed-e395\"][vc_column_text]Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt[\/vc_column_text][\/vc_tta_section][vc_tta_section title=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit?\" tab_id=\"1458991388308-80a58f51-baa1\"][vc_column_text]Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt[\/vc_column_text][\/vc_tta_section][\/vc_tta_accordion][gem_divider margin_top=\"105\"][\/vc_column][\/vc_row][vc_row el_id=\"link7\" css=\".vc_custom_1461141556212{margin-bottom: -10px !important;}\"][vc_column][gem_fullwidth background_style=\"cover\" container=\"1\" background_image=\"43\" padding_top=\"158\" padding_bottom=\"100\"][vc_column_text]\n<h1 style=\"text-align: center;\"><span class=\"light\" style=\"color: #ffffff;\">Subscribe Now!<\/span><\/h1>\n[\/vc_column_text][gem_divider margin_top=\"71\"][vc_row_inner][vc_column_inner width=\"1\/6\"][\/vc_column_inner][vc_column_inner width=\"2\/3\"][vc_column_text][yikes-mailchimp form=\"1\"][\/vc_column_text][\/vc_column_inner][vc_column_inner width=\"1\/6\"][\/vc_column_inner][\/vc_row_inner][gem_divider margin_top=\"56\"][gem_socials colored=\"custom\" alignment=\"center\" icons_size=\"20\" socials=\"%5B%7B%22social%22%3A%22googleplus%22%2C%22url%22%3A%22%23%22%7D%2C%7B%22social%22%3A%22facebook%22%2C%22url%22%3A%22%23%22%7D%2C%7B%22social%22%3A%22twitter%22%2C%22url%22%3A%22%23%22%7D%2C%7B%22social%22%3A%22instagram%22%2C%22url%22%3A%22%23%22%7D%5D\" color=\"#ffffff\"][\/gem_fullwidth][\/vc_column][\/vc_row]", "post_title": "App One Pager", "post_excerpt": "", "post_status": "publish", "comment_status": "closed", "ping_status": "open", "post_name": "index", "to_ping": "", "pinged": "", "post_modified": "2016-07-12 13:04:21", "post_modified_gmt": "2016-07-12 13:04:21", "post_content_filtered": "", "post_parent": 0, "guid": "http:\/\/codex-themes.com\/thegem\/app-one-pager\/?page_id=2", "menu_order": 0, "post_type": "page", "post_mime_type": "", "comment_count": "0", "filter": "raw"}, "interest_group_checkbox_error": "This field is required.", "preloader_url": "http:\/\/codex-themes.com\/thegem\/app-one-pager\/wp-admin\/images\/wpspin_light.gif"};


            /* ]]> */

                        /* <![CDATA[ */
            var mc4wp_forms_config = [];
            /* ]]> */

            (function () {
                function addEventListener(element, event, handler) {
                    if (element.addEventListener) {
                        element.addEventListener(event, handler, false);
                    } else if (element.attachEvent) {
                        element.attachEvent('on' + event, handler);
                    }
                }})();