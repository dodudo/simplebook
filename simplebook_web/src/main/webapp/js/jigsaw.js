/*!
 * version: 1.0.2
 * docs: https://github.com/yeild/jigsaw
 *
 */
!
    function(n) {
        var e = {};

        function t(r) {
            if (e[r]) return e[r].exports;
            var i = e[r] = {
                i: r,
                l: !1,
                exports: {}
            };
            return n[r].call(i.exports, i, i.exports, t), i.l = !0, i.exports
        }
        t.m = n, t.c = e, t.d = function(n, e, r) {
            t.o(n, e) || Object.defineProperty(n, e, {
                enumerable: !0,
                get: r
            })
        }, t.r = function(n) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(n, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(n, "__esModule", {
                value: !0
            })
        }, t.t = function(n, e) {
            if (1 & e && (n = t(n)), 8 & e) return n;
            if (4 & e && "object" == typeof n && n && n.__esModule) return n;
            var r = Object.create(null);
            if (t.r(r), Object.defineProperty(r, "default", {
                enumerable: !0,
                value: n
            }), 2 & e && "string" != typeof n) for (var i in n) t.d(r, i, function(e) {
                return n[e]
            }.bind(null, i));
            return r
        }, t.n = function(n) {
            var e = n && n.__esModule ?
                function() {
                    return n.
                        default
                } : function() {
                    return n
                };
            return t.d(e, "a", e), e
        }, t.o = function(n, e) {
            return Object.prototype.hasOwnProperty.call(n, e)
        }, t.p = "", t(t.s = 0)
    }([function(n, e, t) {
        "use strict";
        var r = Object.assign ||
            function(n) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = arguments[e];
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (n[r] = t[r])
                }
                return n
            }, i = function() {
            function n(n, e) {
                for (var t = 0; t < e.length; t++) {
                    var r = e[t];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(n, r.key, r)
                }
            }
            return function(e, t, r) {
                return t && n(e.prototype, t), r && n(e, r), e
            }
        }();
        t(1);
        var o = 42,
            s = 9,
            a = 310,
            c = 155,
            l = Math.PI,
            u = o + 2 * s + 3,
            d = window.navigator.userAgent.indexOf("Trident") > -1;

        function f(n, e) {
            return Math.round(Math.random() * (e - n) + n)
        }
        function p(n, e) {
            var t = document.createElement(n);
            return t.className = e, t
        }
        function h(n, e) {
            n.classList.add(e)
        }
        function v() {
            return "https://picsum.photos/300/150/?image=" + f(0, 1084)
        }
        function b(n, e, t, r) {
            n.beginPath(), n.moveTo(e, t), n.arc(e + o / 2, t - s + 2, s, .72 * l, 2.26 * l), n.lineTo(e + o, t), n.arc(e + o + s - 2, t + o / 2, s, 1.21 * l, 2.78 * l), n.lineTo(e + o, t + o), n.lineTo(e, t + o), n.arc(e + s - 2, t + o / 2, s + .4, 2.76 * l, 1.24 * l, !0), n.lineTo(e, t), n.lineWidth = 2, n.fillStyle = "rgba(255, 255, 255, 0.7)", n.strokeStyle = "rgba(255, 255, 255, 0.7)", n.stroke(), n[r](), n.globalCompositeOperation = "destination-over"
        }
        function g(n, e) {
            return n + e
        }
        function m(n) {
            return n * n
        }
        var x = function() {
            function n(e) {
                var t = e.el,
                    i = e.onSuccess,
                    o = e.onFail,
                    s = e.onRefresh;
                !
                    function(n, e) {
                        if (!(n instanceof e)) throw new TypeError("Cannot call a class as a function")
                    }(this, n), t.style.position = "relative", t.style.width = a + "px", r(t.style, {
                    position: "relative",
                    width: a + "px",
                    margin: "0 auto"
                }), this.el = t, this.onSuccess = i, this.onFail = o, this.onRefresh = s
            }
            return i(n, [{
                key: "init",
                value: function() {
                    this.initDOM(), this.initImg(), this.bindEvents()
                }
            }, {
                key: "initDOM",
                value: function() {
                    var n = function(n, e) {
                            var t = document.createElement("canvas");
                            return t.width = n, t.height = e, t
                        }(a, c),
                        e = n.cloneNode(!0),
                        t = p("div", "sliderContainer"),
                        i = p("div", "refreshIcon"),
                        o = p("div", "sliderMask"),
                        s = p("div", "slider"),
                        l = p("span", "sliderIcon"),
                        u = p("span", "sliderText");
                    e.className = "block", u.innerHTML = "向右滑动填充拼图";
                    var d = this.el;
                    d.appendChild(n), d.appendChild(i), d.appendChild(e), s.appendChild(l), o.appendChild(s), t.appendChild(o), t.appendChild(u), d.appendChild(t), r(this, {
                        canvas: n,
                        block: e,
                        sliderContainer: t,
                        refreshIcon: i,
                        slider: s,
                        sliderMask: o,
                        sliderIcon: l,
                        text: u,
                        canvasCtx: n.getContext("2d"),
                        blockCtx: e.getContext("2d")
                    })
                }
            }, {
                key: "initImg",
                value: function() {
                    var n = this,
                        e = function(n) {
                            var e = new Image;
                            return e.crossOrigin = "Anonymous", e.onload = n, e.onerror = function() {
                                e.setSrc(v())
                            }, e.setSrc = function(n) {
                                if (d) {
                                    var t = new XMLHttpRequest;
                                    t.onloadend = function(n) {
                                        var t = new FileReader;
                                        t.readAsDataURL(n.target.response), t.onloadend = function(n) {
                                            e.src = n.target.result
                                        }
                                    }, t.open("GET", n), t.responseType = "blob", t.send()
                                } else e.src = n
                            }, e.setSrc(v()), e
                        }(function() {
                            n.draw(), n.canvasCtx.drawImage(e, 0, 0, a, c), n.blockCtx.drawImage(e, 0, 0, a, c);
                            var t = n.y - 2 * s - 1,
                                r = n.blockCtx.getImageData(n.x - 3, t, u, u);
                            n.block.width = u, n.blockCtx.putImageData(r, 0, t)
                        });
                    this.img = e
                }
            }, {
                key: "draw",
                value: function() {
                    this.x = f(u + 10, a - (u + 10)), this.y = f(10 + 2 * s, c - (u + 10)), b(this.canvasCtx, this.x, this.y, "fill"), b(this.blockCtx, this.x, this.y, "clip")
                }
            }, {
                key: "clean",
                value: function() {
                    this.canvasCtx.clearRect(0, 0, a, c), this.blockCtx.clearRect(0, 0, a, c), this.block.width = a
                }
            }, {
                key: "bindEvents",
                value: function() {
                    var n = this;
                    this.el.onselectstart = function() {
                        return !1
                    }, this.refreshIcon.onclick = function() {
                        n.reset(), "function" == typeof n.onRefresh && n.onRefresh()
                    };
                    var e = void 0,
                        t = void 0,
                        r = [],
                        i = !1,
                        o = function(n) {
                            e = n.clientX || n.touches[0].clientX, t = n.clientY || n.touches[0].clientY, i = !0
                        },
                        s = function(o) {
                            if (!i) return !1;
                            var s = o.clientX || o.touches[0].clientX,
                                c = o.clientY || o.touches[0].clientY,
                                l = s - e,
                                u = c - t;
                            if (l < 0 || l + 38 >= a) return !1;
                            n.slider.style.left = l + "px";
                            var d = (a - 40 - 20) / (a - 40) * l;
                            n.block.style.left = d + "px", h(n.sliderContainer, "sliderContainer_active"), n.sliderMask.style.width = l + "px", r.push(u)
                        },
                        c = function(t) {
                            if (!i) return !1;
                            if (i = !1, (t.clientX || t.changedTouches[0].clientX) == e) return !1;
                            !
                                function(n, e) {
                                    n.classList.remove(e)
                                }(n.sliderContainer, "sliderContainer_active"), n.trail = r;
                            var o = n.verify(),
                                s = o.spliced,
                                a = o.verified;
                            s ? a ? (h(n.sliderContainer, "sliderContainer_success"), "function" == typeof n.onSuccess && n.onSuccess()) : (h(n.sliderContainer, "sliderContainer_fail"), n.text.innerHTML = "再试一次", n.reset()) : (h(n.sliderContainer, "sliderContainer_fail"), "function" == typeof n.onFail && n.onFail(), setTimeout(function() {
                                n.reset()
                            }, 1e3))
                        };
                    this.slider.addEventListener("mousedown", o), this.slider.addEventListener("touchstart", o), this.block.addEventListener("mousedown", o), this.block.addEventListener("touchstart", o), document.addEventListener("mousemove", s), document.addEventListener("touchmove", s), document.addEventListener("mouseup", c), document.addEventListener("touchend", c)
                }
            }, {
                key: "verify",
                value: function() {
                    var n = this.trail,
                        e = n.reduce(g) / n.length,
                        t = n.map(function(n) {
                            return n - e
                        }),
                        r = Math.sqrt(t.map(m).reduce(g) / n.length),
                        i = parseInt(this.block.style.left);
                    return {
                        spliced: Math.abs(i - this.x) < 10,
                        verified: 0 !== r
                    }
                }
            }, {
                key: "reset",
                value: function() {
                    this.sliderContainer.className = "sliderContainer", this.slider.style.left = 0, this.block.style.left = 0, this.sliderMask.style.width = 0, this.clean(), this.img.setSrc(v())
                }
            }]), n
        }();
        window.jigsaw = {
            init: function(n) {
                return new x(n).init()
            }
        }
    }, function(n, e, t) {
        var r = t(2);
        "string" == typeof r && (r = [
            [n.i, r, ""]
        ]);
        var i = {
            hmr: !0,
            transform: void 0,
            insertInto: void 0
        };
        t(4)(r, i);
        r.locals && (n.exports = r.locals)
    }, function(n, e, t) {
        (n.exports = t(3)(!1)).push([n.i, ".block {\r\n  position: absolute;\r\n  left: 0;\r\n  top: 0;\r\n  cursor: pointer;\r\n  cursor: grab;\r\n}\r\n\r\n.block:active {\r\n  cursor: pointer;\r\n  cursor: grabbing;\r\n}\r\n\r\n.sliderContainer {\r\n  position: relative;\r\n  text-align: center;\r\n  width: 310px;\r\n  height: 40px;\r\n  line-height: 40px;\r\n  margin-top: 15px;\r\n  background: #f7f9fa;\r\n  color: #45494c;\r\n  border: 1px solid #e4e7eb;\r\n}\r\n\r\n.sliderContainer_active .slider {\r\n  height: 38px;\r\n  top: -1px;\r\n  border: 1px solid #1991FA;\r\n}\r\n\r\n.sliderContainer_active .sliderMask {\r\n  height: 38px;\r\n  border-width: 1px;\r\n}\r\n\r\n.sliderContainer_success .slider {\r\n  height: 38px;\r\n  top: -1px;\r\n  border: 1px solid #52CCBA;\r\n  background-color: #52CCBA !important;\r\n}\r\n\r\n.sliderContainer_success .sliderMask {\r\n  height: 38px;\r\n  border: 1px solid #52CCBA;\r\n  background-color: #D2F4EF;\r\n}\r\n\r\n.sliderContainer_success .sliderIcon {\r\n  background-position: 0 0 !important;\r\n}\r\n\r\n.sliderContainer_fail .slider {\r\n  height: 38px;\r\n  top: -1px;\r\n  border: 1px solid #f57a7a;\r\n  background-color: #f57a7a !important;\r\n}\r\n\r\n.sliderContainer_fail .sliderMask {\r\n  height: 38px;\r\n  border: 1px solid #f57a7a;\r\n  background-color: #fce1e1;\r\n}\r\n\r\n.sliderContainer_fail .sliderIcon {\r\n  top: 14px;\r\n  background-position: 0 -82px !important;\r\n}\r\n.sliderContainer_active .sliderText, .sliderContainer_success .sliderText, .sliderContainer_fail .sliderText {\r\n  display: none;\r\n}\r\n\r\n.sliderMask {\r\n  position: absolute;\r\n  left: 0;\r\n  top: 0;\r\n  height: 40px;\r\n  border: 0 solid #1991FA;\r\n  background: #D1E9FE;\r\n}\r\n\r\n.slider {\r\n  position: absolute;\r\n  top: 0;\r\n  left: 0;\r\n  width: 40px;\r\n  height: 40px;\r\n  background: #fff;\r\n  box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);\r\n  transition: background .2s linear;\r\n  cursor: pointer;\r\n  cursor: grab;\r\n}\r\n\r\n.slider:active {\r\n  cursor: grabbing;\r\n}\r\n\r\n.slider:hover {\r\n  background: #1991FA;\r\n}\r\n\r\n.slider:hover .sliderIcon {\r\n  background-position: 0 -13px;\r\n}\r\n\r\n.sliderIcon {\r\n  position: absolute;\r\n  top: 15px;\r\n  left: 13px;\r\n  width: 14px;\r\n  height: 12px;\r\n  background: url(http://cstaticdun.126.net//2.6.3/images/icon_light.f13cff3.png) 0 -26px;\r\n  background-size: 34px 471px;\r\n}\r\n\r\n.refreshIcon {\r\n  position: absolute;\r\n  right: 0;\r\n  top: 0;\r\n  width: 34px;\r\n  height: 34px;\r\n  cursor: pointer;\r\n  background: url(http://cstaticdun.126.net//2.6.3/images/icon_light.f13cff3.png) 0 -437px;\r\n  background-size: 34px 471px;\r\n}\r\n", ""])
    }, function(n, e) {
        n.exports = function(n) {
            var e = [];
            return e.toString = function() {
                return this.map(function(e) {
                    var t = function(n, e) {
                        var t = n[1] || "",
                            r = n[3];
                        if (!r) return t;
                        if (e && "function" == typeof btoa) {
                            var i = function(n) {
                                    return "/*# sourceMappingURL=data:application/json;charset=utf-8;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(n)))) + " */"
                                }(r),
                                o = r.sources.map(function(n) {
                                    return "/*# sourceURL=" + r.sourceRoot + n + " */"
                                });
                            return [t].concat(o).concat([i]).join("\n")
                        }
                        return [t].join("\n")
                    }(e, n);
                    return e[2] ? "@media " + e[2] + "{" + t + "}" : t
                }).join("")
            }, e.i = function(n, t) {
                "string" == typeof n && (n = [
                    [null, n, ""]
                ]);
                for (var r = {}, i = 0; i < this.length; i++) {
                    var o = this[i][0];
                    "number" == typeof o && (r[o] = !0)
                }
                for (i = 0; i < n.length; i++) {
                    var s = n[i];
                    "number" == typeof s[0] && r[s[0]] || (t && !s[2] ? s[2] = t : t && (s[2] = "(" + s[2] + ") and (" + t + ")"), e.push(s))
                }
            }, e
        }
    }, function(n, e, t) {
        var r = {},
            i = function(n) {
                var e;
                return function() {
                    return void 0 === e && (e = n.apply(this, arguments)), e
                }
            }(function() {
                return window && document && document.all && !window.atob
            }),
            o = function(n) {
                var e = {};
                return function(n) {
                    if ("function" == typeof n) return n();
                    if (void 0 === e[n]) {
                        var t = function(n) {
                            return document.querySelector(n)
                        }.call(this, n);
                        if (window.HTMLIFrameElement && t instanceof window.HTMLIFrameElement) try {
                            t = t.contentDocument.head
                        } catch (n) {
                            t = null
                        }
                        e[n] = t
                    }
                    return e[n]
                }
            }(),
            s = null,
            a = 0,
            c = [],
            l = t(5);

        function u(n, e) {
            for (var t = 0; t < n.length; t++) {
                var i = n[t],
                    o = r[i.id];
                if (o) {
                    o.refs++;
                    for (var s = 0; s < o.parts.length; s++) o.parts[s](i.parts[s]);
                    for (; s < i.parts.length; s++) o.parts.push(b(i.parts[s], e))
                } else {
                    var a = [];
                    for (s = 0; s < i.parts.length; s++) a.push(b(i.parts[s], e));
                    r[i.id] = {
                        id: i.id,
                        refs: 1,
                        parts: a
                    }
                }
            }
        }
        function d(n, e) {
            for (var t = [], r = {}, i = 0; i < n.length; i++) {
                var o = n[i],
                    s = e.base ? o[0] + e.base : o[0],
                    a = {
                        css: o[1],
                        media: o[2],
                        sourceMap: o[3]
                    };
                r[s] ? r[s].parts.push(a) : t.push(r[s] = {
                    id: s,
                    parts: [a]
                })
            }
            return t
        }
        function f(n, e) {
            var t = o(n.insertInto);
            if (!t) throw new Error("Couldn't find a style target. This probably means that the value for the 'insertInto' parameter is invalid.");
            var r = c[c.length - 1];
            if ("top" === n.insertAt) r ? r.nextSibling ? t.insertBefore(e, r.nextSibling) : t.appendChild(e) : t.insertBefore(e, t.firstChild), c.push(e);
            else if ("bottom" === n.insertAt) t.appendChild(e);
            else {
                if ("object" != typeof n.insertAt || !n.insertAt.before) throw new Error("[Style Loader]\n\n Invalid value for parameter 'insertAt' ('options.insertAt') found.\n Must be 'top', 'bottom', or Object.\n (https://github.com/webpack-contrib/style-loader#insertat)\n");
                var i = o(n.insertInto + " " + n.insertAt.before);
                t.insertBefore(e, i)
            }
        }
        function p(n) {
            if (null === n.parentNode) return !1;
            n.parentNode.removeChild(n);
            var e = c.indexOf(n);
            e >= 0 && c.splice(e, 1)
        }
        function h(n) {
            var e = document.createElement("style");
            return n.attrs.type = "text/css", v(e, n.attrs), f(n, e), e
        }
        function v(n, e) {
            Object.keys(e).forEach(function(t) {
                n.setAttribute(t, e[t])
            })
        }
        function b(n, e) {
            var t, r, i, o;
            if (e.transform && n.css) {
                if (!(o = e.transform(n.css))) return function() {};
                n.css = o
            }
            if (e.singleton) {
                var c = a++;
                t = s || (s = h(e)), r = m.bind(null, t, c, !1), i = m.bind(null, t, c, !0)
            } else n.sourceMap && "function" == typeof URL && "function" == typeof URL.createObjectURL && "function" == typeof URL.revokeObjectURL && "function" == typeof Blob && "function" == typeof btoa ? (t = function(n) {
                var e = document.createElement("link");
                return n.attrs.type = "text/css", n.attrs.rel = "stylesheet", v(e, n.attrs), f(n, e), e
            }(e), r = function(n, e, t) {
                var r = t.css,
                    i = t.sourceMap,
                    o = void 0 === e.convertToAbsoluteUrls && i;
                (e.convertToAbsoluteUrls || o) && (r = l(r));
                i && (r += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(i)))) + " */");
                var s = new Blob([r], {
                        type: "text/css"
                    }),
                    a = n.href;
                n.href = URL.createObjectURL(s), a && URL.revokeObjectURL(a)
            }.bind(null, t, e), i = function() {
                p(t), t.href && URL.revokeObjectURL(t.href)
            }) : (t = h(e), r = function(n, e) {
                var t = e.css,
                    r = e.media;
                r && n.setAttribute("media", r);
                if (n.styleSheet) n.styleSheet.cssText = t;
                else {
                    for (; n.firstChild;) n.removeChild(n.firstChild);
                    n.appendChild(document.createTextNode(t))
                }
            }.bind(null, t), i = function() {
                p(t)
            });
            return r(n), function(e) {
                if (e) {
                    if (e.css === n.css && e.media === n.media && e.sourceMap === n.sourceMap) return;
                    r(n = e)
                } else i()
            }
        }
        n.exports = function(n, e) {
            if ("undefined" != typeof DEBUG && DEBUG && "object" != typeof document) throw new Error("The style-loader cannot be used in a non-browser environment");
            (e = e || {}).attrs = "object" == typeof e.attrs ? e.attrs : {}, e.singleton || "boolean" == typeof e.singleton || (e.singleton = i()), e.insertInto || (e.insertInto = "head"), e.insertAt || (e.insertAt = "bottom");
            var t = d(n, e);
            return u(t, e), function(n) {
                for (var i = [], o = 0; o < t.length; o++) {
                    var s = t[o];
                    (a = r[s.id]).refs--, i.push(a)
                }
                n && u(d(n, e), e);
                for (o = 0; o < i.length; o++) {
                    var a;
                    if (0 === (a = i[o]).refs) {
                        for (var c = 0; c < a.parts.length; c++) a.parts[c]();
                        delete r[a.id]
                    }
                }
            }
        };
        var g = function() {
            var n = [];
            return function(e, t) {
                return n[e] = t, n.filter(Boolean).join("\n")
            }
        }();

        function m(n, e, t, r) {
            var i = t ? "" : r.css;
            if (n.styleSheet) n.styleSheet.cssText = g(e, i);
            else {
                var o = document.createTextNode(i),
                    s = n.childNodes;
                s[e] && n.removeChild(s[e]), s.length ? n.insertBefore(o, s[e]) : n.appendChild(o)
            }
        }
    }, function(n, e) {
        n.exports = function(n) {
            var e = "undefined" != typeof window && window.location;
            if (!e) throw new Error("fixUrls requires window.location");
            if (!n || "string" != typeof n) return n;
            var t = e.protocol + "//" + e.host,
                r = t + e.pathname.replace(/\/[^\/]*$/, "/");
            return n.replace(/url\s*\(((?:[^)(]|\((?:[^)(]+|\([^)(]*\))*\))*)\)/gi, function(n, e) {
                var i, o = e.trim().replace(/^"(.*)"$/, function(n, e) {
                    return e
                }).replace(/^'(.*)'$/, function(n, e) {
                    return e
                });
                return /^(#|data:|http:\/\/|https:\/\/|file:\/\/\/|\s*$)/i.test(o) ? n : (i = 0 === o.indexOf("//") ? o : 0 === o.indexOf("/") ? t + o : r + o.replace(/^\.\//, ""), "url(" + JSON.stringify(i) + ")")
            })
        }
    }]);