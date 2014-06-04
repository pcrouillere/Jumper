<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>
<%
	List<Url> urls = (List<Url>) request.getAttribute("untaggedurls");
%>
<!--Les section, c'est la partie coeur, c'est la ou on doit developper les differentes fonctionnalitées -->

<section>
<script type="text/javascript">
! function (a, b) {
    function c(b) {
        return a.less[b.split("/")[1]]
    }

    function d(a, b) {
        "development" == v.env && "undefined" != typeof console && v.logLevel >= b && console.log("less: " + a)
    }

    function e(a) {
        return a.replace(/^[a-z-]+:\/+?[^\/]+/, "").replace(/^\//, "").replace(/\.[a-zA-Z]+$/, "").replace(/[^\.\w-]+/g, "-").replace(/\./g, ":")
    }

    function f(a, c) {
        var e = "{line} {content}",
            f = a.filename || c,
            g = [],
            h = (a.type || "Syntax") + "Error: " + (a.message || "There is an error in your .less file") + " in " + f + " ",
            i = function (a, c, d) {
                a.extract[c] !== b && g.push(e.replace(/\{line\}/, (parseInt(a.line, 10) || 0) + (c - 1)).replace(/\{class\}/, d).replace(/\{content\}/, a.extract[c]))
            };
        a.extract ? (i(a, 0, ""), i(a, 1, "line"), i(a, 2, ""), h += "on line " + a.line + ", column " + (a.column + 1) + ":\n" + g.join("\n")) : a.stack && (h += a.stack), d(h, y.errors)
    }

    function g(a, b, c) {
        var f = b.href || "",
            g = "less:" + (b.title || e(f)),
            h = document.getElementById(g),
            i = !1,
            j = document.createElement("style");
        if (j.setAttribute("type", "text/css"), b.media && j.setAttribute("media", b.media), j.id = g, j.styleSheet) try {
            j.styleSheet.cssText = a
        } catch (k) {
            throw new Error("Couldn't reassign styleSheet.cssText.")
        } else j.appendChild(document.createTextNode(a)), i = null !== h && h.childNodes.length > 0 && j.childNodes.length > 0 && h.firstChild.nodeValue === j.firstChild.nodeValue;
        var l = document.getElementsByTagName("head")[0];
        if (null === h || i === !1) {
            var m = b && b.nextSibling || null;
            m ? m.parentNode.insertBefore(j, m) : l.appendChild(j)
        }
        if (h && i === !1 && h.parentNode.removeChild(h), c && C) {
            d("saving " + f + " to cache.", y.info);
            try {
                C.setItem(f, a), C.setItem(f + ":timestamp", c)
            } catch (k) {
                d("failed to save", y.errors)
            }
        }
    }

    function h(a, c) {
        var d, f, h = "less-error-message:" + e(c || ""),
            i = '<li><label>{line}</label><pre class="{class}">{content}</pre></li>',
            j = document.createElement("div"),
            k = [],
            l = a.filename || c,
            m = l.match(/([^\/]+(\?.*)?)$/)[1];
        j.id = h, j.className = "less-error-message", f = "<h3>" + (a.type || "Syntax") + "Error: " + (a.message || "There is an error in your .less file") + '</h3><p>in <a href="' + l + '">' + m + "</a> ";
        var n = function (a, c, d) {
            a.extract[c] !== b && k.push(i.replace(/\{line\}/, (parseInt(a.line, 10) || 0) + (c - 1)).replace(/\{class\}/, d).replace(/\{content\}/, a.extract[c]))
        };
        a.extract ? (n(a, 0, ""), n(a, 1, "line"), n(a, 2, ""), f += "on line " + a.line + ", column " + (a.column + 1) + ":</p><ul>" + k.join("") + "</ul>") : a.stack && (f += "<br/>" + a.stack.split("\n").slice(1).join("<br/>")), j.innerHTML = f, g([".less-error-message ul, .less-error-message li {", "list-style-type: none;", "margin-right: 15px;", "padding: 4px 0;", "margin: 0;", "}", ".less-error-message label {", "font-size: 12px;", "margin-right: 15px;", "padding: 4px 0;", "color: #cc7777;", "}", ".less-error-message pre {", "color: #dd6666;", "padding: 4px 0;", "margin: 0;", "display: inline-block;", "}", ".less-error-message pre.line {", "color: #ff0000;", "}", ".less-error-message h3 {", "font-size: 20px;", "font-weight: bold;", "padding: 15px 0 5px 0;", "margin: 0;", "}", ".less-error-message a {", "color: #10a", "}", ".less-error-message .error {", "color: red;", "font-weight: bold;", "padding-bottom: 2px;", "border-bottom: 1px dashed red;", "}"].join("\n"), {
            title: "error-message"
        }), j.style.cssText = ["font-family: Arial, sans-serif", "border: 1px solid #e00", "background-color: #eee", "border-radius: 5px", "-webkit-border-radius: 5px", "-moz-border-radius: 5px", "color: #e00", "padding: 15px", "margin-bottom: 15px"].join(";"), "development" == v.env && (d = setInterval(function () {
            document.body && (document.getElementById(h) ? document.body.replaceChild(j, document.getElementById(h)) : document.body.insertBefore(j, document.body.firstChild), clearInterval(d))
        }, 10))
    }

    function i(a, b) {
        v.errorReporting && "html" !== v.errorReporting ? "console" === v.errorReporting ? f(a, b) : "function" == typeof v.errorReporting && v.errorReporting("add", a, b) : h(a, b)
    }

    function j(a) {
        var b = document.getElementById("less-error-message:" + e(a));
        b && b.parentNode.removeChild(b)
    }

    function k() {}

    function l(a) {
        v.errorReporting && "html" !== v.errorReporting ? "console" === v.errorReporting ? k(a) : "function" == typeof v.errorReporting && v.errorReporting("remove", a) : j(a)
    }

    function m(a) {
        for (var b, c = document.getElementsByTagName("style"), d = 0; d < c.length; d++)
            if (b = c[d], b.type.match(B)) {
                var e = new v.tree.parseEnv(v),
                    f = b.innerHTML || "";
                e.filename = document.location.href.replace(/#.*$/, ""), (a || v.globalVars) && (e.useFileCache = !0);
                var g = function (a) {
                    return function (b, c) {
                        if (b) return i(b, "inline");
                        var d = c.toCSS(v);
                        a.type = "text/css", a.styleSheet ? a.styleSheet.cssText = d : a.innerHTML = d
                    }
                }(b);
                new v.Parser(e).parse(f, g, {
                    globalVars: v.globalVars,
                    modifyVars: a
                })
            }
    }

    function n(a, b) {
        var c, d, e = /^((?:[a-z-]+:)?\/+?(?:[^\/\?#]*\/)|([\/\\]))?((?:[^\/\\\?#]*[\/\\])*)([^\/\\\?#]*)([#\?].*)?$/i,
            f = a.match(e),
            g = {},
            h = [];
        if (!f) throw new Error("Could not parse sheet href - '" + a + "'");
        if (!f[1] || f[2]) {
            if (d = b.match(e), !d) throw new Error("Could not parse page url - '" + b + "'");
            f[1] = f[1] || d[1] || "", f[2] || (f[3] = d[3] + f[3])
        }
        if (f[3]) {
            for (h = f[3].replace(/\\/g, "/").split("/"), c = 0; c < h.length; c++) "." === h[c] && (h.splice(c, 1), c -= 1);
            for (c = 0; c < h.length; c++) ".." === h[c] && c > 0 && (h.splice(c - 1, 2), c -= 2)
        }
        return g.hostPart = f[1], g.directories = h, g.path = f[1] + h.join("/"), g.fileUrl = g.path + (f[4] || ""), g.url = g.fileUrl + (f[5] || ""), g
    }

    function o(a, b) {
        var c, d, e, f, g = n(a),
            h = n(b),
            i = "";
        if (g.hostPart !== h.hostPart) return "";
        for (d = Math.max(h.directories.length, g.directories.length), c = 0; d > c && h.directories[c] === g.directories[c]; c++);
        for (f = h.directories.slice(c), e = g.directories.slice(c), c = 0; c < f.length - 1; c++) i += "../";
        for (c = 0; c < e.length - 1; c++) i += e[c] + "/";
        return i
    }

    function p() {
        if (a.XMLHttpRequest) return new XMLHttpRequest;
        try {
            return new ActiveXObject("MSXML2.XMLHTTP.3.0")
        } catch (b) {
            return d("browser doesn't support AJAX.", y.errors), null
        }
    }

    function q(a, b, c, e) {
        function f(b, c, d) {
            b.status >= 200 && b.status < 300 ? c(b.responseText, b.getResponseHeader("Last-Modified")) : "function" == typeof d && d(b.status, a)
        }
        var g = p(),
            h = x ? v.fileAsync : v.async;
        "function" == typeof g.overrideMimeType && g.overrideMimeType("text/css"), d("XHR: Getting '" + a + "'", y.info), g.open("GET", a, h), g.setRequestHeader("Accept", b || "text/x-less, text/css; q=0.9, */*; q=0.5"), g.send(null), x && !v.fileAsync ? 0 === g.status || g.status >= 200 && g.status < 300 ? c(g.responseText) : e(g.status, a) : h ? g.onreadystatechange = function () {
            4 == g.readyState && f(g, c, e)
        } : f(g, c, e)
    }

    function r(b, c, d, e) {
        c && c.currentDirectory && !/^([a-z-]+:)?\//.test(b) && (b = c.currentDirectory + b);
        var f = n(b, a.location.href),
            g = f.url,
            h = {
                currentDirectory: f.path,
                filename: g
            };
        if (c ? (h.entryPath = c.entryPath, h.rootpath = c.rootpath, h.rootFilename = c.rootFilename, h.relativeUrls = c.relativeUrls) : (h.entryPath = f.path, h.rootpath = v.rootpath || f.path, h.rootFilename = g, h.relativeUrls = e.relativeUrls), h.relativeUrls && (h.rootpath = e.rootpath ? n(e.rootpath + o(f.path, h.entryPath)).path : f.path), e.useFileCache && D[g]) try {
            var i = D[g];
            d(null, i, g, h, {
                lastModified: new Date
            })
        } catch (j) {
            d(j, null, g)
        } else q(g, e.mime, function (a, b) {
            D[g] = a;
            try {
                d(null, a, g, h, {
                    lastModified: b
                })
            } catch (c) {
                d(c, null, g)
            }
        }, function (a, b) {
            d({
                type: "File",
                message: "'" + b + "' wasn't found (" + a + ")"
            }, null, g)
        })
    }

    function s(a, b, c, d, e) {
        var f = new v.tree.parseEnv(v);
        f.mime = a.type, (e || v.globalVars) && (f.useFileCache = !0), r(a.href, null, function (h, i, j, k, m) {
            if (m) {
                m.remaining = d;
                var n = C && C.getItem(j),
                    o = C && C.getItem(j + ":timestamp");
                if (!c && o && m.lastModified && new Date(m.lastModified).valueOf() === new Date(o).valueOf()) return g(n, a), m.local = !0, b(null, null, i, a, m, j), void 0
            }
            l(j), i ? (f.currentFileInfo = k, new v.Parser(f).parse(i, function (c, d) {
                if (c) return b(c, null, null, a);
                try {
                    b(c, d, i, a, m, j)
                } catch (c) {
                    b(c, null, null, a)
                }
            }, {
                modifyVars: e,
                globalVars: v.globalVars
            })) : b(h, null, null, a, m, j)
        }, f, e)
    }

    function t(a, b, c) {
        for (var d = 0; d < v.sheets.length; d++) s(v.sheets[d], a, b, v.sheets.length - (d + 1), c)
    }

    function u() {
        "development" === v.env ? (v.optimization = 0, v.watchTimer = setInterval(function () {
            v.watchMode && t(function (a, b, c, d, e) {
                a ? i(a, d.href) : b && g(b.toCSS(v), d, e.lastModified)
            })
        }, v.poll)) : v.optimization = 3
    }("undefined" == typeof a.less || "undefined" != typeof a.less.nodeType) && (a.less = {}), v = a.less, w = a.less.tree = {}, v.mode = "browser";
    var v, w;
    v === b && (v = exports, w = c("./tree"), v.mode = "node"), v.Parser = function (a) {
        function d() {
            z = D, A = E = x
        }

        function e() {
            D = z, E = x = A
        }

        function f() {
            x > E && (D = D.slice(x - E), E = x)
        }

        function g(a, b) {
            var c = a.charCodeAt(0 | b);
            return 32 >= c && (32 === c || 10 === c || 9 === c)
        }

        function h(a) {
            var b, c, d = typeof a;
            return "string" === d ? u.charAt(x) !== a ? null : (k(1), a) : (f(), (b = a.exec(D)) ? (c = b[0].length, k(c), "string" == typeof b ? b : 1 === b.length ? b[0] : b) : null)
        }

        function i(a) {
            x > E && (D = D.slice(x - E), E = x);
            var b = a.exec(D);
            return b ? (k(b[0].length), "string" == typeof b ? b : 1 === b.length ? b[0] : b) : null
        }

        function j(a) {
            return u.charAt(x) !== a ? null : (k(1), a)
        }

        function k(a) {
            for (var b, c = x, d = y, e = x - E, f = x + D.length - e, g = x += a, h = u; f > x && (b = h.charCodeAt(x), !(b > 32)) && (32 === b || 10 === b || 9 === b || 13 === b); x++);
            return D = D.slice(a + x - g + e), E = x, !D.length && y < C.length - 1 && (D = C[++y]), c !== x || d !== y
        }

        function l(a, b) {
            var c = "function" == typeof a ? a.call(G) : h(a);
            return c ? c : (n(b || ("string" == typeof a ? "expected '" + a + "' got '" + u.charAt(x) + "'" : "unexpected token")), void 0)
        }

        function m(a, b) {
            return u.charAt(x) === a ? (k(1), a) : (n(b || "expected '" + a + "' got '" + u.charAt(x) + "'"), void 0)
        }

        function n(a, b) {
            var c = new Error(a);
            throw c.index = x, c.type = b || "Syntax", c
        }

        function o(a) {
            return "string" == typeof a ? u.charAt(x) === a : a.test(D)
        }

        function p(a) {
            return u.charAt(x) === a
        }

        function q(a, b) {
            return a.filename && b.currentFileInfo.filename && a.filename !== b.currentFileInfo.filename ? F.imports.contents[a.filename] : u
        }

        function r(a, b) {
            for (var c = a + 1, d = null, e = -1; --c >= 0 && "\n" !== b.charAt(c);) e++;
            return "number" == typeof a && (d = (b.slice(0, a).match(/\n/g) || "").length), {
                line: d,
                column: e
            }
        }

        function s(a, b, d) {
            var e = d.currentFileInfo.filename;
            return "browser" !== v.mode && "rhino" !== v.mode && (e = c("path").resolve(e)), {
                lineNumber: r(a, b).line + 1,
                fileName: e
            }
        }

        function t(a, b) {
            var c = q(a, b),
                d = r(a.index, c),
                e = d.line,
                f = d.column,
                g = a.call && r(a.call, c).line,
                h = c.split("\n");
            this.type = a.type || "Syntax", this.message = a.message, this.filename = a.filename || b.currentFileInfo.filename, this.index = a.index, this.line = "number" == typeof e ? e + 1 : null, this.callLine = g + 1, this.callExtract = h[g], this.stack = a.stack, this.column = f, this.extract = [h[e - 1], h[e], h[e + 1]]
        }
        var u, x, y, z, A, B, C, D, E, F, G, H = a && a.filename;
        a instanceof w.parseEnv || (a = new w.parseEnv(a));
        var I = this.imports = {
                paths: a.paths || [],
                queue: [],
                files: a.files,
                contents: a.contents,
                contentsIgnoredChars: a.contentsIgnoredChars,
                mime: a.mime,
                error: null,
                push: function (b, c, d, e) {
                    var f = this;
                    this.queue.push(b);
                    var g = function (a, c, d) {
                        f.queue.splice(f.queue.indexOf(b), 1);
                        var g = d in f.files || d === H;
                        f.files[d] = c, a && !f.error && (f.error = a), e(a, c, g, d)
                    };
                    v.Parser.importer ? v.Parser.importer(b, c, g, a) : v.Parser.fileLoader(b, c, function (b, e, f, h) {
                        if (b) return g(b), void 0;
                        var i = new w.parseEnv(a);
                        i.currentFileInfo = h, i.processImports = !1, i.contents[f] = e, (c.reference || d.reference) && (h.reference = !0), d.inline ? g(null, e, f) : new v.Parser(i).parse(e, function (a, b) {
                            g(a, b, f)
                        })
                    }, a)
                }
            },
            J = i;
        return t.prototype = new Error, t.prototype.constructor = t, this.env = a = a || {}, this.optimization = "optimization" in this.env ? this.env.optimization : 1, F = {
            imports: I,
            parse: function (d, e, f) {
                var g, h, i, j, k, l = null,
                    m = "";
                if (x = y = E = B = 0, j = f && f.globalVars ? v.Parser.serializeVars(f.globalVars) + "\n" : "", k = f && f.modifyVars ? "\n" + v.Parser.serializeVars(f.modifyVars) : "", (j || f && f.banner) && (m = (f && f.banner ? f.banner : "") + j, F.imports.contentsIgnoredChars[a.currentFileInfo.filename] = m.length), d = d.replace(/\r\n/g, "\n"), u = d = m + d.replace(/^\uFEFF/, "") + k, F.imports.contents[a.currentFileInfo.filename] = d, C = function (b) {
                    function c(b, c) {
                        l = new t({
                            index: c || i,
                            type: "Parse",
                            message: b,
                            filename: a.currentFileInfo.filename
                        }, a)
                    }

                    function d(a) {
                        var c = i - s;
                        512 > c && !a || !c || (r.push(b.slice(s, i + 1)), s = i + 1)
                    }
                    var e, f, g, h, i, j, k, m, n, o = b.length,
                        p = 0,
                        q = 0,
                        r = [],
                        s = 0;
                    for (i = 0; o > i; i++)
                        if (k = b.charCodeAt(i), !(k >= 97 && 122 >= k || 34 > k)) switch (k) {
                        case 40:
                            q++;
                            continue;
                        case 41:
                            q--;
                            continue;
                        case 59:
                            q || d();
                            continue;
                        case 123:
                            p++, e = i;
                            continue;
                        case 125:
                            p--, f = i, p || d();
                            continue;
                        case 92:
                            if (o - 1 > i) {
                                i++;
                                continue
                            }
                            return c("unescaped `\\`");
                        case 34:
                        case 39:
                        case 96:
                            for (n = 0, j = i, i += 1; o > i; i++)
                                if (m = b.charCodeAt(i), !(m > 96)) {
                                    if (m == k) {
                                        n = 1;
                                        break
                                    }
                                    if (92 == m) {
                                        if (i == o - 1) return c("unescaped `\\`");
                                        i++
                                    }
                                }
                            if (n) continue;
                            return c("unmatched `" + String.fromCharCode(k) + "`", j);
                        case 47:
                            if (q || i == o - 1) continue;
                            if (m = b.charCodeAt(i + 1), 47 == m)
                                for (i += 2; o > i && (m = b.charCodeAt(i), !(13 >= m) || 10 != m && 13 != m); i++);
                            else if (42 == m) {
                                for (g = j = i, i += 2; o - 1 > i && (m = b.charCodeAt(i), 125 == m && (h = i), 42 != m || 47 != b.charCodeAt(i + 1)); i++);
                                if (i == o - 1) return c("missing closing `*/`", j)
                            }
                            continue;
                        case 42:
                            if (o - 1 > i && 47 == b.charCodeAt(i + 1)) return c("unmatched `/*`");
                            continue
                        }
                        return 0 !== p ? p > 0 ? g > e && h > g ? c("missing closing `}` or `*/`", e) : c("missing closing `}`", e) : c("missing opening `{`", f) : 0 !== q ? c(q > 0 ? "missing closing `)`" : "missing opening `(`") : (d(!0), r)
                }(d), l) return e(new t(l, a));
                D = C[0];
                try {
                    g = new w.Ruleset(null, this.parsers.primary()), g.root = !0, g.firstRoot = !0
                } catch (n) {
                    return e(new t(n, a))
                }
                if (g.toCSS = function (d) {
                    return function (e, f) {
                        e = e || {};
                        var g, h, i = new w.evalEnv(e);
                        "object" != typeof f || Array.isArray(f) || (f = Object.keys(f).map(function (a) {
                            var b = f[a];
                            return b instanceof w.Value || (b instanceof w.Expression || (b = new w.Expression([b])), b = new w.Value([b])), new w.Rule("@" + a, b, !1, null, 0)
                        }), i.frames = [new w.Ruleset(null, f)]);
                        try {
                            var j, k = [],
                                l = [new w.joinSelectorVisitor, new w.processExtendsVisitor, new w.toCSSVisitor({
                                    compress: Boolean(e.compress)
                                })],
                                m = this;
                            if (e.plugins)
                                for (j = 0; j < e.plugins.length; j++) e.plugins[j].isPreEvalVisitor ? k.push(e.plugins[j]) : e.plugins[j].isPreVisitor ? l.splice(0, 0, e.plugins[j]) : l.push(e.plugins[j]);
                            for (j = 0; j < k.length; j++) k[j].run(m);
                            for (g = d.call(m, i), j = 0; j < l.length; j++) l[j].run(g);
                            e.sourceMap && (g = new w.sourceMapOutput({
                                contentsIgnoredCharsMap: F.imports.contentsIgnoredChars,
                                writeSourceMap: e.writeSourceMap,
                                rootNode: g,
                                contentsMap: F.imports.contents,
                                sourceMapFilename: e.sourceMapFilename,
                                sourceMapURL: e.sourceMapURL,
                                outputFilename: e.sourceMapOutputFilename,
                                sourceMapBasepath: e.sourceMapBasepath,
                                sourceMapRootpath: e.sourceMapRootpath,
                                outputSourceFiles: e.outputSourceFiles,
                                sourceMapGenerator: e.sourceMapGenerator
                            })), h = g.toCSS({
                                compress: Boolean(e.compress),
                                dumpLineNumbers: a.dumpLineNumbers,
                                strictUnits: Boolean(e.strictUnits)
                            })
                        } catch (n) {
                            throw new t(n, a)
                        }
                        if (e.cleancss && "node" === v.mode) {
                            var o = c("clean-css"),
                                p = e.cleancssOptions || {};
                            return p.keepSpecialComments === b && (p.keepSpecialComments = "*"), p.processImport = !1, p.noRebase = !0, p.noAdvanced === b && (p.noAdvanced = !0), new o(p).minify(h)
                        }
                        return e.compress ? h.replace(/(^(\s)+)|((\s)+$)/g, "") : h
                    }
                }(g.eval), x < u.length - 1) {
                    x = B;
                    var o = r(x, u);
                    i = u.split("\n"), h = o.line + 1, l = {
                        type: "Parse",
                        message: "Unrecognised input",
                        index: x,
                        filename: a.currentFileInfo.filename,
                        line: h,
                        column: o.column,
                        extract: [i[h - 2], i[h - 1], i[h]]
                    }
                }
                var p = function (b) {
                    return b = l || b || F.imports.error, b ? (b instanceof t || (b = new t(b, a)), e(b)) : e(null, g)
                };
                return a.processImports === !1 ? p() : (new w.importVisitor(this.imports, p).run(g), void 0)
            },
            parsers: G = {
                primary: function () {
                    for (var a, b = this.mixin, c = J, d = [];;)
                        if (a = this.extendRule() || b.definition() || this.rule() || this.ruleset() || b.call() || this.comment() || this.directive()) d.push(a);
                        else if (!c(/^[\s\n]+/) && !c(/^;+/)) break;
                    return d
                },
                comment: function () {
                    var b;
                    if ("/" === u.charAt(x)) return "/" === u.charAt(x + 1) ? new w.Comment(i(/^\/\/.*/), !0, x, a.currentFileInfo) : (b = i(/^\/\*(?:[^*]|\*+[^\/*])*\*+\/\n?/), b ? new w.Comment(b, !1, x, a.currentFileInfo) : void 0)
                },
                comments: function () {
                    for (var a, b = [];;) {
                        if (a = this.comment(), !a) break;
                        b.push(a)
                    }
                    return b
                },
                entities: {
                    quoted: function () {
                        var b, c, d = x,
                            e = x;
                        return "~" === u.charAt(d) && (d++, c = !0), '"' === u.charAt(d) || "'" === u.charAt(d) ? (c && j("~"), b = i(/^"((?:[^"\\\r\n]|\\.)*)"|'((?:[^'\\\r\n]|\\.)*)'/), b ? new w.Quoted(b[0], b[1] || b[2], c, e, a.currentFileInfo) : void 0) : void 0
                    },
                    keyword: function () {
                        var a;
                        if (a = i(/^[_A-Za-z-][_A-Za-z0-9-]*/)) {
                            var b = w.Color.fromKeyword(a);
                            return b ? b : new w.Keyword(a)
                        }
                    },
                    call: function () {
                        var b, c, d, e, f = x;
                        if (b = /^([\w-]+|%|progid:[\w\.]+)\(/.exec(D)) {
                            if (b = b[1], c = b.toLowerCase(), "url" === c) return null;
                            if (x += b.length, "alpha" === c && (e = G.alpha(), "undefined" != typeof e)) return e;
                            if (j("("), d = this.arguments(), j(")")) return b ? new w.Call(b, d, f, a.currentFileInfo) : void 0
                        }
                    },
                    arguments: function () {
                        for (var a, b = [];;) {
                            if (a = this.assignment() || G.expression(), !a) break;
                            if (b.push(a), !j(",")) break
                        }
                        return b
                    },
                    literal: function () {
                        return this.dimension() || this.color() || this.quoted() || this.unicodeDescriptor()
                    },
                    assignment: function () {
                        var a, b;
                        return a = i(/^\w+(?=\s?=)/i), a && j("=") ? (b = G.entity(), b ? new w.Assignment(a, b) : void 0) : void 0
                    },
                    url: function () {
                        var b;
                        if ("u" === u.charAt(x) && i(/^url\(/)) return b = this.quoted() || this.variable() || i(/^(?:(?:\\[\(\)'"])|[^\(\)'"])+/) || "", m(")"), new w.URL(null != b.value || b instanceof w.Variable ? b : new w.Anonymous(b), a.currentFileInfo)
                    },
                    variable: function () {
                        var b, c = x;
                        return "@" === u.charAt(x) && (b = i(/^@@?[\w-]+/)) ? new w.Variable(b, c, a.currentFileInfo) : void 0
                    },
                    variableCurly: function () {
                        var b, c = x;
                        return "@" === u.charAt(x) && (b = i(/^@\{([\w-]+)\}/)) ? new w.Variable("@" + b[1], c, a.currentFileInfo) : void 0
                    },
                    color: function () {
                        var a;
                        return "#" === u.charAt(x) && (a = i(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/)) ? new w.Color(a[1]) : void 0
                    },
                    dimension: function () {
                        var a, b = u.charCodeAt(x);
                        if (!(b > 57 || 43 > b || 47 === b || 44 == b)) return a = i(/^([+-]?\d*\.?\d+)(%|[a-z]+)?/), a ? new w.Dimension(a[1], a[2]) : void 0
                    },
                    unicodeDescriptor: function () {
                        var a;
                        return a = i(/^U\+[0-9a-fA-F?]+(\-[0-9a-fA-F?]+)?/), a ? new w.UnicodeDescriptor(a[0]) : void 0
                    },
                    javascript: function () {
                        var c, d, e = x;
                        return "~" === u.charAt(e) && (e++, d = !0), "`" === u.charAt(e) ? (a.javascriptEnabled === b || a.javascriptEnabled || n("You are using JavaScript, which has been disabled."), d && j("~"), c = i(/^`([^`]*)`/), c ? new w.JavaScript(c[1], x, d) : void 0) : void 0
                    }
                },
                variable: function () {
                    var a;
                    return "@" === u.charAt(x) && (a = i(/^(@[\w-]+)\s*:/)) ? a[1] : void 0
                },
                extend: function (a) {
                    var b, c, d, e, f, g = x;
                    if (a ? i(/^&:extend\(/) : i(/^:extend\(/)) {
                        do {
                            for (d = null, b = null; !(d = i(/^(all)(?=\s*(\)|,))/)) && (c = this.element());) b ? b.push(c) : b = [c];
                            d = d && d[1], f = new w.Extend(new w.Selector(b), d, g), e ? e.push(f) : e = [f]
                        } while (j(","));
                        return l(/^\)/), a && l(/^;/), e
                    }
                },
                extendRule: function () {
                    return this.extend(!0)
                },
                mixin: {
                    call: function () {
                        var b, c, f, g, h, k = u.charAt(x),
                            l = !1,
                            n = x;
                        if ("." === k || "#" === k) {
                            for (d();;) {
                                if (f = i(/^[#.](?:[\w-]|\\(?:[A-Fa-f0-9]{1,6} ?|[^A-Fa-f0-9]))+/), !f) break;
                                c = new w.Element(g, f, x, a.currentFileInfo), b ? b.push(c) : b = [c], g = j(">")
                            }
                            return j("(") && (h = this.args(!0).args, m(")")), G.important() && (l = !0), b && (j(";") || p("}")) ? new w.mixin.Call(b, h, n, a.currentFileInfo, l) : (e(), void 0)
                        }
                    },
                    args: function (a) {
                        for (var b, c, d, e, f, g, h = F.parsers, k = h.entities, m = {
                            args: null,
                            variadic: !1
                        }, o = [], p = [], q = [];;) {
                            if (a) g = h.expression();
                            else {
                                if (h.comments(), "." === u.charAt(x) && i(/^\.{3}/)) {
                                    m.variadic = !0, j(";") && !b && (b = !0), (b ? p : q).push({
                                        variadic: !0
                                    });
                                    break
                                }
                                g = k.variable() || k.literal() || k.keyword()
                            } if (!g) break;
                            e = null, g.throwAwayComments && g.throwAwayComments(), f = g;
                            var r = null;
                            if (a ? 1 == g.value.length && (r = g.value[0]) : r = g, r && r instanceof w.Variable)
                                if (j(":")) o.length > 0 && (b && n("Cannot mix ; and , as delimiter types"), c = !0), f = l(h.expression), e = d = r.name;
                                else {
                                    if (!a && i(/^\.{3}/)) {
                                        m.variadic = !0, j(";") && !b && (b = !0), (b ? p : q).push({
                                            name: g.name,
                                            variadic: !0
                                        });
                                        break
                                    }
                                    a || (d = e = r.name, f = null)
                                }
                            f && o.push(f), q.push({
                                name: e,
                                value: f
                            }), j(",") || (j(";") || b) && (c && n("Cannot mix ; and , as delimiter types"), b = !0, o.length > 1 && (f = new w.Value(o)), p.push({
                                name: d,
                                value: f
                            }), d = null, o = [], c = !1)
                        }
                        return m.args = b ? p : q, m
                    },
                    definition: function () {
                        var a, b, c, f, g = [],
                            h = !1;
                        if (!("." !== u.charAt(x) && "#" !== u.charAt(x) || o(/^[^{]*\}/)) && (d(), b = i(/^([#.](?:[\w-]|\\(?:[A-Fa-f0-9]{1,6} ?|[^A-Fa-f0-9]))+)\s*\(/))) {
                            a = b[1];
                            var k = this.args(!1);
                            if (g = k.args, h = k.variadic, j(")") || (B = x, e()), G.comments(), i(/^when/) && (f = l(G.conditions, "expected condition")), c = G.block()) return new w.mixin.Definition(a, g, c, f, h);
                            e()
                        }
                    }
                },
                entity: function () {
                    var a = this.entities;
                    return a.literal() || a.variable() || a.url() || a.call() || a.keyword() || a.javascript() || this.comment()
                },
                end: function () {
                    return j(";") || p("}")
                },
                alpha: function () {
                    var a;
                    if (i(/^\(opacity=/i)) return a = i(/^\d+/) || this.entities.variable(), a ? (m(")"), new w.Alpha(a)) : void 0
                },
                element: function () {
                    var b, c, d;
                    return c = this.combinator(), b = i(/^(?:\d+\.\d+|\d+)%/) || i(/^(?:[.#]?|:*)(?:[\w-]|[^\x00-\x9f]|\\(?:[A-Fa-f0-9]{1,6} ?|[^A-Fa-f0-9]))+/) || j("*") || j("&") || this.attribute() || i(/^\([^()@]+\)/) || i(/^[\.#](?=@)/) || this.entities.variableCurly(), b || j("(") && (d = this.selector()) && j(")") && (b = new w.Paren(d)), b ? new w.Element(c, b, x, a.currentFileInfo) : void 0
                },
                combinator: function () {
                    var a = u.charAt(x);
                    if (">" === a || "+" === a || "~" === a || "|" === a) {
                        for (x++; g(u, x);) x++;
                        return new w.Combinator(a)
                    }
                    return g(u, x - 1) ? new w.Combinator(" ") : new w.Combinator(null)
                },
                lessSelector: function () {
                    return this.selector(!0)
                },
                selector: function (b) {
                    for (var c, d, e, f, g, h, i, j = J;
                        (b && (g = this.extend()) || b && (h = j(/^when/)) || (f = this.element())) && (h ? i = l(this.conditions, "expected condition") : i ? n("CSS guard can only be used at the end of selector") : g ? d ? d.push(g) : d = [g] : (d && n("Extend can only be used at the end of selector"), e = u.charAt(x), c ? c.push(f) : c = [f], f = null), "{" !== e && "}" !== e && ";" !== e && "," !== e && ")" !== e););
                    return c ? new w.Selector(c, d, i, x, a.currentFileInfo) : (d && n("Extend must be used to extend a selector, it cannot be used on its own"), void 0)
                },
                attribute: function () {
                    if (j("[")) {
                        var a, b, c, d = this.entities;
                        return (a = d.variableCurly()) || (a = l(/^(?:[_A-Za-z0-9-\*]*\|)?(?:[_A-Za-z0-9-]|\\.)+/)), c = i(/^[|~*$^]?=/), c && (b = d.quoted() || i(/^[0-9]+%/) || i(/^[\w-]+/) || d.variableCurly()), m("]"), new w.Attribute(a, c, b)
                    }
                },
                block: function () {
                    var a;
                    return j("{") && (a = this.primary()) && j("}") ? a : void 0
                },
                ruleset: function () {
                    var b, c, f, g;
                    for (d(), a.dumpLineNumbers && (g = s(x, u, a));;) {
                        if (c = this.lessSelector(), !c) break;
                        if (b ? b.push(c) : b = [c], this.comments(), !j(",")) break;
                        c.condition && n("Guards are only currently allowed on a single selector."), this.comments()
                    }
                    if (b && (f = this.block())) {
                        var h = new w.Ruleset(b, f, a.strictImports);
                        return a.dumpLineNumbers && (h.debugInfo = g), h
                    }
                    B = x, e()
                },
                rule: function (b) {
                    var c, f, g, h = u.charAt(x),
                        i = !1;
                    if (d(), "." !== h && "#" !== h && "&" !== h && (c = this.variable() || this.ruleProperty())) {
                        if (f = !b && (a.compress || c.charAt && "@" === c.charAt(0)) ? this.value() || this.anonymousValue() : this.anonymousValue() || this.value(), g = this.important(), i = c.pop && "+" === c.pop(), f && this.end()) return new w.Rule(c, f, g, i, A, a.currentFileInfo);
                        if (B = x, e(), f && !b) return this.rule(!0)
                    }
                },
                anonymousValue: function () {
                    var a;
                    return a = /^([^@+\/'"*`(;{}-]*);/.exec(D), a ? (x += a[0].length - 1, new w.Anonymous(a[1])) : void 0
                },
                "import": function () {
                    var b, c, f = x;
                    d();
                    var g = i(/^@import?\s+/),
                        h = (g ? this.importOptions() : null) || {};
                    return g && (b = this.entities.quoted() || this.entities.url()) && (c = this.mediaFeatures(), j(";")) ? (c = c && new w.Value(c), new w.Import(b, c, h, f, a.currentFileInfo)) : (e(), void 0)
                },
                importOptions: function () {
                    var a, b, c, d = {};
                    if (!j("(")) return null;
                    do
                        if (a = this.importOption()) {
                            switch (b = a, c = !0, b) {
                            case "css":
                                b = "less", c = !1;
                                break;
                            case "once":
                                b = "multiple", c = !1
                            }
                            if (d[b] = c, !j(",")) break
                        }
                    while (a);
                    return m(")"), d
                },
                importOption: function () {
                    var a = i(/^(less|css|multiple|once|inline|reference)/);
                    return a ? a[1] : void 0
                },
                mediaFeature: function () {
                    var b, c, d = this.entities,
                        e = [];
                    do
                        if (b = d.keyword() || d.variable()) e.push(b);
                        else if (j("(")) {
                        if (c = this.property(), b = this.value(), !j(")")) return null;
                        if (c && b) e.push(new w.Paren(new w.Rule(c, b, null, null, x, a.currentFileInfo, !0)));
                        else {
                            if (!b) return null;
                            e.push(new w.Paren(b))
                        }
                    } while (b);
                    return e.length > 0 ? new w.Expression(e) : void 0
                },
                mediaFeatures: function () {
                    var a, b = this.entities,
                        c = [];
                    do
                        if (a = this.mediaFeature()) {
                            if (c.push(a), !j(",")) break
                        } else if (a = b.variable(), a && (c.push(a), !j(","))) break; while (a);
                    return c.length > 0 ? c : null
                },
                media: function () {
                    var b, c, d, e;
                    return a.dumpLineNumbers && (e = s(x, u, a)), i(/^@media/) && (b = this.mediaFeatures(), c = this.block()) ? (d = new w.Media(c, b, x, a.currentFileInfo), a.dumpLineNumbers && (d.debugInfo = e), d) : void 0
                },
                directive: function () {
                    var b, c, f, g, h, k, l, m;
                    if ("@" === u.charAt(x)) {
                        if (c = this["import"]() || this.media()) return c;
                        if (d(), b = i(/^@[a-z-]+/)) {
                            switch (g = b, "-" == b.charAt(1) && b.indexOf("-", 2) > 0 && (g = "@" + b.slice(b.indexOf("-", 2) + 1)), g) {
                            case "@font-face":
                                h = !0;
                                break;
                            case "@viewport":
                            case "@top-left":
                            case "@top-left-corner":
                            case "@top-center":
                            case "@top-right":
                            case "@top-right-corner":
                            case "@bottom-left":
                            case "@bottom-left-corner":
                            case "@bottom-center":
                            case "@bottom-right":
                            case "@bottom-right-corner":
                            case "@left-top":
                            case "@left-middle":
                            case "@left-bottom":
                            case "@right-top":
                            case "@right-middle":
                            case "@right-bottom":
                                h = !0;
                                break;
                            case "@host":
                            case "@page":
                            case "@document":
                            case "@supports":
                            case "@keyframes":
                                h = !0, k = !0;
                                break;
                            case "@namespace":
                                l = !0
                            }
                            if (k && (m = (i(/^[^{]+/) || "").trim(), m && (b += " " + m)), h) {
                                if (f = this.block()) return new w.Directive(b, f, x, a.currentFileInfo)
                            } else if (c = l ? this.expression() : this.entity(), c && j(";")) {
                                var n = new w.Directive(b, c, x, a.currentFileInfo);
                                return a.dumpLineNumbers && (n.debugInfo = s(x, u, a)), n
                            }
                            e()
                        }
                    }
                },
                value: function () {
                    var a, b = [];
                    do
                        if (a = this.expression(), a && (b.push(a), !j(","))) break;
                    while (a);
                    return b.length > 0 ? new w.Value(b) : void 0
                },
                important: function () {
                    return "!" === u.charAt(x) ? i(/^! *important/) : void 0
                },
                sub: function () {
                    var a, b;
                    return j("(") && (a = this.addition()) ? (b = new w.Expression([a]), m(")"), b.parens = !0, b) : void 0
                },
                multiplication: function () {
                    var a, b, c, d, e;
                    if (a = this.operand()) {
                        for (e = g(u, x - 1);;) {
                            if (o(/^\/[*\/]/)) break;
                            if (c = j("/") || j("*"), !c) break;
                            if (b = this.operand(), !b) break;
                            a.parensInOp = !0, b.parensInOp = !0, d = new w.Operation(c, [d || a, b], e), e = g(u, x - 1)
                        }
                        return d || a
                    }
                },
                addition: function () {
                    var a, b, c, d, e;
                    if (a = this.multiplication()) {
                        for (e = g(u, x - 1);;) {
                            if (c = i(/^[-+]\s+/) || !e && (j("+") || j("-")), !c) break;
                            if (b = this.multiplication(), !b) break;
                            a.parensInOp = !0, b.parensInOp = !0, d = new w.Operation(c, [d || a, b], e), e = g(u, x - 1)
                        }
                        return d || a
                    }
                },
                conditions: function () {
                    var a, b, c, d = x;
                    if (a = this.condition()) {
                        for (;;) {
                            if (!o(/^,\s*(not\s*)?\(/) || !j(",")) break;
                            if (b = this.condition(), !b) break;
                            c = new w.Condition("or", c || a, b, d)
                        }
                        return c || a
                    }
                },
                condition: function () {
                    var a, b, c, d, e = this.entities,
                        f = x,
                        g = !1;
                    return i(/^not/) && (g = !0), m("("), a = this.addition() || e.keyword() || e.quoted(), a ? (d = i(/^(?:>=|<=|=<|[<=>])/), d ? (b = this.addition() || e.keyword() || e.quoted(), b ? c = new w.Condition(d, a, b, f, g) : n("expected expression")) : c = new w.Condition("=", a, new w.Keyword("true"), f, g), m(")"), i(/^and/) ? new w.Condition("and", c, this.condition()) : c) : void 0
                },
                operand: function () {
                    var a, b = this.entities,
                        c = u.charAt(x + 1);
                    "-" !== u.charAt(x) || "@" !== c && "(" !== c || (a = j("-"));
                    var d = this.sub() || b.dimension() || b.color() || b.variable() || b.call();
                    return a && (d.parensInOp = !0, d = new w.Negative(d)), d
                },
                expression: function () {
                    var a, b, c = [];
                    do a = this.addition() || this.entity(), a && (c.push(a), o(/^\/[\/*]/) || (b = j("/"), b && c.push(new w.Anonymous(b)))); while (a);
                    return c.length > 0 ? new w.Expression(c) : void 0
                },
                property: function () {
                    var a = i(/^(\*?-?[_a-zA-Z0-9-]+)\s*:/);
                    return a ? a[1] : void 0
                },
                ruleProperty: function () {
                    function b(a) {
                        var b = a.exec(c);
                        return b ? (e.push(x + f), f += b[0].length, c = c.slice(b[1].length), d.push(b[1])) : void 0
                    }
                    var c = D,
                        d = [],
                        e = [],
                        f = 0;
                    for (b(/^(\*?)/); b(/^((?:[\w-]+)|(?:@\{[\w-]+\}))/););
                    if (d.length > 1 && b(/^\s*(\+?)\s*:/)) {
                        k(f);
                        for (var g in d) "@" === d[g].charAt(0) && (d[g] = new w.Variable("@" + d[g].slice(2, -1), e[g], a.currentFileInfo));
                        return d
                    }
                }
            }
        }
    }, v.Parser.serializeVars = function (a) {
        var b = "";
        for (var c in a)
            if (Object.hasOwnProperty.call(a, c)) {
                var d = a[c];
                b += ("@" === c[0] ? "" : "@") + c + ": " + d + (";" === ("" + d).slice(-1) ? "" : ";")
            }
        return b
    },
    function (d) {
        function e(a, b, c) {
            if (!(c instanceof d.Dimension)) throw {
                type: "Argument",
                message: "argument must be a number"
            };
            return null == b ? b = c.unit : c = c.unify(), new d.Dimension(a(parseFloat(c.value)), b)
        }

        function f(a, b, c) {
            var e, f, g, h, i = b.alpha,
                j = c.alpha,
                k = [];
            g = j + i * (1 - j);
            for (var l = 0; 3 > l; l++) e = b.rgb[l] / 255, f = c.rgb[l] / 255, h = a(e, f), g && (h = (j * f + i * (e - j * (e + f - h))) / g), k[l] = 255 * h;
            return new d.Color(k, g)
        }

        function g() {
            var a, b = d.functions;
            for (a in l) b[a] = e.bind(null, Math[a], l[a]);
            for (a in m) b[a] = f.bind(null, m[a]);
            a = d.defaultFunc, b.default = a.eval.bind(a)
        }

        function h(a) {
            return d.functions.hsla(a.h, a.s, a.l, a.a)
        }

        function i(a, b) {
            return a instanceof d.Dimension && a.unit.is("%") ? parseFloat(a.value * b / 100) : j(a)
        }

        function j(a) {
            if (a instanceof d.Dimension) return parseFloat(a.unit.is("%") ? a.value / 100 : a.value);
            if ("number" == typeof a) return a;
            throw {
                error: "RuntimeError",
                message: "color functions take numbers as parameters"
            }
        }

        function k(a) {
            return Math.min(1, Math.max(0, a))
        }
        d.functions = {
            rgb: function (a, b, c) {
                return this.rgba(a, b, c, 1)
            },
            rgba: function (a, b, c, e) {
                var f = [a, b, c].map(function (a) {
                    return i(a, 255)
                });
                return e = j(e), new d.Color(f, e)
            },
            hsl: function (a, b, c) {
                return this.hsla(a, b, c, 1)
            },
            hsla: function (a, b, c, d) {
                function e(a) {
                    return a = 0 > a ? a + 1 : a > 1 ? a - 1 : a, 1 > 6 * a ? g + (f - g) * a * 6 : 1 > 2 * a ? f : 2 > 3 * a ? g + (f - g) * (2 / 3 - a) * 6 : g
                }
                a = j(a) % 360 / 360, b = k(j(b)), c = k(j(c)), d = k(j(d));
                var f = .5 >= c ? c * (b + 1) : c + b - c * b,
                    g = 2 * c - f;
                return this.rgba(255 * e(a + 1 / 3), 255 * e(a), 255 * e(a - 1 / 3), d)
            },
            hsv: function (a, b, c) {
                return this.hsva(a, b, c, 1)
            },
            hsva: function (a, b, c, d) {
                a = j(a) % 360 / 360 * 360, b = j(b), c = j(c), d = j(d);
                var e, f;
                e = Math.floor(a / 60 % 6), f = a / 60 - e;
                var g = [c, c * (1 - b), c * (1 - f * b), c * (1 - (1 - f) * b)],
                    h = [
                        [0, 3, 1],
                        [2, 0, 1],
                        [1, 0, 3],
                        [1, 2, 0],
                        [3, 1, 0],
                        [0, 1, 2]
                    ];
                return this.rgba(255 * g[h[e][0]], 255 * g[h[e][1]], 255 * g[h[e][2]], d)
            },
            hue: function (a) {
                return new d.Dimension(Math.round(a.toHSL().h))
            },
            saturation: function (a) {
                return new d.Dimension(Math.round(100 * a.toHSL().s), "%")
            },
            lightness: function (a) {
                return new d.Dimension(Math.round(100 * a.toHSL().l), "%")
            },
            hsvhue: function (a) {
                return new d.Dimension(Math.round(a.toHSV().h))
            },
            hsvsaturation: function (a) {
                return new d.Dimension(Math.round(100 * a.toHSV().s), "%")
            },
            hsvvalue: function (a) {
                return new d.Dimension(Math.round(100 * a.toHSV().v), "%")
            },
            red: function (a) {
                return new d.Dimension(a.rgb[0])
            },
            green: function (a) {
                return new d.Dimension(a.rgb[1])
            },
            blue: function (a) {
                return new d.Dimension(a.rgb[2])
            },
            alpha: function (a) {
                return new d.Dimension(a.toHSL().a)
            },
            luma: function (a) {
                return new d.Dimension(Math.round(a.luma() * a.alpha * 100), "%")
            },
            saturate: function (a, b) {
                if (!a.rgb) return null;
                var c = a.toHSL();
                return c.s += b.value / 100, c.s = k(c.s), h(c)
            },
            desaturate: function (a, b) {
                var c = a.toHSL();
                return c.s -= b.value / 100, c.s = k(c.s), h(c)
            },
            lighten: function (a, b) {
                var c = a.toHSL();
                return c.l += b.value / 100, c.l = k(c.l), h(c)
            },
            darken: function (a, b) {
                var c = a.toHSL();
                return c.l -= b.value / 100, c.l = k(c.l), h(c)
            },
            fadein: function (a, b) {
                var c = a.toHSL();
                return c.a += b.value / 100, c.a = k(c.a), h(c)
            },
            fadeout: function (a, b) {
                var c = a.toHSL();
                return c.a -= b.value / 100, c.a = k(c.a), h(c)
            },
            fade: function (a, b) {
                var c = a.toHSL();
                return c.a = b.value / 100, c.a = k(c.a), h(c)
            },
            spin: function (a, b) {
                var c = a.toHSL(),
                    d = (c.h + b.value) % 360;
                return c.h = 0 > d ? 360 + d : d, h(c)
            },
            mix: function (a, b, c) {
                c || (c = new d.Dimension(50));
                var e = c.value / 100,
                    f = 2 * e - 1,
                    g = a.toHSL().a - b.toHSL().a,
                    h = ((f * g == -1 ? f : (f + g) / (1 + f * g)) + 1) / 2,
                    i = 1 - h,
                    j = [a.rgb[0] * h + b.rgb[0] * i, a.rgb[1] * h + b.rgb[1] * i, a.rgb[2] * h + b.rgb[2] * i],
                    k = a.alpha * e + b.alpha * (1 - e);
                return new d.Color(j, k)
            },
            greyscale: function (a) {
                return this.desaturate(a, new d.Dimension(100))
            },
            contrast: function (a, b, c, d) {
                if (!a.rgb) return null;
                if ("undefined" == typeof c && (c = this.rgba(255, 255, 255, 1)), "undefined" == typeof b && (b = this.rgba(0, 0, 0, 1)), b.luma() > c.luma()) {
                    var e = c;
                    c = b, b = e
                }
                return d = "undefined" == typeof d ? .43 : j(d), a.luma() < d ? c : b
            },
            e: function (a) {
                return new d.Anonymous(a instanceof d.JavaScript ? a.evaluated : a)
            },
            escape: function (a) {
                return new d.Anonymous(encodeURI(a.value).replace(/=/g, "%3D").replace(/:/g, "%3A").replace(/#/g, "%23").replace(/;/g, "%3B").replace(/\(/g, "%28").replace(/\)/g, "%29"))
            },
            "%": function (a) {
                for (var b = Array.prototype.slice.call(arguments, 1), c = a.value, e = 0; e < b.length; e++) c = c.replace(/%[sda]/i, function (a) {
                    var c = a.match(/s/i) ? b[e].value : b[e].toCSS();
                    return a.match(/[A-Z]$/) ? encodeURIComponent(c) : c
                });
                return c = c.replace(/%%/g, "%"), new d.Quoted('"' + c + '"', c)
            },
            unit: function (a, b) {
                if (!(a instanceof d.Dimension)) throw {
                    type: "Argument",
                    message: "the first argument to unit must be a number" + (a instanceof d.Operation ? ". Have you forgotten parenthesis?" : "")
                };
                return new d.Dimension(a.value, b ? b.toCSS() : "")
            },
            convert: function (a, b) {
                return a.convertTo(b.value)
            },
            round: function (a, b) {
                var c = "undefined" == typeof b ? 0 : b.value;
                return e(function (a) {
                    return a.toFixed(c)
                }, null, a)
            },
            pi: function () {
                return new d.Dimension(Math.PI)
            },
            mod: function (a, b) {
                return new d.Dimension(a.value % b.value, a.unit)
            },
            pow: function (a, b) {
                if ("number" == typeof a && "number" == typeof b) a = new d.Dimension(a), b = new d.Dimension(b);
                else if (!(a instanceof d.Dimension && b instanceof d.Dimension)) throw {
                    type: "Argument",
                    message: "arguments must be numbers"
                };
                return new d.Dimension(Math.pow(a.value, b.value), a.unit)
            },
            _minmax: function (a, c) {
                switch (c = Array.prototype.slice.call(c), c.length) {
                case 0:
                    throw {
                        type: "Argument",
                        message: "one or more arguments required"
                    };
                case 1:
                    return c[0]
                }
                var e, f, g, h, i, j, k = [],
                    l = {};
                for (e = 0; e < c.length; e++) g = c[e], g instanceof d.Dimension ? (h = g.unify(), j = h.unit.toString(), f = l[j], f !== b ? (i = k[f].unify(), (a && h.value < i.value || !a && h.value > i.value) && (k[f] = g)) : (l[j] = k.length, k.push(g))) : k.push(g);
                return 1 == k.length ? k[0] : (c = k.map(function (a) {
                    return a.toCSS(this.env)
                }).join(this.env.compress ? "," : ", "), new d.Anonymous((a ? "min" : "max") + "(" + c + ")"))
            },
            min: function () {
                return this._minmax(!0, arguments)
            },
            max: function () {
                return this._minmax(!1, arguments)
            },
            argb: function (a) {
                return new d.Anonymous(a.toARGB())
            },
            percentage: function (a) {
                return new d.Dimension(100 * a.value, "%")
            },
            color: function (a) {
                if (a instanceof d.Quoted) {
                    var b, c = a.value;
                    if (b = d.Color.fromKeyword(c)) return b;
                    if (/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/.test(c)) return new d.Color(c.slice(1));
                    throw {
                        type: "Argument",
                        message: "argument must be a color keyword or 3/6 digit hex e.g. #FFF"
                    }
                }
                throw {
                    type: "Argument",
                    message: "argument must be a string"
                }
            },
            iscolor: function (a) {
                return this._isa(a, d.Color)
            },
            isnumber: function (a) {
                return this._isa(a, d.Dimension)
            },
            isstring: function (a) {
                return this._isa(a, d.Quoted)
            },
            iskeyword: function (a) {
                return this._isa(a, d.Keyword)
            },
            isurl: function (a) {
                return this._isa(a, d.URL)
            },
            ispixel: function (a) {
                return this.isunit(a, "px")
            },
            ispercentage: function (a) {
                return this.isunit(a, "%")
            },
            isem: function (a) {
                return this.isunit(a, "em")
            },
            isunit: function (a, b) {
                return a instanceof d.Dimension && a.unit.is(b.value || b) ? d.True : d.False
            },
            _isa: function (a, b) {
                return a instanceof b ? d.True : d.False
            },
            tint: function (a, b) {
                return this.mix(this.rgb(255, 255, 255), a, b)
            },
            shade: function (a, b) {
                return this.mix(this.rgb(0, 0, 0), a, b)
            },
            extract: function (a, b) {
                return b = b.value - 1, Array.isArray(a.value) ? a.value[b] : Array(a)[b]
            },
            length: function (a) {
                var b = Array.isArray(a.value) ? a.value.length : 1;
                return new d.Dimension(b)
            },
            "data-uri": function (b, e) {
                if ("undefined" != typeof a) return new d.URL(e || b, this.currentFileInfo).eval(this.env);
                var f = b.value,
                    g = e && e.value,
                    h = c("fs"),
                    i = c("path"),
                    j = !1;
                if (arguments.length < 2 && (g = f), this.env.isPathRelative(g) && (g = this.currentFileInfo.relativeUrls ? i.join(this.currentFileInfo.currentDirectory, g) : i.join(this.currentFileInfo.entryPath, g)), arguments.length < 2) {
                    var k;
                    try {
                        k = c("mime")
                    } catch (l) {
                        k = d._mime
                    }
                    f = k.lookup(g);
                    var m = k.charsets.lookup(f);
                    j = ["US-ASCII", "UTF-8"].indexOf(m) < 0, j && (f += ";base64")
                } else j = /;base64$/.test(f);
                var n = h.readFileSync(g),
                    o = 32,
                    p = parseInt(n.length / 1024, 10);
                if (p >= o && this.env.ieCompat !== !1) return this.env.silent || console.warn("Skipped data-uri embedding of %s because its size (%dKB) exceeds IE8-safe %dKB!", g, p, o), new d.URL(e || b, this.currentFileInfo).eval(this.env);
                n = j ? n.toString("base64") : encodeURIComponent(n);
                var q = "'data:" + f + "," + n + "'";
                return new d.URL(new d.Anonymous(q))
            },
            "svg-gradient": function (a) {
                function c() {
                    throw {
                        type: "Argument",
                        message: "svg-gradient expects direction, start_color [start_position], [color position,]..., end_color [end_position]"
                    }
                }
                arguments.length < 3 && c();
                var e, f, g, h, i, j, k, l = Array.prototype.slice.call(arguments, 1),
                    m = "linear",
                    n = 'x="0" y="0" width="1" height="1"',
                    o = !0,
                    p = {
                        compress: !1
                    },
                    q = a.toCSS(p);
                switch (q) {
                case "to bottom":
                    e = 'x1="0%" y1="0%" x2="0%" y2="100%"';
                    break;
                case "to right":
                    e = 'x1="0%" y1="0%" x2="100%" y2="0%"';
                    break;
                case "to bottom right":
                    e = 'x1="0%" y1="0%" x2="100%" y2="100%"';
                    break;
                case "to top right":
                    e = 'x1="0%" y1="100%" x2="100%" y2="0%"';
                    break;
                case "ellipse":
                case "ellipse at center":
                    m = "radial", e = 'cx="50%" cy="50%" r="75%"', n = 'x="-50" y="-50" width="101" height="101"';
                    break;
                default:
                    throw {
                        type: "Argument",
                        message: "svg-gradient direction must be 'to bottom', 'to right', 'to bottom right', 'to top right' or 'ellipse at center'"
                    }
                }
                for (f = '<?xml version="1.0" ?><svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" viewBox="0 0 1 1" preserveAspectRatio="none"><' + m + 'Gradient id="gradient" gradientUnits="userSpaceOnUse" ' + e + ">", g = 0; g < l.length; g += 1) l[g].value ? (h = l[g].value[0], i = l[g].value[1]) : (h = l[g], i = b), h instanceof d.Color && ((0 === g || g + 1 === l.length) && i === b || i instanceof d.Dimension) || c(), j = i ? i.toCSS(p) : 0 === g ? "0%" : "100%", k = h.alpha, f += '<stop offset="' + j + '" stop-color="' + h.toRGB() + '"' + (1 > k ? ' stop-opacity="' + k + '"' : "") + "/>";
                if (f += "</" + m + "Gradient><rect " + n + ' fill="url(#gradient)" /></svg>', o) try {
                    f = new Buffer(f).toString("base64")
                } catch (r) {
                    o = !1
                }
                return f = "'data:image/svg+xml" + (o ? ";base64" : "") + "," + f + "'", new d.URL(new d.Anonymous(f))
            }
        }, d._mime = {
            _types: {
                ".htm": "text/html",
                ".html": "text/html",
                ".gif": "image/gif",
                ".jpg": "image/jpeg",
                ".jpeg": "image/jpeg",
                ".png": "image/png"
            },
            lookup: function (a) {
                var e = c("path").extname(a),
                    f = d._mime._types[e];
                if (f === b) throw new Error('Optional dependency "mime" is required for ' + e);
                return f
            },
            charsets: {
                lookup: function (a) {
                    return a && /^text\//.test(a) ? "UTF-8" : ""
                }
            }
        };
        var l = {
                ceil: null,
                floor: null,
                sqrt: null,
                abs: null,
                tan: "",
                sin: "",
                cos: "",
                atan: "rad",
                asin: "rad",
                acos: "rad"
            },
            m = {
                multiply: function (a, b) {
                    return a * b
                },
                screen: function (a, b) {
                    return a + b - a * b
                },
                overlay: function (a, b) {
                    return a *= 2, 1 >= a ? m.multiply(a, b) : m.screen(a - 1, b)
                },
                softlight: function (a, b) {
                    var c = 1,
                        d = a;
                    return b > .5 && (d = 1, c = a > .25 ? Math.sqrt(a) : ((16 * a - 12) * a + 4) * a), a - (1 - 2 * b) * d * (c - a)
                },
                hardlight: function (a, b) {
                    return m.overlay(b, a)
                },
                difference: function (a, b) {
                    return Math.abs(a - b)
                },
                exclusion: function (a, b) {
                    return a + b - 2 * a * b
                },
                average: function (a, b) {
                    return (a + b) / 2
                },
                negation: function (a, b) {
                    return 1 - Math.abs(a + b - 1)
                }
            };
        d.defaultFunc = {
            eval: function () {
                var a = this.value_,
                    b = this.error_;
                if (b) throw b;
                return null != a ? a ? d.True : d.False : void 0
            },
            value: function (a) {
                this.value_ = a
            },
            error: function (a) {
                this.error_ = a
            },
            reset: function () {
                this.value_ = this.error_ = null
            }
        }, g(), d.functionCall = function (a, b) {
            this.env = a, this.currentFileInfo = b
        }, d.functionCall.prototype = d.functions
    }(c("./tree")),
    function (a) {
        a.colors = {
            aliceblue: "#f0f8ff",
            antiquewhite: "#faebd7",
            aqua: "#00ffff",
            aquamarine: "#7fffd4",
            azure: "#f0ffff",
            beige: "#f5f5dc",
            bisque: "#ffe4c4",
            black: "#000000",
            blanchedalmond: "#ffebcd",
            blue: "#0000ff",
            blueviolet: "#8a2be2",
            brown: "#a52a2a",
            burlywood: "#deb887",
            cadetblue: "#5f9ea0",
            chartreuse: "#7fff00",
            chocolate: "#d2691e",
            coral: "#ff7f50",
            cornflowerblue: "#6495ed",
            cornsilk: "#fff8dc",
            crimson: "#dc143c",
            cyan: "#00ffff",
            darkblue: "#00008b",
            darkcyan: "#008b8b",
            darkgoldenrod: "#b8860b",
            darkgray: "#a9a9a9",
            darkgrey: "#a9a9a9",
            darkgreen: "#006400",
            darkkhaki: "#bdb76b",
            darkmagenta: "#8b008b",
            darkolivegreen: "#556b2f",
            darkorange: "#ff8c00",
            darkorchid: "#9932cc",
            darkred: "#8b0000",
            darksalmon: "#e9967a",
            darkseagreen: "#8fbc8f",
            darkslateblue: "#483d8b",
            darkslategray: "#2f4f4f",
            darkslategrey: "#2f4f4f",
            darkturquoise: "#00ced1",
            darkviolet: "#9400d3",
            deeppink: "#ff1493",
            deepskyblue: "#00bfff",
            dimgray: "#696969",
            dimgrey: "#696969",
            dodgerblue: "#1e90ff",
            firebrick: "#b22222",
            floralwhite: "#fffaf0",
            forestgreen: "#228b22",
            fuchsia: "#ff00ff",
            gainsboro: "#dcdcdc",
            ghostwhite: "#f8f8ff",
            gold: "#ffd700",
            goldenrod: "#daa520",
            gray: "#808080",
            grey: "#808080",
            green: "#008000",
            greenyellow: "#adff2f",
            honeydew: "#f0fff0",
            hotpink: "#ff69b4",
            indianred: "#cd5c5c",
            indigo: "#4b0082",
            ivory: "#fffff0",
            khaki: "#f0e68c",
            lavender: "#e6e6fa",
            lavenderblush: "#fff0f5",
            lawngreen: "#7cfc00",
            lemonchiffon: "#fffacd",
            lightblue: "#add8e6",
            lightcoral: "#f08080",
            lightcyan: "#e0ffff",
            lightgoldenrodyellow: "#fafad2",
            lightgray: "#d3d3d3",
            lightgrey: "#d3d3d3",
            lightgreen: "#90ee90",
            lightpink: "#ffb6c1",
            lightsalmon: "#ffa07a",
            lightseagreen: "#20b2aa",
            lightskyblue: "#87cefa",
            lightslategray: "#778899",
            lightslategrey: "#778899",
            lightsteelblue: "#b0c4de",
            lightyellow: "#ffffe0",
            lime: "#00ff00",
            limegreen: "#32cd32",
            linen: "#faf0e6",
            magenta: "#ff00ff",
            maroon: "#800000",
            mediumaquamarine: "#66cdaa",
            mediumblue: "#0000cd",
            mediumorchid: "#ba55d3",
            mediumpurple: "#9370d8",
            mediumseagreen: "#3cb371",
            mediumslateblue: "#7b68ee",
            mediumspringgreen: "#00fa9a",
            mediumturquoise: "#48d1cc",
            mediumvioletred: "#c71585",
            midnightblue: "#191970",
            mintcream: "#f5fffa",
            mistyrose: "#ffe4e1",
            moccasin: "#ffe4b5",
            navajowhite: "#ffdead",
            navy: "#000080",
            oldlace: "#fdf5e6",
            olive: "#808000",
            olivedrab: "#6b8e23",
            orange: "#ffa500",
            orangered: "#ff4500",
            orchid: "#da70d6",
            palegoldenrod: "#eee8aa",
            palegreen: "#98fb98",
            paleturquoise: "#afeeee",
            palevioletred: "#d87093",
            papayawhip: "#ffefd5",
            peachpuff: "#ffdab9",
            peru: "#cd853f",
            pink: "#ffc0cb",
            plum: "#dda0dd",
            powderblue: "#b0e0e6",
            purple: "#800080",
            red: "#ff0000",
            rosybrown: "#bc8f8f",
            royalblue: "#4169e1",
            saddlebrown: "#8b4513",
            salmon: "#fa8072",
            sandybrown: "#f4a460",
            seagreen: "#2e8b57",
            seashell: "#fff5ee",
            sienna: "#a0522d",
            silver: "#c0c0c0",
            skyblue: "#87ceeb",
            slateblue: "#6a5acd",
            slategray: "#708090",
            slategrey: "#708090",
            snow: "#fffafa",
            springgreen: "#00ff7f",
            steelblue: "#4682b4",
            tan: "#d2b48c",
            teal: "#008080",
            thistle: "#d8bfd8",
            tomato: "#ff6347",
            turquoise: "#40e0d0",
            violet: "#ee82ee",
            wheat: "#f5deb3",
            white: "#ffffff",
            whitesmoke: "#f5f5f5",
            yellow: "#ffff00",
            yellowgreen: "#9acd32"
        }
    }(c("./tree")),
    function (a) {
        a.debugInfo = function (b, c, d) {
            var e = "";
            if (b.dumpLineNumbers && !b.compress) switch (b.dumpLineNumbers) {
            case "comments":
                e = a.debugInfo.asComment(c);
                break;
            case "mediaquery":
                e = a.debugInfo.asMediaQuery(c);
                break;
            case "all":
                e = a.debugInfo.asComment(c) + (d || "") + a.debugInfo.asMediaQuery(c)
            }
            return e
        }, a.debugInfo.asComment = function (a) {
            return "/* line " + a.debugInfo.lineNumber + ", " + a.debugInfo.fileName + " */\n"
        }, a.debugInfo.asMediaQuery = function (a) {
            return "@media -sass-debug-info{filename{font-family:" + ("file://" + a.debugInfo.fileName).replace(/([.:/\\])/g, function (a) {
                return "\\" == a && (a = "/"), "\\" + a
            }) + "}line{font-family:\\00003" + a.debugInfo.lineNumber + "}}\n"
        }, a.find = function (a, b) {
            for (var c, d = 0; d < a.length; d++)
                if (c = b.call(a, a[d])) return c;
            return null
        }, a.jsify = function (a) {
            return Array.isArray(a.value) && a.value.length > 1 ? "[" + a.value.map(function (a) {
                return a.toCSS(!1)
            }).join(", ") + "]" : a.toCSS(!1)
        }, a.toCSS = function (a) {
            var b = [];
            return this.genCSS(a, {
                add: function (a) {
                    b.push(a)
                },
                isEmpty: function () {
                    return 0 === b.length
                }
            }), b.join("")
        }, a.outputRuleset = function (a, b, c) {
            var d, e = c.length;
            if (a.tabLevel = (0 | a.tabLevel) + 1, a.compress) {
                for (b.add("{"), d = 0; e > d; d++) c[d].genCSS(a, b);
                return b.add("}"), a.tabLevel--, void 0
            }
            var f = "\n" + Array(a.tabLevel).join("  "),
                g = f + "  ";
            if (e) {
                for (b.add(" {" + g), c[0].genCSS(a, b), d = 1; e > d; d++) b.add(g), c[d].genCSS(a, b);
                b.add(f + "}")
            } else b.add(" {" + f + "}");
            a.tabLevel--
        }
    }(c("./tree")),
    function (a) {
        a.Alpha = function (a) {
            this.value = a
        }, a.Alpha.prototype = {
            type: "Alpha",
            accept: function (a) {
                this.value = a.visit(this.value)
            },
            eval: function (b) {
                return this.value.eval ? new a.Alpha(this.value.eval(b)) : this
            },
            genCSS: function (a, b) {
                b.add("alpha(opacity="), this.value.genCSS ? this.value.genCSS(a, b) : b.add(this.value), b.add(")")
            },
            toCSS: a.toCSS
        }
    }(c("../tree")),
    function (a) {
        a.Anonymous = function (a, b, c, d) {
            this.value = a.value || a, this.index = b, this.mapLines = d, this.currentFileInfo = c
        }, a.Anonymous.prototype = {
            type: "Anonymous",
            eval: function () {
                return new a.Anonymous(this.value, this.index, this.currentFileInfo, this.mapLines)
            },
            compare: function (a) {
                if (!a.toCSS) return -1;
                var b = this.toCSS(),
                    c = a.toCSS();
                return b === c ? 0 : c > b ? -1 : 1
            },
            genCSS: function (a, b) {
                b.add(this.value, this.currentFileInfo, this.index, this.mapLines)
            },
            toCSS: a.toCSS
        }
    }(c("../tree")),
    function (a) {
        a.Assignment = function (a, b) {
            this.key = a, this.value = b
        }, a.Assignment.prototype = {
            type: "Assignment",
            accept: function (a) {
                this.value = a.visit(this.value)
            },
            eval: function (b) {
                return this.value.eval ? new a.Assignment(this.key, this.value.eval(b)) : this
            },
            genCSS: function (a, b) {
                b.add(this.key + "="), this.value.genCSS ? this.value.genCSS(a, b) : b.add(this.value)
            },
            toCSS: a.toCSS
        }
    }(c("../tree")),
    function (a) {
        a.Call = function (a, b, c, d) {
            this.name = a, this.args = b, this.index = c, this.currentFileInfo = d
        }, a.Call.prototype = {
            type: "Call",
            accept: function (a) {
                this.args && (this.args = a.visitArray(this.args))
            },
            eval: function (b) {
                var c, d, e = this.args.map(function (a) {
                        return a.eval(b)
                    }),
                    f = this.name.toLowerCase();
                if (f in a.functions) try {
                    if (d = new a.functionCall(b, this.currentFileInfo), c = d[f].apply(d, e), null != c) return c
                } catch (g) {
                    throw {
                        type: g.type || "Runtime",
                        message: "error evaluating function `" + this.name + "`" + (g.message ? ": " + g.message : ""),
                        index: this.index,
                        filename: this.currentFileInfo.filename
                    }
                }
                return new a.Call(this.name, e, this.index, this.currentFileInfo)
            },
            genCSS: function (a, b) {
                b.add(this.name + "(", this.currentFileInfo, this.index);
                for (var c = 0; c < this.args.length; c++) this.args[c].genCSS(a, b), c + 1 < this.args.length && b.add(", ");
                b.add(")")
            },
            toCSS: a.toCSS
        }
    }(c("../tree")),
    function (a) {
        function b(a) {
            return "#" + a.map(function (a) {
                return a = c(Math.round(a), 255), (16 > a ? "0" : "") + a.toString(16)
            }).join("")
        }

        function c(a, b) {
            return Math.min(Math.max(a, 0), b)
        }
        a.Color = function (a, b) {
            this.rgb = Array.isArray(a) ? a : 6 == a.length ? a.match(/.{2}/g).map(function (a) {
                return parseInt(a, 16)
            }) : a.split("").map(function (a) {
                return parseInt(a + a, 16)
            }), this.alpha = "number" == typeof b ? b : 1
        };
        var d = "transparent";
        a.Color.prototype = {
            type: "Color",
            eval: function () {
                return this
            },
            luma: function () {
                return .2126 * this.rgb[0] / 255 + .7152 * this.rgb[1] / 255 + .0722 * this.rgb[2] / 255
            },
            genCSS: function (a, b) {
                b.add(this.toCSS(a))
            },
            toCSS: function (a, b) {
                var e = a && a.compress && !b;
                if (this.alpha < 1) return 0 === this.alpha && this.isTransparentKeyword ? d : "rgba(" + this.rgb.map(function (a) {
                    return c(Math.round(a), 255)
                }).concat(c(this.alpha, 1)).join("," + (e ? "" : " ")) + ")";
                var f = this.toRGB();
                if (e) {
                    var g = f.split("");
                    g[1] === g[2] && g[3] === g[4] && g[5] === g[6] && (f = "#" + g[1] + g[3] + g[5])
                }
                return f
            },
            operate: function (b, c, d) {
                for (var e = [], f = this.alpha * (1 - d.alpha) + d.alpha, g = 0; 3 > g; g++) e[g] = a.operate(b, c, this.rgb[g], d.rgb[g]);
                return new a.Color(e, f)
            },
            toRGB: function () {
                return b(this.rgb)
            },
            toHSL: function () {
                var a, b, c = this.rgb[0] / 255,
                    d = this.rgb[1] / 255,
                    e = this.rgb[2] / 255,
                    f = this.alpha,
                    g = Math.max(c, d, e),
                    h = Math.min(c, d, e),
                    i = (g + h) / 2,
                    j = g - h;
                if (g === h) a = b = 0;
                else {
                    switch (b = i > .5 ? j / (2 - g - h) : j / (g + h), g) {
                    case c:
                        a = (d - e) / j + (e > d ? 6 : 0);
                        break;
                    case d:
                        a = (e - c) / j + 2;
                        break;
                    case e:
                        a = (c - d) / j + 4
                    }
                    a /= 6
                }
                return {
                    h: 360 * a,
                    s: b,
                    l: i,
                    a: f
                }
            },
            toHSV: function () {
                var a, b, c = this.rgb[0] / 255,
                    d = this.rgb[1] / 255,
                    e = this.rgb[2] / 255,
                    f = this.alpha,
                    g = Math.max(c, d, e),
                    h = Math.min(c, d, e),
                    i = g,
                    j = g - h;
                if (b = 0 === g ? 0 : j / g, g === h) a = 0;
                else {
                    switch (g) {
                    case c:
                        a = (d - e) / j + (e > d ? 6 : 0);
                        break;
                    case d:
                        a = (e - c) / j + 2;
                        break;
                    case e:
                        a = (c - d) / j + 4
                    }
                    a /= 6
                }
                return {
                    h: 360 * a,
                    s: b,
                    v: i,
                    a: f
                }
            },
            toARGB: function () {
                return b([255 * this.alpha].concat(this.rgb))
            },
            compare: function (a) {
                return a.rgb ? a.rgb[0] === this.rgb[0] && a.rgb[1] === this.rgb[1] && a.rgb[2] === this.rgb[2] && a.alpha === this.alpha ? 0 : -1 : -1
            }
        }, a.Color.fromKeyword = function (b) {
            if (a.colors.hasOwnProperty(b)) return new a.Color(a.colors[b].slice(1));
            if (b === d) {
                var c = new a.Color([0, 0, 0], 0);
                return c.isTransparentKeyword = !0, c
            }
        }
    }(c("../tree")),
    function (a) {
        a.Comment = function (a, b, c, d) {
            this.value = a, this.silent = !!b, this.currentFileInfo = d
        }, a.Comment.prototype = {
            type: "Comment",
            genCSS: function (b, c) {
                this.debugInfo && c.add(a.debugInfo(b, this), this.currentFileInfo, this.index), c.add(this.value.trim())
            },
            toCSS: a.toCSS,
            isSilent: function (a) {
                var b = this.currentFileInfo && this.currentFileInfo.reference && !this.isReferenced,
                    c = a.compress && !this.value.match(/^\/\*!/);
                return this.silent || b || c
            },
            eval: function () {
                return this
            },
            markReferenced: function () {
                this.isReferenced = !0
            }
        }
    }(c("../tree")),
    function (a) {
        a.Condition = function (a, b, c, d, e) {
            this.op = a.trim(), this.lvalue = b, this.rvalue = c, this.index = d, this.negate = e
        }, a.Condition.prototype = {
            type: "Condition",
            accept: function (a) {
                this.lvalue = a.visit(this.lvalue), this.rvalue = a.visit(this.rvalue)
            },
            eval: function (a) {
                var b, c = this.lvalue.eval(a),
                    d = this.rvalue.eval(a),
                    e = this.index;
                return b = function (a) {
                    switch (a) {
                    case "and":
                        return c && d;
                    case "or":
                        return c || d;
                    default:
                        if (c.compare) b = c.compare(d);
                        else {
                            if (!d.compare) throw {
                                type: "Type",
                                message: "Unable to perform comparison",
                                index: e
                            };
                            b = d.compare(c)
                        }
                        switch (b) {
                        case -1:
                            return "<" === a || "=<" === a || "<=" === a;
                        case 0:
                            return "=" === a || ">=" === a || "=<" === a || "<=" === a;
                        case 1:
                            return ">" === a || ">=" === a
                        }
                    }
                }(this.op), this.negate ? !b : b
            }
        }
    }(c("../tree")),
    function (a) {
        a.Dimension = function (c, d) {
            this.value = parseFloat(c), this.unit = d && d instanceof a.Unit ? d : new a.Unit(d ? [d] : b)
        }, a.Dimension.prototype = {
            type: "Dimension",
            accept: function (a) {
                this.unit = a.visit(this.unit)
            },
            eval: function () {
                return this
            },
            toColor: function () {
                return new a.Color([this.value, this.value, this.value])
            },
            genCSS: function (a, b) {
                if (a && a.strictUnits && !this.unit.isSingular()) throw new Error("Multiple units in dimension. Correct the units or use the unit function. Bad unit: " + this.unit.toString());
                var c = this.value,
                    d = String(c);
                if (0 !== c && 1e-6 > c && c > -1e-6 && (d = c.toFixed(20).replace(/0+$/, "")), a && a.compress) {
                    if (0 === c && this.unit.isLength()) return b.add(d), void 0;
                    c > 0 && 1 > c && (d = d.substr(1))
                }
                b.add(d), this.unit.genCSS(a, b)
            },
            toCSS: a.toCSS,
            operate: function (b, c, d) {
                var e = a.operate(b, c, this.value, d.value),
                    f = this.unit.clone();
                if ("+" === c || "-" === c)
                    if (0 === f.numerator.length && 0 === f.denominator.length) f.numerator = d.unit.numerator.slice(0), f.denominator = d.unit.denominator.slice(0);
                    else if (0 === d.unit.numerator.length && 0 === f.denominator.length);
                else {
                    if (d = d.convertTo(this.unit.usedUnits()), b.strictUnits && d.unit.toString() !== f.toString()) throw new Error("Incompatible units. Change the units or use the unit function. Bad units: '" + f.toString() + "' and '" + d.unit.toString() + "'.");
                    e = a.operate(b, c, this.value, d.value)
                } else "*" === c ? (f.numerator = f.numerator.concat(d.unit.numerator).sort(), f.denominator = f.denominator.concat(d.unit.denominator).sort(), f.cancel()) : "/" === c && (f.numerator = f.numerator.concat(d.unit.denominator).sort(), f.denominator = f.denominator.concat(d.unit.numerator).sort(), f.cancel());
                return new a.Dimension(e, f)
            },
            compare: function (b) {
                if (b instanceof a.Dimension) {
                    var c = this.unify(),
                        d = b.unify(),
                        e = c.value,
                        f = d.value;
                    return f > e ? -1 : e > f ? 1 : d.unit.isEmpty() || 0 === c.unit.compare(d.unit) ? 0 : -1
                }
                return -1
            },
            unify: function () {
                return this.convertTo({
                    length: "m",
                    duration: "s",
                    angle: "rad"
                })
            },
            convertTo: function (b) {
                var c, d, e, f, g, h = this.value,
                    i = this.unit.clone(),
                    j = {};
                if ("string" == typeof b) {
                    for (c in a.UnitConversions) a.UnitConversions[c].hasOwnProperty(b) && (j = {}, j[c] = b);
                    b = j
                }
                g = function (a, b) {
                    return e.hasOwnProperty(a) ? (b ? h /= e[a] / e[f] : h *= e[a] / e[f], f) : a
                };
                for (d in b) b.hasOwnProperty(d) && (f = b[d], e = a.UnitConversions[d], i.map(g));
                return i.cancel(), new a.Dimension(h, i)
            }
        }, a.UnitConversions = {
            length: {
                m: 1,
                cm: .01,
                mm: .001,
                "in": .0254,
                pt: .0254 / 72,
                pc: .0254 / 72 * 12
            },
            duration: {
                s: 1,
                ms: .001
            },
            angle: {
                rad: 1 / (2 * Math.PI),
                deg: 1 / 360,
                grad: .0025,
                turn: 1
            }
        }, a.Unit = function (a, b, c) {
            this.numerator = a ? a.slice(0).sort() : [], this.denominator = b ? b.slice(0).sort() : [], this.backupUnit = c
        }, a.Unit.prototype = {
            type: "Unit",
            clone: function () {
                return new a.Unit(this.numerator.slice(0), this.denominator.slice(0), this.backupUnit)
            },
            genCSS: function (a, b) {
                this.numerator.length >= 1 ? b.add(this.numerator[0]) : this.denominator.length >= 1 ? b.add(this.denominator[0]) : a && a.strictUnits || !this.backupUnit || b.add(this.backupUnit)
            },
            toCSS: a.toCSS,
            toString: function () {
                var a, b = this.numerator.join("*");
                for (a = 0; a < this.denominator.length; a++) b += "/" + this.denominator[a];
                return b
            },
            compare: function (a) {
                return this.is(a.toString()) ? 0 : -1
            },
            is: function (a) {
                return this.toString() === a
            },
            isLength: function () {
                return Boolean(this.toCSS().match(/px|em|%|in|cm|mm|pc|pt|ex/))
            },
            isEmpty: function () {
                return 0 === this.numerator.length && 0 === this.denominator.length
            },
            isSingular: function () {
                return this.numerator.length <= 1 && 0 === this.denominator.length
            },
            map: function (a) {
                var b;
                for (b = 0; b < this.numerator.length; b++) this.numerator[b] = a(this.numerator[b], !1);
                for (b = 0; b < this.denominator.length; b++) this.denominator[b] = a(this.denominator[b], !0)
            },
            usedUnits: function () {
                var b, c, d = {};
                c = function (a) {
                    return b.hasOwnProperty(a) && !d[e] && (d[e] = a), a
                };
                for (var e in a.UnitConversions) a.UnitConversions.hasOwnProperty(e) && (b = a.UnitConversions[e], this.map(c));
                return d
            },
            cancel: function () {
                var a, b, c, d = {};
                for (b = 0; b < this.numerator.length; b++) a = this.numerator[b], c || (c = a), d[a] = (d[a] || 0) + 1;
                for (b = 0; b < this.denominator.length; b++) a = this.denominator[b], c || (c = a), d[a] = (d[a] || 0) - 1;
                this.numerator = [], this.denominator = [];
                for (a in d)
                    if (d.hasOwnProperty(a)) {
                        var e = d[a];
                        if (e > 0)
                            for (b = 0; e > b; b++) this.numerator.push(a);
                        else if (0 > e)
                            for (b = 0; - e > b; b++) this.denominator.push(a)
                    }
                0 === this.numerator.length && 0 === this.denominator.length && c && (this.backupUnit = c), this.numerator.sort(), this.denominator.sort()
            }
        }
    }(c("../tree")),
    function (a) {
        a.Directive = function (b, c, d, e) {
            this.name = b, Array.isArray(c) ? (this.rules = [new a.Ruleset(null, c)], this.rules[0].allowImports = !0) : this.value = c, this.currentFileInfo = e
        }, a.Directive.prototype = {
            type: "Directive",
            accept: function (a) {
                this.rules && (this.rules = a.visitArray(this.rules)), this.value && (this.value = a.visit(this.value))
            },
            genCSS: function (b, c) {
                c.add(this.name, this.currentFileInfo, this.index), this.rules ? a.outputRuleset(b, c, this.rules) : (c.add(" "), this.value.genCSS(b, c), c.add(";"))
            },
            toCSS: a.toCSS,
            eval: function (b) {
                var c = this;
                return this.rules && (b.frames.unshift(this), c = new a.Directive(this.name, null, this.index, this.currentFileInfo), c.rules = [this.rules[0].eval(b)], c.rules[0].root = !0, b.frames.shift()), c
            },
            variable: function (b) {
                return a.Ruleset.prototype.variable.call(this.rules[0], b)
            },
            find: function () {
                return a.Ruleset.prototype.find.apply(this.rules[0], arguments)
            },
            rulesets: function () {
                return a.Ruleset.prototype.rulesets.apply(this.rules[0])
            },
            markReferenced: function () {
                var a, b;
                if (this.isReferenced = !0, this.rules)
                    for (b = this.rules[0].rules, a = 0; a < b.length; a++) b[a].markReferenced && b[a].markReferenced()
            }
        }
    }(c("../tree")),
    function (a) {
        a.Element = function (b, c, d, e) {
            this.combinator = b instanceof a.Combinator ? b : new a.Combinator(b), this.value = "string" == typeof c ? c.trim() : c ? c : "", this.index = d, this.currentFileInfo = e
        }, a.Element.prototype = {
            type: "Element",
            accept: function (a) {
                var b = this.value;
                this.combinator = a.visit(this.combinator), "object" == typeof b && (this.value = a.visit(b))
            },
            eval: function (b) {
                return new a.Element(this.combinator, this.value.eval ? this.value.eval(b) : this.value, this.index, this.currentFileInfo)
            },
            genCSS: function (a, b) {
                b.add(this.toCSS(a), this.currentFileInfo, this.index)
            },
            toCSS: function (a) {
                var b = this.value.toCSS ? this.value.toCSS(a) : this.value;
                return "" === b && "&" === this.combinator.value.charAt(0) ? "" : this.combinator.toCSS(a || {}) + b
            }
        }, a.Attribute = function (a, b, c) {
            this.key = a, this.op = b, this.value = c
        }, a.Attribute.prototype = {
            type: "Attribute",
            eval: function (b) {
                return new a.Attribute(this.key.eval ? this.key.eval(b) : this.key, this.op, this.value && this.value.eval ? this.value.eval(b) : this.value)
            },
            genCSS: function (a, b) {
                b.add(this.toCSS(a))
            },
            toCSS: function (a) {
                var b = this.key.toCSS ? this.key.toCSS(a) : this.key;
                return this.op && (b += this.op, b += this.value.toCSS ? this.value.toCSS(a) : this.value), "[" + b + "]"
            }
        }, a.Combinator = function (a) {
            this.value = " " === a ? " " : a ? a.trim() : ""
        }, a.Combinator.prototype = {
            type: "Combinator",
            _outputMap: {
                "": "",
                " ": " ",
                ":": " :",
                "+": " + ",
                "~": " ~ ",
                ">": " > ",
                "|": "|"
            },
            _outputMapCompressed: {
                "": "",
                " ": " ",
                ":": " :",
                "+": "+",
                "~": "~",
                ">": ">",
                "|": "|"
            },
            genCSS: function (a, b) {
                b.add((a.compress ? this._outputMapCompressed : this._outputMap)[this.value])
            },
            toCSS: a.toCSS
        }
    }(c("../tree")),
    function (a) {
        a.Expression = function (a) {
            this.value = a
        }, a.Expression.prototype = {
            type: "Expression",
            accept: function (a) {
                this.value && (this.value = a.visitArray(this.value))
            },
            eval: function (b) {
                var c, d = this.parens && !this.parensInOp,
                    e = !1;
                return d && b.inParenthesis(), this.value.length > 1 ? c = new a.Expression(this.value.map(function (a) {
                    return a.eval(b)
                })) : 1 === this.value.length ? (this.value[0].parens && !this.value[0].parensInOp && (e = !0), c = this.value[0].eval(b)) : c = this, d && b.outOfParenthesis(), this.parens && this.parensInOp && !b.isMathOn() && !e && (c = new a.Paren(c)), c
            },
            genCSS: function (a, b) {
                for (var c = 0; c < this.value.length; c++) this.value[c].genCSS(a, b), c + 1 < this.value.length && b.add(" ")
            },
            toCSS: a.toCSS,
            throwAwayComments: function () {
                this.value = this.value.filter(function (b) {
                    return !(b instanceof a.Comment)
                })
            }
        }
    }(c("../tree")),
    function (a) {
        a.Extend = function (b, c, d) {
            switch (this.selector = b, this.option = c, this.index = d, this.object_id = a.Extend.next_id++, this.parent_ids = [this.object_id], c) {
            case "all":
                this.allowBefore = !0, this.allowAfter = !0;
                break;
            default:
                this.allowBefore = !1, this.allowAfter = !1
            }
        }, a.Extend.next_id = 0, a.Extend.prototype = {
            type: "Extend",
            accept: function (a) {
                this.selector = a.visit(this.selector)
            },
            eval: function (b) {
                return new a.Extend(this.selector.eval(b), this.option, this.index)
            },
            clone: function () {
                return new a.Extend(this.selector, this.option, this.index)
            },
            findSelfSelectors: function (a) {
                var b, c, d = [];
                for (b = 0; b < a.length; b++) c = a[b].elements, b > 0 && c.length && "" === c[0].combinator.value && (c[0].combinator.value = " "), d = d.concat(a[b].elements);
                this.selfSelectors = [{
                    elements: d
                }]
            }
        }
    }(c("../tree")),
    function (a) {
        a.Import = function (a, c, d, e, f) {
            if (this.options = d, this.index = e, this.path = a, this.features = c, this.currentFileInfo = f, this.options.less !== b || this.options.inline) this.css = !this.options.less || this.options.inline;
            else {
                var g = this.getPath();
                g && /css([\?;].*)?$/.test(g) && (this.css = !0)
            }
        }, a.Import.prototype = {
            type: "Import",
            accept: function (a) {
                this.features && (this.features = a.visit(this.features)), this.path = a.visit(this.path), !this.options.inline && this.root && (this.root = a.visit(this.root))
            },
            genCSS: function (a, b) {
                this.css && (b.add("@import ", this.currentFileInfo, this.index), this.path.genCSS(a, b), this.features && (b.add(" "), this.features.genCSS(a, b)), b.add(";"))
            },
            toCSS: a.toCSS,
            getPath: function () {
                if (this.path instanceof a.Quoted) {
                    var c = this.path.value;
                    return this.css !== b || /(\.[a-z]*$)|([\?;].*)$/.test(c) ? c : c + ".less"
                }
                return this.path instanceof a.URL ? this.path.value.value : null
            },
            evalForImport: function (b) {
                return new a.Import(this.path.eval(b), this.features, this.options, this.index, this.currentFileInfo)
            },
            evalPath: function (b) {
                var c = this.path.eval(b),
                    d = this.currentFileInfo && this.currentFileInfo.rootpath;
                if (!(c instanceof a.URL)) {
                    if (d) {
                        var e = c.value;
                        e && b.isPathRelative(e) && (c.value = d + e)
                    }
                    c.value = b.normalizePath(c.value)
                }
                return c
            },
            eval: function (b) {
                var c, d = this.features && this.features.eval(b);
                if (this.skip) return [];
                if (this.options.inline) {
                    var e = new a.Anonymous(this.root, 0, {
                        filename: this.importedFilename
                    }, !0);
                    return this.features ? new a.Media([e], this.features.value) : [e]
                }
                if (this.css) {
                    var f = new a.Import(this.evalPath(b), d, this.options, this.index);
                    if (!f.css && this.error) throw this.error;
                    return f
                }
                return c = new a.Ruleset(null, this.root.rules.slice(0)), c.evalImports(b), this.features ? new a.Media(c.rules, this.features.value) : c.rules
            }
        }
    }(c("../tree")),
    function (a) {
        a.JavaScript = function (a, b, c) {
            this.escaped = c, this.expression = a, this.index = b
        }, a.JavaScript.prototype = {
            type: "JavaScript",
            eval: function (b) {
                var c, d = this,
                    e = {},
                    f = this.expression.replace(/@\{([\w-]+)\}/g, function (c, e) {
                        return a.jsify(new a.Variable("@" + e, d.index).eval(b))
                    });
                try {
                    f = new Function("return (" + f + ")")
                } catch (g) {
                    throw {
                        message: "JavaScript evaluation error: " + g.message + " from `" + f + "`",
                        index: this.index
                    }
                }
                for (var h in b.frames[0].variables()) e[h.slice(1)] = {
                    value: b.frames[0].variables()[h].value,
                    toJS: function () {
                        return this.value.eval(b).toCSS()
                    }
                };
                try {
                    c = f.call(e)
                } catch (g) {
                    throw {
                        message: "JavaScript evaluation error: '" + g.name + ": " + g.message + "'",
                        index: this.index
                    }
                }
                return "number" == typeof c ? new a.Dimension(c) : "string" == typeof c ? new a.Quoted('"' + c + '"', c, this.escaped, this.index) : Array.isArray(c) ? new a.Anonymous(c.join(", ")) : new a.Anonymous(c)
            }
        }
    }(c("../tree")),
    function (a) {
        a.Keyword = function (a) {
            this.value = a
        }, a.Keyword.prototype = {
            type: "Keyword",
            eval: function () {
                return this
            },
            genCSS: function (a, b) {
                b.add(this.value)
            },
            toCSS: a.toCSS,
            compare: function (b) {
                return b instanceof a.Keyword ? b.value === this.value ? 0 : 1 : -1
            }
        }, a.True = new a.Keyword("true"), a.False = new a.Keyword("false")
    }(c("../tree")),
    function (a) {
        a.Media = function (b, c, d, e) {
            this.index = d, this.currentFileInfo = e;
            var f = this.emptySelectors();
            this.features = new a.Value(c), this.rules = [new a.Ruleset(f, b)], this.rules[0].allowImports = !0
        }, a.Media.prototype = {
            type: "Media",
            accept: function (a) {
                this.features && (this.features = a.visit(this.features)), this.rules && (this.rules = a.visitArray(this.rules))
            },
            genCSS: function (b, c) {
                c.add("@media ", this.currentFileInfo, this.index), this.features.genCSS(b, c), a.outputRuleset(b, c, this.rules)
            },
            toCSS: a.toCSS,
            eval: function (b) {
                b.mediaBlocks || (b.mediaBlocks = [], b.mediaPath = []);
                var c = new a.Media(null, [], this.index, this.currentFileInfo);
                this.debugInfo && (this.rules[0].debugInfo = this.debugInfo, c.debugInfo = this.debugInfo);
                var d = !1;
                b.strictMath || (d = !0, b.strictMath = !0);
                try {
                    c.features = this.features.eval(b)
                } finally {
                    d && (b.strictMath = !1)
                }
                return b.mediaPath.push(c), b.mediaBlocks.push(c), b.frames.unshift(this.rules[0]), c.rules = [this.rules[0].eval(b)], b.frames.shift(), b.mediaPath.pop(), 0 === b.mediaPath.length ? c.evalTop(b) : c.evalNested(b)
            },
            variable: function (b) {
                return a.Ruleset.prototype.variable.call(this.rules[0], b)
            },
            find: function () {
                return a.Ruleset.prototype.find.apply(this.rules[0], arguments)
            },
            rulesets: function () {
                return a.Ruleset.prototype.rulesets.apply(this.rules[0])
            },
            emptySelectors: function () {
                var b = new a.Element("", "&", this.index, this.currentFileInfo);
                return [new a.Selector([b], null, null, this.index, this.currentFileInfo)]
            },
            markReferenced: function () {
                var a, b = this.rules[0].rules;
                for (this.isReferenced = !0, a = 0; a < b.length; a++) b[a].markReferenced && b[a].markReferenced()
            },
            evalTop: function (b) {
                var c = this;
                if (b.mediaBlocks.length > 1) {
                    var d = this.emptySelectors();
                    c = new a.Ruleset(d, b.mediaBlocks), c.multiMedia = !0
                }
                return delete b.mediaBlocks, delete b.mediaPath, c
            },
            evalNested: function (b) {
                var c, d, e = b.mediaPath.concat([this]);
                for (c = 0; c < e.length; c++) d = e[c].features instanceof a.Value ? e[c].features.value : e[c].features, e[c] = Array.isArray(d) ? d : [d];
                return this.features = new a.Value(this.permute(e).map(function (b) {
                    for (b = b.map(function (b) {
                        return b.toCSS ? b : new a.Anonymous(b)
                    }), c = b.length - 1; c > 0; c--) b.splice(c, 0, new a.Anonymous("and"));
                    return new a.Expression(b)
                })), new a.Ruleset([], [])
            },
            permute: function (a) {
                if (0 === a.length) return [];
                if (1 === a.length) return a[0];
                for (var b = [], c = this.permute(a.slice(1)), d = 0; d < c.length; d++)
                    for (var e = 0; e < a[0].length; e++) b.push([a[0][e]].concat(c[d]));
                return b
            },
            bubbleSelectors: function (b) {
                this.rules = [new a.Ruleset(b.slice(0), [this.rules[0]])]
            }
        }
    }(c("../tree")),
    function (a) {
        a.mixin = {}, a.mixin.Call = function (b, c, d, e, f) {
            this.selector = new a.Selector(b), this.arguments = c && c.length ? c : null, this.index = d, this.currentFileInfo = e, this.important = f
        }, a.mixin.Call.prototype = {
            type: "MixinCall",
            accept: function (a) {
                this.selector && (this.selector = a.visit(this.selector)), this.arguments && (this.arguments = a.visitArray(this.arguments))
            },
            eval: function (b) {
                var c, d, e, f, g, h, i, j, k, l, m = [],
                    n = !1,
                    o = [],
                    p = [],
                    q = a.defaultFunc,
                    r = !1;
                for (e = this.arguments && this.arguments.map(function (a) {
                    return {
                        name: a.name,
                        value: a.value.eval(b)
                    }
                }), f = 0; f < b.frames.length; f++)
                    if ((c = b.frames[f].find(this.selector)).length > 0) {
                        for (j = !0, g = 0; g < c.length; g++) {
                            for (d = c[g], i = !1, h = 0; h < b.frames.length; h++)
                                if (!(d instanceof a.mixin.Definition) && d === (b.frames[h].originalRuleset || b.frames[h])) {
                                    i = !0;
                                    break
                                }
                            if (!i && d.matchArgs(e, b)) {
                                if (l = {
                                    mixin: d
                                }, d.matchCondition) {
                                    for (h = 0; 2 > h; h++) q.value(h), p[h] = d.matchCondition(e, b);
                                    if (p[0] || p[1]) {
                                        if (p[0] != p[1]) {
                                            if (r) throw {
                                                type: "Runtime",
                                                message: "Ambiguous use of `default()` found when matching for `" + this.format(e) + "`",
                                                index: this.index,
                                                filename: this.currentFileInfo.filename
                                            };
                                            r = !0, l.matchIfDefault = !0, l.matchIfDefaultValue = p[1]
                                        }
                                        o.push(l)
                                    }
                                } else o.push(l);
                                n = !0
                            }
                        }
                        q.reset();
                        for (g in o)
                            if (l = o[g], !l.matchIfDefault || l.matchIfDefaultValue == (1 == o.length)) try {
                                d = l.mixin, d instanceof a.mixin.Definition || (d = new a.mixin.Definition("", [], d.rules, null, !1), d.originalRuleset = c[g].originalRuleset || c[g]), Array.prototype.push.apply(m, d.eval(b, e, this.important).rules)
                            } catch (s) {
                                throw {
                                    message: s.message,
                                    index: this.index,
                                    filename: this.currentFileInfo.filename,
                                    stack: s.stack
                                }
                            }
                            if (n) {
                                if (!this.currentFileInfo || !this.currentFileInfo.reference)
                                    for (f = 0; f < m.length; f++) k = m[f], k.markReferenced && k.markReferenced();
                                return m
                            }
                    }
                throw j ? {
                    type: "Runtime",
                    message: "No matching definition was found for `" + this.format(e) + "`",
                    index: this.index,
                    filename: this.currentFileInfo.filename
                } : {
                    type: "Name",
                    message: this.selector.toCSS().trim() + " is undefined",
                    index: this.index,
                    filename: this.currentFileInfo.filename
                }
            },
            format: function (a) {
                return this.selector.toCSS().trim() + "(" + (a ? a.map(function (a) {
                    var b = "";
                    return a.name && (b += a.name + ":"), b += a.value.toCSS ? a.value.toCSS() : "???"
                }).join(", ") : "") + ")"
            }
        }, a.mixin.Definition = function (b, c, d, e, f) {
            this.name = b, this.selectors = [new a.Selector([new a.Element(null, b, this.index, this.currentFileInfo)])], this.params = c, this.condition = e, this.variadic = f, this.arity = c.length, this.rules = d, this._lookups = {}, this.required = c.reduce(function (a, b) {
                return !b.name || b.name && !b.value ? a + 1 : a
            }, 0), this.parent = a.Ruleset.prototype, this.frames = []
        }, a.mixin.Definition.prototype = {
            type: "MixinDefinition",
            accept: function (a) {
                this.params && this.params.length && (this.params = a.visitArray(this.params)), this.rules = a.visitArray(this.rules), this.condition && (this.condition = a.visit(this.condition))
            },
            variable: function (a) {
                return this.parent.variable.call(this, a)
            },
            variables: function () {
                return this.parent.variables.call(this)
            },
            find: function () {
                return this.parent.find.apply(this, arguments)
            },
            rulesets: function () {
                return this.parent.rulesets.apply(this)
            },
            evalParams: function (b, c, d, e) {
                var f, g, h, i, j, k, l, m, n = new a.Ruleset(null, null),
                    o = this.params.slice(0);
                if (c = new a.evalEnv(c, [n].concat(c.frames)), d)
                    for (d = d.slice(0), h = 0; h < d.length; h++)
                        if (g = d[h], k = g && g.name) {
                            for (l = !1, i = 0; i < o.length; i++)
                                if (!e[i] && k === o[i].name) {
                                    e[i] = g.value.eval(b), n.prependRule(new a.Rule(k, g.value.eval(b))), l = !0;
                                    break
                                }
                            if (l) {
                                d.splice(h, 1), h--;
                                continue
                            }
                            throw {
                                type: "Runtime",
                                message: "Named argument for " + this.name + " " + d[h].name + " not found"
                            }
                        }
                for (m = 0, h = 0; h < o.length; h++)
                    if (!e[h]) {
                        if (g = d && d[m], k = o[h].name)
                            if (o[h].variadic && d) {
                                for (f = [], i = m; i < d.length; i++) f.push(d[i].value.eval(b));
                                n.prependRule(new a.Rule(k, new a.Expression(f).eval(b)))
                            } else {
                                if (j = g && g.value) j = j.eval(b);
                                else {
                                    if (!o[h].value) throw {
                                        type: "Runtime",
                                        message: "wrong number of arguments for " + this.name + " (" + d.length + " for " + this.arity + ")"
                                    };
                                    j = o[h].value.eval(c), n.resetCache()
                                }
                                n.prependRule(new a.Rule(k, j)), e[h] = j
                            }
                        if (o[h].variadic && d)
                            for (i = m; i < d.length; i++) e[i] = d[i].value.eval(b);
                        m++
                    }
                return n
            },
            eval: function (b, c, d) {
                var e, f, g = [],
                    h = this.frames.concat(b.frames),
                    i = this.evalParams(b, new a.evalEnv(b, h), c, g);
                return i.prependRule(new a.Rule("@arguments", new a.Expression(g).eval(b))), e = this.rules.slice(0), f = new a.Ruleset(null, e), f.originalRuleset = this, f = f.eval(new a.evalEnv(b, [this, i].concat(h))), d && (f = this.parent.makeImportant.apply(f)), f
            },
            matchCondition: function (b, c) {
                return this.condition && !this.condition.eval(new a.evalEnv(c, [this.evalParams(c, new a.evalEnv(c, this.frames.concat(c.frames)), b, [])].concat(this.frames).concat(c.frames))) ? !1 : !0
            },
            matchArgs: function (a, b) {
                var c, d = a && a.length || 0;
                if (this.variadic) {
                    if (d < this.required - 1) return !1
                } else {
                    if (d < this.required) return !1;
                    if (d > this.params.length) return !1
                }
                c = Math.min(d, this.arity);
                for (var e = 0; c > e; e++)
                    if (!this.params[e].name && !this.params[e].variadic && a[e].value.eval(b).toCSS() != this.params[e].value.eval(b).toCSS()) return !1;
                return !0
            }
        }
    }(c("../tree")),
    function (a) {
        a.Negative = function (a) {
            this.value = a
        }, a.Negative.prototype = {
            type: "Negative",
            accept: function (a) {
                this.value = a.visit(this.value)
            },
            genCSS: function (a, b) {
                b.add("-"), this.value.genCSS(a, b)
            },
            toCSS: a.toCSS,
            eval: function (b) {
                return b.isMathOn() ? new a.Operation("*", [new a.Dimension(-1), this.value]).eval(b) : new a.Negative(this.value.eval(b))
            }
        }
    }(c("../tree")),
    function (a) {
        a.Operation = function (a, b, c) {
            this.op = a.trim(), this.operands = b, this.isSpaced = c
        }, a.Operation.prototype = {
            type: "Operation",
            accept: function (a) {
                this.operands = a.visit(this.operands)
            },
            eval: function (b) {
                var c = this.operands[0].eval(b),
                    d = this.operands[1].eval(b);
                if (b.isMathOn()) {
                    if (c instanceof a.Dimension && d instanceof a.Color && (c = c.toColor()), d instanceof a.Dimension && c instanceof a.Color && (d = d.toColor()), !c.operate) throw {
                        type: "Operation",
                        message: "Operation on an invalid type"
                    };
                    return c.operate(b, this.op, d)
                }
                return new a.Operation(this.op, [c, d], this.isSpaced)
            },
            genCSS: function (a, b) {
                this.operands[0].genCSS(a, b), this.isSpaced && b.add(" "), b.add(this.op), this.isSpaced && b.add(" "), this.operands[1].genCSS(a, b)
            },
            toCSS: a.toCSS
        }, a.operate = function (a, b, c, d) {
            switch (b) {
            case "+":
                return c + d;
            case "-":
                return c - d;
            case "*":
                return c * d;
            case "/":
                return c / d
            }
        }
    }(c("../tree")),
    function (a) {
        a.Paren = function (a) {
            this.value = a
        }, a.Paren.prototype = {
            type: "Paren",
            accept: function (a) {
                this.value = a.visit(this.value)
            },
            genCSS: function (a, b) {
                b.add("("), this.value.genCSS(a, b), b.add(")")
            },
            toCSS: a.toCSS,
            eval: function (b) {
                return new a.Paren(this.value.eval(b))
            }
        }
    }(c("../tree")),
    function (a) {
        a.Quoted = function (a, b, c, d, e) {
            this.escaped = c, this.value = b || "", this.quote = a.charAt(0), this.index = d, this.currentFileInfo = e
        }, a.Quoted.prototype = {
            type: "Quoted",
            genCSS: function (a, b) {
                this.escaped || b.add(this.quote, this.currentFileInfo, this.index), b.add(this.value), this.escaped || b.add(this.quote)
            },
            toCSS: a.toCSS,
            eval: function (b) {
                var c = this,
                    d = this.value.replace(/`([^`]+)`/g, function (d, e) {
                        return new a.JavaScript(e, c.index, !0).eval(b).value
                    }).replace(/@\{([\w-]+)\}/g, function (d, e) {
                        var f = new a.Variable("@" + e, c.index, c.currentFileInfo).eval(b, !0);
                        return f instanceof a.Quoted ? f.value : f.toCSS()
                    });
                return new a.Quoted(this.quote + d + this.quote, d, this.escaped, this.index, this.currentFileInfo)
            },
            compare: function (a) {
                if (!a.toCSS) return -1;
                var b = this.toCSS(),
                    c = a.toCSS();
                return b === c ? 0 : c > b ? -1 : 1
            }
        }
    }(c("../tree")),
    function (a) {
        a.Rule = function (b, c, d, e, f, g, h) {
            this.name = b, this.value = c instanceof a.Value ? c : new a.Value([c]), this.important = d ? " " + d.trim() : "", this.merge = e, this.index = f, this.currentFileInfo = g, this.inline = h || !1, this.variable = b.charAt && "@" === b.charAt(0)
        }, a.Rule.prototype = {
            type: "Rule",
            accept: function (a) {
                this.value = a.visit(this.value)
            },
            genCSS: function (a, b) {
                b.add(this.name + (a.compress ? ":" : ": "), this.currentFileInfo, this.index);
                try {
                    this.value.genCSS(a, b)
                } catch (c) {
                    throw c.index = this.index, c.filename = this.currentFileInfo.filename, c
                }
                b.add(this.important + (this.inline || a.lastRule && a.compress ? "" : ";"), this.currentFileInfo, this.index)
            },
            toCSS: a.toCSS,
            eval: function (c) {
                var d = !1,
                    e = this.name.map ? this.name.map(function (a) {
                        return a.eval ? a.eval(c).value : a
                    }).join("") : this.name;
                "font" !== e || c.strictMath || (d = !0, c.strictMath = !0);
                try {
                    return new a.Rule(e, this.value.eval(c), this.important, this.merge, this.index, this.currentFileInfo, this.inline)
                } catch (f) {
                    throw f.index === b && (f.index = this.index), f
                } finally {
                    d && (c.strictMath = !1)
                }
            },
            makeImportant: function () {
                return new a.Rule(this.name, this.value, "!important", this.merge, this.index, this.currentFileInfo, this.inline)
            }
        }
    }(c("../tree")),
    function (a) {
        a.Ruleset = function (a, b, c) {
            this.selectors = a, this.rules = b, this._lookups = {}, this.strictImports = c
        }, a.Ruleset.prototype = {
            type: "Ruleset",
            accept: function (a) {
                this.paths ? a.visitArray(this.paths, !0) : this.selectors && (this.selectors = a.visitArray(this.selectors)), this.rules && this.rules.length && (this.rules = a.visitArray(this.rules))
            },
            eval: function (b) {
                var c, d, e, f = this.selectors,
                    g = a.defaultFunc;
                if (f && (d = f.length)) {
                    for (c = [], g.error({
                        type: "Syntax",
                        message: "it is currently only allowed in parametric mixin guards,"
                    }), e = 0; d > e; e++) c.push(f[e].eval(b));
                    g.reset()
                }
                var h, i = this.rules ? this.rules.slice(0) : null,
                    j = new a.Ruleset(c, i, this.strictImports);
                j.originalRuleset = this, j.root = this.root, j.firstRoot = this.firstRoot, j.allowImports = this.allowImports, this.debugInfo && (j.debugInfo = this.debugInfo);
                var k = b.frames;
                k.unshift(j);
                var l = b.selectors;
                l || (b.selectors = l = []), l.unshift(this.selectors), (j.root || j.allowImports || !j.strictImports) && j.evalImports(b);
                var m = j.rules,
                    n = m ? m.length : 0;
                for (e = 0; n > e; e++) m[e] instanceof a.mixin.Definition && (m[e].frames = k.slice(0));
                var o = b.mediaBlocks && b.mediaBlocks.length || 0;
                for (e = 0; n > e; e++) m[e] instanceof a.mixin.Call && (i = m[e].eval(b).filter(function (b) {
                    return b instanceof a.Rule && b.variable ? !j.variable(b.name) : !0
                }), m.splice.apply(m, [e, 1].concat(i)), n += i.length - 1, e += i.length - 1, j.resetCache());
                for (e = 0; n > e; e++) h = m[e], h instanceof a.mixin.Definition || (m[e] = h.eval ? h.eval(b) : h);
                if (k.shift(), l.shift(), b.mediaBlocks)
                    for (e = o; e < b.mediaBlocks.length; e++) b.mediaBlocks[e].bubbleSelectors(c);
                return j
            },
            evalImports: function (b) {
                var c, d, e = this.rules;
                if (e)
                    for (c = 0; c < e.length; c++) e[c] instanceof a.Import && (d = e[c].eval(b), d && d.length ? (e.splice.apply(e, [c, 1].concat(d)), c += d.length - 1) : e.splice(c, 1, d), this.resetCache())
            },
            makeImportant: function () {
                return new a.Ruleset(this.selectors, this.rules.map(function (a) {
                    return a.makeImportant ? a.makeImportant() : a
                }), this.strictImports)
            },
            matchArgs: function (a) {
                return !a || 0 === a.length
            },
            matchCondition: function (b, c) {
                var d = this.selectors[this.selectors.length - 1];
                return d.condition && !d.condition.eval(new a.evalEnv(c, c.frames)) ? !1 : !0
            },
            resetCache: function () {
                this._rulesets = null, this._variables = null, this._lookups = {}
            },
            variables: function () {
                return this._variables || (this._variables = this.rules ? this.rules.reduce(function (b, c) {
                    return c instanceof a.Rule && c.variable === !0 && (b[c.name] = c), b
                }, {}) : {}), this._variables
            },
            variable: function (a) {
                return this.variables()[a]
            },
            rulesets: function () {
                if (!this.rules) return null;
                var b, c, d = a.Ruleset,
                    e = a.mixin.Definition,
                    f = [],
                    g = this.rules,
                    h = g.length;
                for (b = 0; h > b; b++) c = g[b], (c instanceof d || c instanceof e) && f.push(c);
                return f
            },
            prependRule: function (a) {
                var b = this.rules;
                b ? b.unshift(a) : this.rules = [a]
            },
            find: function (b, c) {
                c = c || this;
                var d, e = [],
                    f = b.toCSS();
                return f in this._lookups ? this._lookups[f] : (this.rulesets().forEach(function (f) {
                    if (f !== c)
                        for (var g = 0; g < f.selectors.length; g++)
                            if (d = b.match(f.selectors[g])) {
                                b.elements.length > d ? Array.prototype.push.apply(e, f.find(new a.Selector(b.elements.slice(d)), c)) : e.push(f);
                                break
                            }
                }), this._lookups[f] = e, e)
            },
            genCSS: function (b, c) {
                var d, e, f, g, h, i, j = [],
                    k = [];
                b.tabLevel = b.tabLevel || 0, this.root || b.tabLevel++;
                var l, m = b.compress ? "" : Array(b.tabLevel + 1).join("  "),
                    n = b.compress ? "" : Array(b.tabLevel).join("  ");
                for (d = 0; d < this.rules.length; d++) h = this.rules[d], h.rules || h instanceof a.Media || h instanceof a.Directive || this.root && h instanceof a.Comment ? k.push(h) : j.push(h);
                if (!this.root) {
                    g = a.debugInfo(b, this, n), g && (c.add(g), c.add(n));
                    var o, p = this.paths,
                        q = p.length;
                    for (l = b.compress ? "," : ",\n" + n, d = 0; q > d; d++)
                        if (i = p[d], o = i.length)
                            for (d > 0 && c.add(l), b.firstSelector = !0, i[0].genCSS(b, c), b.firstSelector = !1, e = 1; o > e; e++) i[e].genCSS(b, c);
                    c.add((b.compress ? "{" : " {\n") + m)
                }
                for (d = 0; d < j.length; d++) h = j[d], d + 1 !== j.length || this.root && 0 !== k.length && !this.firstRoot || (b.lastRule = !0), h.genCSS ? h.genCSS(b, c) : h.value && c.add(h.value.toString()), b.lastRule ? b.lastRule = !1 : c.add(b.compress ? "" : "\n" + m);
                if (this.root || (c.add(b.compress ? "}" : "\n" + n + "}"), b.tabLevel--), l = (b.compress ? "" : "\n") + (this.root ? m : n), f = k.length)
                    for (j.length && l && c.add(l), k[0].genCSS(b, c), d = 1; f > d; d++) l && c.add(l), k[d].genCSS(b, c);
                c.isEmpty() || b.compress || !this.firstRoot || c.add("\n")
            },
            toCSS: a.toCSS,
            markReferenced: function () {
                for (var a = 0; a < this.selectors.length; a++) this.selectors[a].markReferenced()
            },
            joinSelectors: function (a, b, c) {
                for (var d = 0; d < c.length; d++) this.joinSelector(a, b, c[d])
            },
            joinSelector: function (b, c, d) {
                var e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
                for (e = 0; e < d.elements.length; e++) j = d.elements[e], "&" === j.value && (h = !0);
                if (h) {
                    for (r = [], i = [
                        []
                    ], e = 0; e < d.elements.length; e++)
                        if (j = d.elements[e], "&" !== j.value) r.push(j);
                        else {
                            for (s = [], r.length > 0 && this.mergeElementsOnToSelectors(r, i), f = 0; f < i.length; f++)
                                if (k = i[f], 0 === c.length) k.length > 0 && (k[0].elements = k[0].elements.slice(0), k[0].elements.push(new a.Element(j.combinator, "", 0, j.index, j.currentFileInfo))), s.push(k);
                                else
                                    for (g = 0; g < c.length; g++) l = c[g], m = [], n = [], p = !0, k.length > 0 ? (m = k.slice(0), q = m.pop(), o = d.createDerived(q.elements.slice(0)), p = !1) : o = d.createDerived([]), l.length > 1 && (n = n.concat(l.slice(1))), l.length > 0 && (p = !1, o.elements.push(new a.Element(j.combinator, l[0].elements[0].value, j.index, j.currentFileInfo)), o.elements = o.elements.concat(l[0].elements.slice(1))), p || m.push(o), m = m.concat(n), s.push(m);
                            i = s, r = []
                        }
                    for (r.length > 0 && this.mergeElementsOnToSelectors(r, i), e = 0; e < i.length; e++) i[e].length > 0 && b.push(i[e])
                } else if (c.length > 0)
                    for (e = 0; e < c.length; e++) b.push(c[e].concat(d));
                else b.push([d])
            },
            mergeElementsOnToSelectors: function (b, c) {
                var d, e;
                if (0 === c.length) return c.push([new a.Selector(b)]), void 0;
                for (d = 0; d < c.length; d++) e = c[d], e.length > 0 ? e[e.length - 1] = e[e.length - 1].createDerived(e[e.length - 1].elements.concat(b)) : e.push(new a.Selector(b))
            }
        }
    }(c("../tree")),
    function (a) {
        a.Selector = function (a, b, c, d, e, f) {
            this.elements = a, this.extendList = b, this.condition = c, this.currentFileInfo = e || {}, this.isReferenced = f, c || (this.evaldCondition = !0)
        }, a.Selector.prototype = {
            type: "Selector",
            accept: function (a) {
                this.elements && (this.elements = a.visitArray(this.elements)), this.extendList && (this.extendList = a.visitArray(this.extendList)), this.condition && (this.condition = a.visit(this.condition))
            },
            createDerived: function (b, c, d) {
                d = null != d ? d : this.evaldCondition;
                var e = new a.Selector(b, c || this.extendList, this.condition, this.index, this.currentFileInfo, this.isReferenced);
                return e.evaldCondition = d, e
            },
            match: function (a) {
                var b, c, d, e = this.elements,
                    f = e.length;
                if (b = a.elements.map(function (a) {
                    return a.combinator.value + (a.value.value || a.value)
                }).join("").match(/[,&#\.\w-]([\w-]|(\\.))*/g), !b) return 0;
                if ("&" === b[0] && b.shift(), c = b.length, 0 === c || c > f) return 0;
                for (d = 0; c > d; d++)
                    if (e[d].value !== b[d]) return 0;
                return c
            },
            eval: function (a) {
                var b = this.condition && this.condition.eval(a),
                    c = this.elements,
                    d = this.extendList;
                return c = c && c.map(function (b) {
                    return b.eval(a)
                }), d = d && d.map(function (b) {
                    return b.eval(a)
                }), this.createDerived(c, d, b)
            },
            genCSS: function (a, b) {
                var c, d;
                if (a && a.firstSelector || "" !== this.elements[0].combinator.value || b.add(" ", this.currentFileInfo, this.index), !this._css)
                    for (c = 0; c < this.elements.length; c++) d = this.elements[c], d.genCSS(a, b)
            },
            toCSS: a.toCSS,
            markReferenced: function () {
                this.isReferenced = !0
            },
            getIsReferenced: function () {
                return !this.currentFileInfo.reference || this.isReferenced
            },
            getIsOutput: function () {
                return this.evaldCondition
            }
        }
    }(c("../tree")),
    function (a) {
        a.UnicodeDescriptor = function (a) {
            this.value = a
        }, a.UnicodeDescriptor.prototype = {
            type: "UnicodeDescriptor",
            genCSS: function (a, b) {
                b.add(this.value)
            },
            toCSS: a.toCSS,
            eval: function () {
                return this
            }
        }
    }(c("../tree")),
    function (a) {
        a.URL = function (a, b, c) {
            this.value = a, this.currentFileInfo = b, this.isEvald = c
        }, a.URL.prototype = {
            type: "Url",
            accept: function (a) {
                this.value = a.visit(this.value)
            },
            genCSS: function (a, b) {
                b.add("url("), this.value.genCSS(a, b), b.add(")")
            },
            toCSS: a.toCSS,
            eval: function (b) {
                var c, d = this.value.eval(b);
                return this.isEvald || (c = this.currentFileInfo && this.currentFileInfo.rootpath, c && "string" == typeof d.value && b.isPathRelative(d.value) && (d.quote || (c = c.replace(/[\(\)'"\s]/g, function (a) {
                    return "\\" + a
                })), d.value = c + d.value), d.value = b.normalizePath(d.value)), new a.URL(d, this.currentFileInfo, !0)
            }
        }
    }(c("../tree")),
    function (a) {
        a.Value = function (a) {
            this.value = a
        }, a.Value.prototype = {
            type: "Value",
            accept: function (a) {
                this.value && (this.value = a.visitArray(this.value))
            },
            eval: function (b) {
                return 1 === this.value.length ? this.value[0].eval(b) : new a.Value(this.value.map(function (a) {
                    return a.eval(b)
                }))
            },
            genCSS: function (a, b) {
                var c;
                for (c = 0; c < this.value.length; c++) this.value[c].genCSS(a, b), c + 1 < this.value.length && b.add(a && a.compress ? "," : ", ")
            },
            toCSS: a.toCSS
        }
    }(c("../tree")),
    function (a) {
        a.Variable = function (a, b, c) {
            this.name = a, this.index = b, this.currentFileInfo = c || {}
        }, a.Variable.prototype = {
            type: "Variable",
            eval: function (b) {
                var c, d = this.name;
                if (0 === d.indexOf("@@") && (d = "@" + new a.Variable(d.slice(1)).eval(b).value), this.evaluating) throw {
                    type: "Name",
                    message: "Recursive variable definition for " + d,
                    filename: this.currentFileInfo.file,
                    index: this.index
                };
                if (this.evaluating = !0, c = a.find(b.frames, function (a) {
                    var c = a.variable(d);
                    return c ? c.value.eval(b) : void 0
                })) return this.evaluating = !1, c;
                throw {
                    type: "Name",
                    message: "variable " + d + " is undefined",
                    filename: this.currentFileInfo.filename,
                    index: this.index
                }
            }
        }
    }(c("../tree")),
    function (a) {
        var b = ["paths", "optimization", "files", "contents", "contentsIgnoredChars", "relativeUrls", "rootpath", "strictImports", "insecure", "dumpLineNumbers", "compress", "processImports", "syncImport", "javascriptEnabled", "mime", "useFileCache", "currentFileInfo"];
        a.parseEnv = function (a) {
            if (d(a, this, b), this.contents || (this.contents = {}), this.contentsIgnoredChars || (this.contentsIgnoredChars = {}), this.files || (this.files = {}), !this.currentFileInfo) {
                var c = a && a.filename || "input",
                    e = c.replace(/[^\/\\]*$/, "");
                a && (a.filename = null), this.currentFileInfo = {
                    filename: c,
                    relativeUrls: this.relativeUrls,
                    rootpath: a && a.rootpath || "",
                    currentDirectory: e,
                    entryPath: e,
                    rootFilename: c
                }
            }
        };
        var c = ["silent", "verbose", "compress", "yuicompress", "ieCompat", "strictMath", "strictUnits", "cleancss", "sourceMap", "importMultiple"];
        a.evalEnv = function (a, b) {
            d(a, this, c), this.frames = b || []
        }, a.evalEnv.prototype.inParenthesis = function () {
            this.parensStack || (this.parensStack = []), this.parensStack.push(!0)
        }, a.evalEnv.prototype.outOfParenthesis = function () {
            this.parensStack.pop()
        }, a.evalEnv.prototype.isMathOn = function () {
            return this.strictMath ? this.parensStack && this.parensStack.length : !0
        }, a.evalEnv.prototype.isPathRelative = function (a) {
            return !/^(?:[a-z-]+:|\/)/.test(a)
        }, a.evalEnv.prototype.normalizePath = function (a) {
            var b, c = a.split("/").reverse();
            for (a = []; 0 !== c.length;) switch (b = c.pop()) {
            case ".":
                break;
            case "..":
                0 === a.length || ".." === a[a.length - 1] ? a.push(b) : a.pop();
                break;
            default:
                a.push(b)
            }
            return a.join("/")
        };
        var d = function (a, b, c) {
            if (a)
                for (var d = 0; d < c.length; d++) a.hasOwnProperty(c[d]) && (b[c[d]] = a[c[d]])
        }
    }(c("./tree")),
    function (a) {
        function b(a) {
            return a
        }

        function c(a, b) {
            var d, e;
            for (d in a) switch (e = a[d], typeof e) {
            case "function":
                e.prototype && e.prototype.type && (e.prototype.typeIndex = b++);
                break;
            case "object":
                b = c(e, b)
            }
            return b
        }
        var d = {
                visitDeeper: !0
            },
            e = !1;
        a.visitor = function (b) {
            this._implementation = b, this._visitFnCache = [], e || (c(a, 1), e = !0)
        }, a.visitor.prototype = {
            visit: function (a) {
                if (!a) return a;
                var c = a.typeIndex;
                if (!c) return a;
                var e, f = this._visitFnCache,
                    g = this._implementation,
                    h = c << 1,
                    i = 1 | h,
                    j = f[h],
                    k = f[i],
                    l = d;
                if (l.visitDeeper = !0, j || (e = "visit" + a.type, j = g[e] || b, k = g[e + "Out"] || b, f[h] = j, f[i] = k), j !== b) {
                    var m = j.call(g, a, l);
                    g.isReplacing && (a = m)
                }
                return l.visitDeeper && a && a.accept && a.accept(this), k != b && k.call(g, a), a
            },
            visitArray: function (a, b) {
                if (!a) return a;
                var c, d = a.length;
                if (b || !this._implementation.isReplacing) {
                    for (c = 0; d > c; c++) this.visit(a[c]);
                    return a
                }
                var e = [];
                for (c = 0; d > c; c++) {
                    var f = this.visit(a[c]);
                    f.splice ? f.length && this.flatten(f, e) : e.push(f)
                }
                return e
            },
            flatten: function (a, b) {
                b || (b = []);
                var c, d, e, f, g, h;
                for (d = 0, c = a.length; c > d; d++)
                    if (e = a[d], e.splice)
                        for (g = 0, f = e.length; f > g; g++) h = e[g], h.splice ? h.length && this.flatten(h, b) : b.push(h);
                    else b.push(e);
                return b
            }
        }
    }(c("./tree")),
    function (a) {
        a.importVisitor = function (b, c, d) {
            this._visitor = new a.visitor(this), this._importer = b, this._finish = c, this.env = d || new a.evalEnv, this.importCount = 0
        }, a.importVisitor.prototype = {
            isReplacing: !0,
            run: function (a) {
                var b;
                try {
                    this._visitor.visit(a)
                } catch (c) {
                    b = c
                }
                this.isFinished = !0, 0 === this.importCount && this._finish(b)
            },
            visitImport: function (b, c) {
                var d, e = this,
                    f = b.options.inline;
                if (!b.css || f) {
                    try {
                        d = b.evalForImport(this.env)
                    } catch (g) {
                        g.filename || (g.index = b.index, g.filename = b.currentFileInfo.filename), b.css = !0, b.error = g
                    }
                    if (d && (!d.css || f)) {
                        b = d, this.importCount++;
                        var h = new a.evalEnv(this.env, this.env.frames.slice(0));
                        b.options.multiple && (h.importMultiple = !0), this._importer.push(b.getPath(), b.currentFileInfo, b.options, function (c, d, g, i) {
                            c && !c.filename && (c.index = b.index, c.filename = b.currentFileInfo.filename), g && !h.importMultiple && (b.skip = g);
                            var j = function (a) {
                                e.importCount--, 0 === e.importCount && e.isFinished && e._finish(a)
                            };
                            return !d || (b.root = d, b.importedFilename = i, f || b.skip) ? (j(), void 0) : (new a.importVisitor(e._importer, j, h).run(d), void 0)
                        })
                    }
                }
                return c.visitDeeper = !1, b
            },
            visitRule: function (a, b) {
                return b.visitDeeper = !1, a
            },
            visitDirective: function (a) {
                return this.env.frames.unshift(a), a
            },
            visitDirectiveOut: function () {
                this.env.frames.shift()
            },
            visitMixinDefinition: function (a) {
                return this.env.frames.unshift(a), a
            },
            visitMixinDefinitionOut: function () {
                this.env.frames.shift()
            },
            visitRuleset: function (a) {
                return this.env.frames.unshift(a), a
            },
            visitRulesetOut: function () {
                this.env.frames.shift()
            },
            visitMedia: function (a) {
                return this.env.frames.unshift(a.ruleset), a
            },
            visitMediaOut: function () {
                this.env.frames.shift()
            }
        }
    }(c("./tree")),
    function (a) {
        a.joinSelectorVisitor = function () {
            this.contexts = [
                []
            ], this._visitor = new a.visitor(this)
        }, a.joinSelectorVisitor.prototype = {
            run: function (a) {
                return this._visitor.visit(a)
            },
            visitRule: function (a, b) {
                b.visitDeeper = !1
            },
            visitMixinDefinition: function (a, b) {
                b.visitDeeper = !1
            },
            visitRuleset: function (a) {
                var b, c = this.contexts[this.contexts.length - 1],
                    d = [];
                this.contexts.push(d), a.root || (b = a.selectors, b && (b = b.filter(function (a) {
                    return a.getIsOutput()
                }), a.selectors = b.length ? b : b = null, b && a.joinSelectors(d, c, b)), b || (a.rules = null), a.paths = d)
            },
            visitRulesetOut: function () {
                this.contexts.length = this.contexts.length - 1
            },
            visitMedia: function (a) {
                var b = this.contexts[this.contexts.length - 1];
                a.rules[0].root = 0 === b.length || b[0].multiMedia
            }
        }
    }(c("./tree")),
    function (a) {
        a.toCSSVisitor = function (b) {
            this._visitor = new a.visitor(this), this._env = b
        }, a.toCSSVisitor.prototype = {
            isReplacing: !0,
            run: function (a) {
                return this._visitor.visit(a)
            },
            visitRule: function (a) {
                return a.variable ? [] : a
            },
            visitMixinDefinition: function () {
                return []
            },
            visitExtend: function () {
                return []
            },
            visitComment: function (a) {
                return a.isSilent(this._env) ? [] : a
            },
            visitMedia: function (a, b) {
                return a.accept(this._visitor), b.visitDeeper = !1, a.rules.length ? a : []
            },
            visitDirective: function (b) {
                if (b.currentFileInfo.reference && !b.isReferenced) return [];
                if ("@charset" === b.name) {
                    if (this.charset) {
                        if (b.debugInfo) {
                            var c = new a.Comment("/* " + b.toCSS(this._env).replace(/\n/g, "") + " */\n");
                            return c.debugInfo = b.debugInfo, this._visitor.visit(c)
                        }
                        return []
                    }
                    this.charset = !0
                }
                return b
            },
            checkPropertiesInRoot: function (b) {
                for (var c, d = 0; d < b.length; d++)
                    if (c = b[d], c instanceof a.Rule && !c.variable) throw {
                        message: "properties must be inside selector blocks, they cannot be in the root.",
                        index: c.index,
                        filename: c.currentFileInfo ? c.currentFileInfo.filename : null
                    }
            },
            visitRuleset: function (b, c) {
                var d, e = [];
                if (b.firstRoot && this.checkPropertiesInRoot(b.rules), b.root) b.accept(this._visitor), c.visitDeeper = !1, (b.firstRoot || b.rules && b.rules.length > 0) && e.splice(0, 0, b);
                else {
                    b.paths && (b.paths = b.paths.filter(function (b) {
                        var c;
                        for (" " === b[0].elements[0].combinator.value && (b[0].elements[0].combinator = new a.Combinator("")), c = 0; c < b.length; c++)
                            if (b[c].getIsReferenced() && b[c].getIsOutput()) return !0;
                        return !1
                    }));
                    for (var f = b.rules, g = f ? f.length : 0, h = 0; g > h;) d = f[h], d && d.rules ? (e.push(this._visitor.visit(d)), f.splice(h, 1), g--) : h++;
                    g > 0 ? b.accept(this._visitor) : b.rules = null, c.visitDeeper = !1, f = b.rules, f && (this._mergeRules(f), f = b.rules), f && (this._removeDuplicateRules(f), f = b.rules), f && f.length > 0 && b.paths.length > 0 && e.splice(0, 0, b)
                }
                return 1 === e.length ? e[0] : e
            },
            _removeDuplicateRules: function (b) {
                if (b) {
                    var c, d, e, f = {};
                    for (e = b.length - 1; e >= 0; e--)
                        if (d = b[e], d instanceof a.Rule)
                            if (f[d.name]) {
                                c = f[d.name], c instanceof a.Rule && (c = f[d.name] = [f[d.name].toCSS(this._env)]);
                                var g = d.toCSS(this._env); - 1 !== c.indexOf(g) ? b.splice(e, 1) : c.push(g)
                            } else f[d.name] = d
                }
            },
            _mergeRules: function (b) {
                if (b) {
                    for (var c, d, e, f = {}, g = 0; g < b.length; g++) d = b[g], d instanceof a.Rule && d.merge && (e = [d.name, d.important ? "!" : ""].join(","), f[e] ? b.splice(g--, 1) : f[e] = [], f[e].push(d));
                    Object.keys(f).map(function (b) {
                        c = f[b], c.length > 1 && (d = c[0], d.value = new a.Value(c.map(function (a) {
                            return a.value
                        })))
                    })
                }
            }
        }
    }(c("./tree")),
    function (a) {
        a.extendFinderVisitor = function () {
            this._visitor = new a.visitor(this), this.contexts = [], this.allExtendsStack = [
                []
            ]
        }, a.extendFinderVisitor.prototype = {
            run: function (a) {
                return a = this._visitor.visit(a), a.allExtends = this.allExtendsStack[0], a
            },
            visitRule: function (a, b) {
                b.visitDeeper = !1
            },
            visitMixinDefinition: function (a, b) {
                b.visitDeeper = !1
            },
            visitRuleset: function (b) {
                if (!b.root) {
                    var c, d, e, f, g = [],
                        h = b.rules,
                        i = h ? h.length : 0;
                    for (c = 0; i > c; c++) b.rules[c] instanceof a.Extend && (g.push(h[c]), b.extendOnEveryPath = !0);
                    var j = b.paths;
                    for (c = 0; c < j.length; c++) {
                        var k = j[c],
                            l = k[k.length - 1],
                            m = l.extendList;
                        for (f = m ? m.slice(0).concat(g) : g, f && (f = f.map(function (a) {
                            return a.clone()
                        })), d = 0; d < f.length; d++) this.foundExtends = !0, e = f[d], e.findSelfSelectors(k), e.ruleset = b, 0 === d && (e.firstExtendOnThisSelectorPath = !0), this.allExtendsStack[this.allExtendsStack.length - 1].push(e)
                    }
                    this.contexts.push(b.selectors)
                }
            },
            visitRulesetOut: function (a) {
                a.root || (this.contexts.length = this.contexts.length - 1)
            },
            visitMedia: function (a) {
                a.allExtends = [], this.allExtendsStack.push(a.allExtends)
            },
            visitMediaOut: function () {
                this.allExtendsStack.length = this.allExtendsStack.length - 1
            },
            visitDirective: function (a) {
                a.allExtends = [], this.allExtendsStack.push(a.allExtends)
            },
            visitDirectiveOut: function () {
                this.allExtendsStack.length = this.allExtendsStack.length - 1
            }
        }, a.processExtendsVisitor = function () {
            this._visitor = new a.visitor(this)
        }, a.processExtendsVisitor.prototype = {
            run: function (b) {
                var c = new a.extendFinderVisitor;
                return c.run(b), c.foundExtends ? (b.allExtends = b.allExtends.concat(this.doExtendChaining(b.allExtends, b.allExtends)), this.allExtendsStack = [b.allExtends], this._visitor.visit(b)) : b
            },
            doExtendChaining: function (b, c, d) {
                var e, f, g, h, i, j, k, l, m = [],
                    n = this;
                for (d = d || 0, e = 0; e < b.length; e++)
                    for (f = 0; f < c.length; f++) j = b[e], k = c[f], j.parent_ids.indexOf(k.object_id) >= 0 || (i = [k.selfSelectors[0]], g = n.findMatch(j, i), g.length && j.selfSelectors.forEach(function (b) {
                        h = n.extendSelector(g, i, b), l = new a.Extend(k.selector, k.option, 0), l.selfSelectors = h, h[h.length - 1].extendList = [l], m.push(l), l.ruleset = k.ruleset, l.parent_ids = l.parent_ids.concat(k.parent_ids, j.parent_ids), k.firstExtendOnThisSelectorPath && (l.firstExtendOnThisSelectorPath = !0, k.ruleset.paths.push(h))
                    }));
                if (m.length) {
                    if (this.extendChainCount++, d > 100) {
                        var o = "{unable to calculate}",
                            p = "{unable to calculate}";
                        try {
                            o = m[0].selfSelectors[0].toCSS(), p = m[0].selector.toCSS()
                        } catch (q) {}
                        throw {
                            message: "extend circular reference detected. One of the circular extends is currently:" + o + ":extend(" + p + ")"
                        }
                    }
                    return m.concat(n.doExtendChaining(m, c, d + 1))
                }
                return m
            },
            visitRule: function (a, b) {
                b.visitDeeper = !1
            },
            visitMixinDefinition: function (a, b) {
                b.visitDeeper = !1
            },
            visitSelector: function (a, b) {
                b.visitDeeper = !1
            },
            visitRuleset: function (a) {
                if (!a.root) {
                    var b, c, d, e, f = this.allExtendsStack[this.allExtendsStack.length - 1],
                        g = [],
                        h = this;
                    for (d = 0; d < f.length; d++)
                        for (c = 0; c < a.paths.length; c++)
                            if (e = a.paths[c], !a.extendOnEveryPath) {
                                var i = e[e.length - 1].extendList;
                                i && i.length || (b = this.findMatch(f[d], e), b.length && f[d].selfSelectors.forEach(function (a) {
                                    g.push(h.extendSelector(b, e, a))
                                }))
                            }
                    a.paths = a.paths.concat(g)
                }
            },
            findMatch: function (a, b) {
                var c, d, e, f, g, h, i, j = this,
                    k = a.selector.elements,
                    l = [],
                    m = [];
                for (c = 0; c < b.length; c++)
                    for (d = b[c], e = 0; e < d.elements.length; e++)
                        for (f = d.elements[e], (a.allowBefore || 0 === c && 0 === e) && l.push({
                            pathIndex: c,
                            index: e,
                            matched: 0,
                            initialCombinator: f.combinator
                        }), h = 0; h < l.length; h++) i = l[h], g = f.combinator.value, "" === g && 0 === e && (g = " "), !j.isElementValuesEqual(k[i.matched].value, f.value) || i.matched > 0 && k[i.matched].combinator.value !== g ? i = null : i.matched++, i && (i.finished = i.matched === k.length, i.finished && !a.allowAfter && (e + 1 < d.elements.length || c + 1 < b.length) && (i = null)), i ? i.finished && (i.length = k.length, i.endPathIndex = c, i.endPathElementIndex = e + 1, l.length = 0, m.push(i)) : (l.splice(h, 1), h--);
                return m
            },
            isElementValuesEqual: function (b, c) {
                if ("string" == typeof b || "string" == typeof c) return b === c;
                if (b instanceof a.Attribute) return b.op !== c.op || b.key !== c.key ? !1 : b.value && c.value ? (b = b.value.value || b.value, c = c.value.value || c.value, b === c) : b.value || c.value ? !1 : !0;
                if (b = b.value, c = c.value, b instanceof a.Selector) {
                    if (!(c instanceof a.Selector) || b.elements.length !== c.elements.length) return !1;
                    for (var d = 0; d < b.elements.length; d++) {
                        if (b.elements[d].combinator.value !== c.elements[d].combinator.value && (0 !== d || (b.elements[d].combinator.value || " ") !== (c.elements[d].combinator.value || " "))) return !1;
                        if (!this.isElementValuesEqual(b.elements[d].value, c.elements[d].value)) return !1
                    }
                    return !0
                }
                return !1
            },
            extendSelector: function (b, c, d) {
                var e, f, g, h, i, j = 0,
                    k = 0,
                    l = [];
                for (e = 0; e < b.length; e++) h = b[e], f = c[h.pathIndex], g = new a.Element(h.initialCombinator, d.elements[0].value, d.elements[0].index, d.elements[0].currentFileInfo), h.pathIndex > j && k > 0 && (l[l.length - 1].elements = l[l.length - 1].elements.concat(c[j].elements.slice(k)), k = 0, j++), i = f.elements.slice(k, h.index).concat([g]).concat(d.elements.slice(1)), j === h.pathIndex && e > 0 ? l[l.length - 1].elements = l[l.length - 1].elements.concat(i) : (l = l.concat(c.slice(j, h.pathIndex)), l.push(new a.Selector(i))), j = h.endPathIndex, k = h.endPathElementIndex, k >= c[j].elements.length && (k = 0, j++);
                return j < c.length && k > 0 && (l[l.length - 1].elements = l[l.length - 1].elements.concat(c[j].elements.slice(k)), j++), l = l.concat(c.slice(j, c.length))
            },
            visitRulesetOut: function () {},
            visitMedia: function (a) {
                var b = a.allExtends.concat(this.allExtendsStack[this.allExtendsStack.length - 1]);
                b = b.concat(this.doExtendChaining(b, a.allExtends)), this.allExtendsStack.push(b)
            },
            visitMediaOut: function () {
                this.allExtendsStack.length = this.allExtendsStack.length - 1
            },
            visitDirective: function (a) {
                var b = a.allExtends.concat(this.allExtendsStack[this.allExtendsStack.length - 1]);
                b = b.concat(this.doExtendChaining(b, a.allExtends)), this.allExtendsStack.push(b)
            },
            visitDirectiveOut: function () {
                this.allExtendsStack.length = this.allExtendsStack.length - 1
            }
        }
    }(c("./tree")),
    function (a) {
        a.sourceMapOutput = function (a) {
            this._css = [], this._rootNode = a.rootNode, this._writeSourceMap = a.writeSourceMap, this._contentsMap = a.contentsMap, this._contentsIgnoredCharsMap = a.contentsIgnoredCharsMap, this._sourceMapFilename = a.sourceMapFilename, this._outputFilename = a.outputFilename, this._sourceMapURL = a.sourceMapURL, a.sourceMapBasepath && (this._sourceMapBasepath = a.sourceMapBasepath.replace(/\\/g, "/")), this._sourceMapRootpath = a.sourceMapRootpath, this._outputSourceFiles = a.outputSourceFiles, this._sourceMapGeneratorConstructor = a.sourceMapGenerator || c("source-map").SourceMapGenerator, this._sourceMapRootpath && "/" !== this._sourceMapRootpath.charAt(this._sourceMapRootpath.length - 1) && (this._sourceMapRootpath += "/"), this._lineNumber = 0, this._column = 0
        }, a.sourceMapOutput.prototype.normalizeFilename = function (a) {
            return a = a.replace(/\\/g, "/"), this._sourceMapBasepath && 0 === a.indexOf(this._sourceMapBasepath) && (a = a.substring(this._sourceMapBasepath.length), ("\\" === a.charAt(0) || "/" === a.charAt(0)) && (a = a.substring(1))), (this._sourceMapRootpath || "") + a
        }, a.sourceMapOutput.prototype.add = function (a, b, c, d) {
            if (a) {
                var e, f, g, h, i;
                if (b) {
                    var j = this._contentsMap[b.filename];
                    this._contentsIgnoredCharsMap[b.filename] && (c -= this._contentsIgnoredCharsMap[b.filename], 0 > c && (c = 0), j = j.slice(this._contentsIgnoredCharsMap[b.filename])), j = j.substring(0, c), f = j.split("\n"), h = f[f.length - 1]
                }
                if (e = a.split("\n"), g = e[e.length - 1], b)
                    if (d)
                        for (i = 0; i < e.length; i++) this._sourceMapGenerator.addMapping({
                            generated: {
                                line: this._lineNumber + i + 1,
                                column: 0 === i ? this._column : 0
                            },
                            original: {
                                line: f.length + i,
                                column: 0 === i ? h.length : 0
                            },
                            source: this.normalizeFilename(b.filename)
                        });
                    else this._sourceMapGenerator.addMapping({
                        generated: {
                            line: this._lineNumber + 1,
                            column: this._column
                        },
                        original: {
                            line: f.length,
                            column: h.length
                        },
                        source: this.normalizeFilename(b.filename)
                    });
                1 === e.length ? this._column += g.length : (this._lineNumber += e.length - 1, this._column = g.length), this._css.push(a)
            }
        }, a.sourceMapOutput.prototype.isEmpty = function () {
            return 0 === this._css.length
        }, a.sourceMapOutput.prototype.toCSS = function (a) {
            if (this._sourceMapGenerator = new this._sourceMapGeneratorConstructor({
                file: this._outputFilename,
                sourceRoot: null
            }), this._outputSourceFiles)
                for (var b in this._contentsMap) {
                    var c = this._contentsMap[b];
                    this._contentsIgnoredCharsMap[b] && (c = c.slice(this._contentsIgnoredCharsMap[b])), this._sourceMapGenerator.setSourceContent(this.normalizeFilename(b), c)
                }
            if (this._rootNode.genCSS(a, this), this._css.length > 0) {
                var d, e = JSON.stringify(this._sourceMapGenerator.toJSON());
                this._sourceMapURL ? d = this._sourceMapURL : this._sourceMapFilename && (d = this.normalizeFilename(this._sourceMapFilename)), this._writeSourceMap ? this._writeSourceMap(e) : d = "data:application/json," + encodeURIComponent(e), d && this._css.push("/*# sourceMappingURL=" + d + " */")
            }
            return this._css.join("")
        }
    }(c("./tree"));
    var x = /^(file|chrome(-extension)?|resource|qrc|app):/.test(location.protocol);
    v.env = v.env || ("127.0.0.1" == location.hostname || "0.0.0.0" == location.hostname || "localhost" == location.hostname || location.port && location.port.length > 0 || x ? "development" : "production");
    var y = {
        info: 2,
        errors: 1,
        none: 0
    };
    if (v.logLevel = "undefined" != typeof v.logLevel ? v.logLevel : y.info, v.async = v.async || !1, v.fileAsync = v.fileAsync || !1, v.poll = v.poll || (x ? 1e3 : 1500), v.functions)
        for (var z in v.functions) v.tree.functions[z] = v.functions[z];
    var A = /!dumpLineNumbers:(comments|mediaquery|all)/.exec(location.hash);
    A && (v.dumpLineNumbers = A[1]);
    var B = /^text\/(x-)?less$/,
        C = null,
        D = {};
    if (v.watch = function () {
        return v.watchMode || (v.env = "development", u()), this.watchMode = !0, !0
    }, v.unwatch = function () {
        return clearInterval(v.watchTimer), this.watchMode = !1, !1
    }, /!watch/.test(location.hash) && v.watch(), "development" != v.env) try {
        C = "undefined" == typeof a.localStorage ? null : a.localStorage
    } catch (E) {}
    var F = document.getElementsByTagName("link");
    v.sheets = [];
    for (var G = 0; G < F.length; G++)("stylesheet/less" === F[G].rel || F[G].rel.match(/stylesheet/) && F[G].type.match(B)) && v.sheets.push(F[G]);
    v.modifyVars = function (a) {
        v.refresh(!1, a)
    }, v.refresh = function (a, b) {
        var c, e;
        c = e = new Date, t(function (a, b, f, h, j) {
            return a ? i(a, h.href) : (j.local ? d("loading " + h.href + " from cache.", y.info) : (d("parsed " + h.href + " successfully.", y.info), g(b.toCSS(v), h, j.lastModified)), d("css for " + h.href + " generated in " + (new Date - e) + "ms", y.info), 0 === j.remaining && d("css generated in " + (new Date - c) + "ms", y.info), e = new Date, void 0)
        }, a, b), m(b)
    }, v.refreshStyles = m, v.Parser.fileLoader = r, v.refresh("development" === v.env), "function" == typeof define && define.amd && define(function () {
        return v
    })
}(window);
</script>
<script type="text/javascript">
function parseUri (str) {
    var     o   = parseUri.options,
            m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
            uri = {},
            i   = 14;

    while (i--) uri[o.key[i]] = m[i] || "";

    uri[o.q.name] = {};
    uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
            if ($1) uri[o.q.name][$1] = $2;
    });

    return uri;
};

parseUri.options = {
    strictMode: false,
    key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
    q:   {
            name:   "queryKey",
            parser: /(?:^|&)([^&=]*)=?([^&]*)/g
    },
    parser: {
            strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
            loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
    }
};
</script>
<script type="text/javascript">
function JsHtmlObject(pJsParent, pHtmlType, pHtmlId, pWidth, pHeight) {
	
	this.cParent = pJsParent;
	this.cHtmlObject = null;

	if (IS_NULL(pJsParent) && IS_NULL(pHtmlType) && IS_NULL(pHtmlId)) {
		//Heritage creation
		return false;
	}
	if (IS_NULL(pHtmlType)) {
		//If Html type not defined,

		if (!IS_NULL(pJsParent)) {
			this.cHtmlObject = pJsParent;
		} else if (!IS_NULL(pHtmlId)) {
			this.cHtmlObject = document.getElementById(pHtmlId);
			if (IS_NULL(this.cHtmlObject)) {
				return false;
			}
		} else {
			return false;
		}
	} else {
		this.cHtmlObject = document.createElement(pHtmlType);
		if (!IS_NULL(pHtmlId)){
		this.cHtmlObject.id = pHtmlId;
		}
		if (!IS_NULL(pWidth)){
			this.cHtmlObject.width = pWidth;
		}
		if (!IS_NULL(pHeight)) {
			this.cHtmlObject.height = pHeight;
		}
		if (!IS_NULL(pJsParent)){
			pJsParent.getHtmlObject().appendChild(this.cHtmlObject);
		} else {
			document.body.appendChild(this.cHtmlObject);
		}
	}
	/*$(this.cHtmlObject).dblclick(function(e){
		e.preventDefault();
	});*/
	return true;
};

/**
 * Get the instance of the HTML object, this element controls
 * @function
 * @return {HtmlObject} the instance of the HTML object, this element controls
 */
JsHtmlObject.prototype.getHtmlObject = function() {
	return this.cHtmlObject;
};

JsHtmlObject.prototype.getParent = function() {
	if(!IS_NULL(this.cParent)){
		return this.cParent;
	} else {
		return document;
	}
	
};

</script>
<script type="text/javascript">
function IS_NULL(pValue) {
	return (pValue == null || (( typeof pValue) == 'undefined'));
}

/**
 * return false if the value given is null or undefined
 * @function
 * @global
 * @param {Object} pValue a value
 * @return {Boolean} false if value is null or undefined
 */
function IS_NOT_NULL(pValue) {
	return (pValue != null && (( typeof pValue) != 'undefined') );
}
/**
 * return the initial position of the slider
 * @function
 * @global
 * @return {Number}
 */
function getCoordonateXY(element) {
	var rect = element.getBoundingClientRect();
	return { top: rect.top, right: rect.right , bottom: rect.bottom, left: rect.left };
}
/**
 * return the initial position of the slider
 * @function
 * @global
 * @return {Number}
 */
function getSliderStartPosition(pSlider,pAxis) {
	var handleOffset = -$($(pSlider.getHtmlObject()).children()[0]).innerWidth()/2;
	if(pAxis == "x"){
		return getCoordonateXY(pSlider.getHtmlObject()).left + handleOffset;
	} else {
		return getCoordonateXY(pSlider.getHtmlObject()).bottom + handleOffset;
	}
}
/**
 *
 * @function
 * @global
 */
function setCurrentTimeOnVideo(BarRange, BarValue, VideoDuration) {
	return Math.floor((BarValue / BarRange) * VideoDuration*100)/100;
}
/**
 * getLessVars parses your LESS variables to Javascript (provided you make a dummy node in LESS)
 * @param {String} id The CSS-id your variables are listed under.
 * @param {Boolean} [parseNumbers=true] Try to parse units as numbers.
 * @return {Object} A value object containing your LESS variables.
 * @example
 * LESS:
 * 	&#64;myLessVariable: 123px;
 * 	#dummyLessId { width: @myLessVariable; }
 * Javascript:
 * 	GET_LESS_VARIABLES('dummyLessId');
 * returns:
 * 	{myLessVariable:123}
 */
function GET_LESS_VARIABLES(id, parseNumbers) {
	var bNumbers = parseNumbers === undefined ? true : parseNumbers, oLess = {}, rgId = /\#\w+/, rgKey = /\.(\w+)/, rgUnit = /[a-z]+$/, aUnits = 'em,ex,ch,rem,vw,vh,vmin,cm,mm,in,pt,pc,px,deg,grad,rad,turn,s,ms,Hz,kHz,dpi,dpcm,dppx'.split(','), rgValue = /:\s?(.*)\s?;\s?\}/, rgStr = /^'([^']+)'$/, sId = '#' + id, oStyles = document.styleSheets;
	for (var i = 0, l = oStyles.length; i < l; i++) {
		var oRules = oStyles[i].cssRules;
		for (var j = 0, k = oRules.length; j < k; j++) {
			var sRule = oRules[j].cssText, aMatchId = sRule.match(rgId);
			if (aMatchId && aMatchId[0] == sId) {
				var aKey = sRule.match(rgKey), aVal = sRule.match(rgValue);
				if (aKey && aVal) {
					var sKey = aKey[1], oVal = aVal[1], aUnit, aStr;
					if (bNumbers && ( aUnit = oVal.match(rgUnit)) && aUnits.indexOf(aUnit[0]) !== -1) {
						oVal = parseFloat(oVal);
					} else if ( aStr = oVal.match(rgStr)) {
						oVal = aStr[1];
					}
					oLess[sKey] = oVal;
				}
			}
		}
	}
	return oLess;
}


</script>
<script type="text/javascript">
POST_REQUEST="POST";
GET_REQUEST="GET";

MAX_DISPLAYED_THUMBNAILS=5;

LEFT = "Left";
RIGHT = "Right";


</script>
<script type="text/javascript">
POST_REQUEST="POST";
GET_REQUEST="GET";

MAX_DISPLAYED_THUMBNAILS=5;

LEFT = "Left";
RIGHT = "Right";


</script>
<script type="text/javascript">
function Bar (pParameters) {
	JsHtmlObject.call(this, null, "div", null);
	this.addClass("RecommandationBar");
	this.addClass("container-fluid");
	
	document.getElementById("barWrapper").appendChild(this.getHtmlObject());
	
	this.cParameters = pParameters;
	this.cThumbnailContainer;
	this.addContainer();
	this.addArrow(LEFT);this.addArrow(RIGHT);
	
	var t = this;
	Hammer(this.getHtmlObject(),{swipe_velocity: 0.3}).on("swiperight", function(e) {
		t.move(LEFT);
	});
	Hammer(this.getHtmlObject(),{swipe_velocity: 0.3}).on("swipeleft", function(e) {
		t.move(RIGHT);
	});
};
Bar.prototype = new JsHtmlObject();
Bar.prototype.constructor = Bar;

Bar.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Bar.prototype.addContainer = function(pClassName) {
	this.cThumbnailContainer = new ThumbnailContainer(this,this.cParameters);
};

Bar.prototype.addArrow = function(pSens) {
	var arrow = new Arrow(this,pSens);
	if(pSens=="Right"){
		$(this.getHtmlObject()).append(arrow.getHtmlObject());
	} else {
		$(this.getHtmlObject()).prepend(arrow.getHtmlObject());
	}
};

Bar.prototype.move = function(pSens) {
	this.cThumbnailContainer.move(pSens);
};


</script>
<script type="text/javascript">
function Thumbnail (pParent,pThumbNb,pParameters){
	JsHtmlObject.call(this, pParent, "div", "thumb"+pThumbNb);
	
	this.getHtmlObject().style.width = (100/MAX_DISPLAYED_THUMBNAILS)+"%";
	
	this.cThumbId = pThumbNb;
	this.cListeTags = new Array();	
	this.cUrl;
	this.cUrlid;
	this.cImage;
	this.cInfo;
	this.cButton;
	this.cParameters = this.parseParameters(pParameters);
	this.addClass("Thumbnail");
	this.addClass("container-fluid");
	
	this.addImage();
	this.addInfo();
	this.addButton();
	this.getHtmlObject().ondrop = function(e) {
		drop(e);
	};
	this.getHtmlObject().ondragover = function(e) {
		allowDrop(e);
	};

	var att = document.createAttribute("url");
	this.getHtmlObject().setAttributeNode(att);
	this.getHtmlObject().url = this.cUrl;
	var attid = document.createAttribute("urlid");
	this.getHtmlObject().setAttributeNode(attid);
	this.getHtmlObject().urlid = this.cUrlid;
};
Thumbnail.prototype = new JsHtmlObject();
Thumbnail.prototype.constructor = Thumbnail;

Thumbnail.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Thumbnail.prototype.addImage = function() {
	this.cImage = new ThumbnailImage(this,this.cUrl);
	this.getHtmlObject().appendChild(this.cImage.getHtmlObject());
};

Thumbnail.prototype.addInfo = function() {
	this.cInfo = new ThumbnailInfo(this,this.cUrl,this.cListeTags);
	this.getHtmlObject().appendChild(this.cInfo.getHtmlObject());
};

Thumbnail.prototype.addButton = function() {
	this.cButton = new ThumbnailButton(this);
	this.getHtmlObject().appendChild(this.cButton.getHtmlObject());
};

Thumbnail.prototype.parseParameters = function(pParam) {
	var param = JSON.parse(pParam).parameters;
	this.cUrl = param[0][this.cThumbId][0].url;
	this.cUrlid= param[0][this.cThumbId][1].idurl;
	/*var tags = param[0][this.cThumbId][1].tags;
	for(i=0,len=tags.length;i<len;i++){
		this.cListeTags.push(tags[i][i]);
	}*/
};
</script>
<script type="text/javascript">
function ThumbnailContainer (pParent){
	JsHtmlObject.call(this, null, "div", null);
	
	this.cThumbnails = new Array();
	this.cNbThumbnails = 0;
	this.cCurrentFirstThumbnails = 0;
	
	this.addClass("ThumbnailContainer");
	this.addClass("container-fluid");
	//this.addThumbnail();
};
ThumbnailContainer.prototype = new JsHtmlObject();
ThumbnailContainer.prototype.constructor = ThumbnailContainer;

ThumbnailContainer.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailContainer.prototype.move = function(pSens) {
	if(pSens == RIGHT && this.cCurrentFirstThumbnails > 0) {
		this.removeThumbnail(this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS-1);
		this.appendThumbnail(pSens,this.cCurrentFirstThumbnails-1);
		this.cCurrentFirstThumbnails--;
	} else if(pSens == LEFT && this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS < this.cNbThumbnails){
		this.removeThumbnail(this.cCurrentFirstThumbnails);
		this.appendThumbnail(pSens,this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS);
		this.cCurrentFirstThumbnails++;
	}
};

ThumbnailContainer.prototype.removeThumbnail = function(index) {
	$(this.cThumbnails[index].getHtmlObject()).remove();
};

ThumbnailContainer.prototype.appendThumbnail = function(pSens,index) {
	if(pSens == RIGHT) {
		$(this.getHtmlObject()).prepend(this.cThumbnails[index].getHtmlObject());
	} else {
		$(this.getHtmlObject()).append(this.cThumbnails[index].getHtmlObject());
	}
};

ThumbnailContainer.prototype.addThumbnail = function(param) {
	var thumb = new Thumbnail(this,this.cNbThumbnails,param);
	this.cThumbnails.push(thumb);
	if(this.cNbThumbnails >= MAX_DISPLAYED_THUMBNAILS) {
		this.getHtmlObject().removeChild(thumb.getHtmlObject());
	}
	this.cNbThumbnails++;
};


</script>
<script type="text/javascript">
function ThumbnailImage (pParent,pSource){
	JsHtmlObject.call(this, pParent, "div",null);
	
	this.cSource = pSource;
	this.cIframe = document.createElement("iframe");
	this.cIframe.src = this.cSource;
	this.cIframe.scrolling = "no";
	this.cIframe.sandbox = "allow-same-origin allow-scripts allow-popups allow-forms";
	this.cIframe.classList.add("frame");
	console.log(pSource);
	this.getHtmlObject().appendChild(this.cIframe);
	
	this.cIframe.ondrop = function(e) {
		alert('drop');
	};
	this.cIframe.ondragover = function(e) {
		allowDrop(e);
	};
	
	this.addClass("ThumbnailImage");
	
};
ThumbnailImage.prototype = new JsHtmlObject();
ThumbnailImage.prototype.constructor = ThumbnailImage;

ThumbnailImage.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};



</script>
<script type="text/javascript">
function ThumbnailInfo (pParent,pUrl,pListeTags){
	JsHtmlObject.call(this, pParent, "div",null);
	this.cListeTags = pListeTags;
	this.cUrl = pUrl;
	this.cInfoTitle;
	this.cInfoTags;
	
	this.addClass("ThumbnailInfo");
	this.addClass("container-fluid");
	
	this.addTitle(this.cUrl);
	this.addTags();
};
ThumbnailInfo.prototype = new JsHtmlObject();
ThumbnailInfo.prototype.constructor = ThumbnailInfo;

ThumbnailInfo.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfo.prototype.addTitle = function(pTitle) {
	this.cInfoTitle = new ThumbnailInfoTitle(this,pTitle);
	this.getHtmlObject().appendChild(this.cInfoTitle.getHtmlObject());
};

ThumbnailInfo.prototype.addTags = function() {
	this.cInfoTags = new ThumbnailInfoTagContainer(this,this.cListeTags);
	this.getHtmlObject().appendChild(this.cInfoTags.getHtmlObject());
};

ThumbnailInfo.prototype.getTitle = function() {
	return this.cInfoTitle;
};




</script>
<script type="text/javascript">

function ThumbnailInfoTitle (pParent,pText){
	JsHtmlObject.call(this, pParent, "div",null);
	this.cOriginalUrl = pText;
	this.cText = this.parseTitle(pText);
	this.cTitle;
	
	this.addClass("ThumbnailInfoTitle");
	this.addClass("container-fluid");
	
	this.addText(this.cText);
};
ThumbnailInfoTitle.prototype = new JsHtmlObject();
ThumbnailInfoTitle.prototype.constructor = ThumbnailInfoTitle;

ThumbnailInfoTitle.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfoTitle.prototype.addText = function(pText) {
	title = document.createElement('h4');
	link = document.createElement('a');
	link.innerHTML = pText;
	link.href = this.cOriginalUrl;
	link.target = "_blank";
	title.appendChild(link);
	this.getHtmlObject().appendChild(title);
};

ThumbnailInfoTitle.prototype.parseTitle = function(url) {
	return parseUri(url).host;
};


</script>
<script type="text/javascript">
function ThumbnailInfoTagContainer (pParent,pListeTags){
	JsHtmlObject.call(this, pParent, "div",null);
	
	this.cListeTags = pListeTags;
	
	this.addClass("ThumbnailTagContainer");
	this.addClass("container-fluid");
	
	this.addAllTags();
	
};
ThumbnailInfoTagContainer.prototype = new JsHtmlObject();
ThumbnailInfoTagContainer.prototype.constructor = ThumbnailInfoTagContainer;

ThumbnailInfoTagContainer.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfoTagContainer.prototype.initTag = function(pTag) {	
	return '<button type="button" class="btn">#'+pTag+'</button>';
};

ThumbnailInfoTagContainer.prototype.addAllTags = function() {
	for(i=0,len = this.cListeTags.length;i<len;i++){
		this.getHtmlObject().innerHTML += this.initTag(this.cListeTags[i])+"  ";
	}
};
ThumbnailInfoTagContainer.prototype.addTag = function(pTexte) {
	this.getHtmlObject().innerHTML += this.initTag(pTexte)+" ";
};


</script>
<script type="text/javascript">
function ThumbnailButton (pParent){
	JsHtmlObject.call(this, pParent, "button",null);
	this.getHtmlObject().innerHTML = "Done";
	this.addClass("ThumbnailButton");
	this.getHtmlObject().onclick = function(e){
		done_callback(e);
	};
};
ThumbnailButton.prototype = new JsHtmlObject();
ThumbnailButton.prototype.constructor = ThumbnailButton;

ThumbnailButton.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};


</script>
<script type="text/javascript">
function ThumbnailTag (pParent,pText){
	JsHtmlObject.call(this, pParent, "button",null);
	
	this.addClass("ThumbnailTag");
	this.getHtmlObject().innerHTML = "#"+pText;
	
	$(this.getHtmlObject()).on("click",function(e){
		var tagList = $(this).parent().parent().parent()[0].tagList;
		var index = tagList.indexOf(this.innerHTML);
		tagList.splice(index,1);
		$(this).remove();
	});
	
};
ThumbnailTag.prototype = new JsHtmlObject();
ThumbnailTag.prototype.constructor = ThumbnailTag;

ThumbnailTag.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailTag.prototype.addText = function(pText) {

};


</script>
<script type="text/javascript">
function Arrow (pParent,pSens){
	JsHtmlObject.call(this, pParent, "div", "arrow"+pSens);
	var t = this;
	
	this.cSens = pSens;
	
	this.addClass("Arrow");
	this.getHtmlObject().style.height = $(pParent.getHtmlObject()).innerHeight()+"px";
	this.addGlyph();
	
	$(this.getHtmlObject()).on("click",function(){
		t.getParent().move(t.cSens)
	});
};
Arrow.prototype = new JsHtmlObject();
Arrow.prototype.constructor = Arrow;

Arrow.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Arrow.prototype.addGlyph = function() {
	var glyph = document.createElement('span');
	glyph.classList.add("glyphicon");
	if(this.cSens == "Right"){
		glyph.classList.add("glyphicon-chevron-right");
	}else{
		glyph.classList.add("glyphicon-chevron-left");
	}
	//glyph.style.top = $(this.getHtmlObject()).innerHeight()/2-20+"px";
	this.getHtmlObject().appendChild(glyph);
};



</script>
	<div id="content_page">
		<div class="head_content_page">
			<h1>Ajouter des tags</h1>
			<div id="how_to_do">
					<div class="alert alert-info"><p>Drop all tags you want over the link</p></div>
			</div>
		</div>				
		<!-- This part should be loaded from Database, this is just an exemple -->
		<script>
		
		var container = new ThumbnailContainer(null,null);
		$('#content_page').prepend(container.getHtmlObject());
		</script>
		<% 
			int i=0;
			while ( i<urls.size())
			{
		%>
		<script>
		var count = String(<%=i%>);
		var url = "<%=urls.get(i).getuUri()%>";
		var iduri="<%=urls.get(i).getuId()%>";
		count = '"'+count+'"';
		console.log(url);
		url = '"'+url+'"';
		iduri= '"'+iduri+'"';
		//console.log(j);
		var parameters = '{"parameters":['+
		'{'+count+':[{"url":'+url+'},{"idurl":'+iduri+'}]}'+
		']}';
			container.addThumbnail(parameters);
		</script>
		<% 
				i++;
			}
		%>
</div>
<aside>
	<div id="tag_list">
		<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Liste des tags</h3>
			  </div>
			    <div class="panel-body" style="height:283px;">
					<div id="tag_names"/>									
						<!-- Load all tag names from the database here -->		
						<%
							i=0;
							while(i<tags.size())
							{
						%>
						<p draggable="true" ondragstart="drag(event,'<%=tags.get(i).gettName()%>')" id=<%=tags.get(i).gettName()%>><%= "#"+tags.get(i).gettName() %></p>		
						<%
								i++;
							}
						%>			
					</div>
				</div>
			</div>
		<div id="input_tag">
			<div class="input-group">
			  <span class="input-group-addon">Add tags</span>
			  <input type="text" class="form-control" placeholder="Tag name" id="tag_name">
			</div>
		</div>
	</div>
	</aside>			
</section>
<script type="text/javascript">
var tag_input = document.getElementById("tag_name");
var count=1;

tag_input.addEventListener('keypress',function(e)
{
	//ajouter les tags dans la tag_list
	if(this.value!="")
	{
		//check if the user has pressed enter
		var key = e.which || e.keycode;
		if(key==13)
		{
			var tag = document.createElement('p');
			tag.draggable="true";
			tag.id=this.value;
			tag.ondragstart = function(e){
				drag(e,this.id);
			};
			tag.innerHTML = "#"+this.value;
			var tag_names= document.getElementById("tag_names");
			tag_names.appendChild(tag);
			this.value="";
		}
	}
},false);

//Drag n drop option over tags names
function allowDrop(ev)
{
	ev.preventDefault();
}

function drag(ev,id)
{
	console.log("drag function value: "+id);
	ev.dataTransfer.setData("tag_names",id);
}

function drop(ev)
{
	var tagValue = ev.dataTransfer.getData("tag_names");
	var srcImg = ev.srcElement;
	var tagContainer = $($(srcImg).children()[1]).children()[1];
	console.log($($(srcImg).children()[1]).children()[1]);
	//tagContainer.innerHTML += '<button type="button" class="btn">#'+tagValue+'</button>';
	
	if(srcImg.tagList == null) {
		var array = new Array();
		var att = document.createAttribute("tagList");
		srcImg.setAttributeNode(att);
		srcImg.tagList = array;
	}
	if(srcImg.tagList.indexOf("#"+tagValue)==-1) {
		srcImg.tagList.push("#"+tagValue);
		var tag = new ThumbnailTag(null,tagValue);
		$(tagContainer).append(tag.getHtmlObject());
	}
}

function done_callback(ev)
{
	var thumbnail = $(ev.target).parent()[0];
	var tagList = thumbnail.tagList;
	var url = thumbnail.url;
	var urlid = thumbnail.urlid;
	var sender = new String("");
	var uri=new String("$$$"+url+"$$$");
	for(i=0,len=tagList.length;i<len;i++)
	{
		sender+=tagList[i].replace("#","")+"$$$";
	}
	sendRequest(urlid,sender);
	$(ev.target).parent().remove();
}

function sendRequest(url,sender)
{ 
	if (window.XMLHttpRequest) 
	{ 
		httpRequest = new XMLHttpRequest(); 
	} 
	else if (window.ActiveXObject) 
	{ 
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
	}	
	if (!httpRequest)
	{ 
		alert('Abandon :Impossible de crÃ©er une instance XMLHTTP'); 
		return false; 
	} 

	httpRequest.onreadystatechange = function() 
	{ 
	};
	console.log("Send send : "+sender);
	console.log("uuuu" + url);
	httpRequest.open("GET", "?page=addtagurl&url="+url+"&list="+sender, false); 
	httpRequest.send(null);  
}

</script>