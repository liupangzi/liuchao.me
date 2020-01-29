this.wp=this.wp||{},this.wp.notices=function(t){var e={};function n(r){if(e[r])return e[r].exports;var o=e[r]={i:r,l:!1,exports:{}};return t[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}return n.m=t,n.c=e,n.d=function(t,e,r){n.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:r})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,e){if(1&e&&(t=n(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var r=Object.create(null);if(n.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var o in t)n.d(r,o,function(e){return t[e]}.bind(null,o));return r},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="",n(n.s=362)}({10:function(t,e,n){"use strict";function r(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}n.d(e,"a",(function(){return r}))},18:function(t,e,n){"use strict";var r=n(32);function o(t){return function(t){if(Array.isArray(t)){for(var e=0,n=new Array(t.length);e<t.length;e++)n[e]=t[e];return n}}(t)||Object(r.a)(t)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance")}()}n.d(e,"a",(function(){return o}))},2:function(t,e){!function(){t.exports=this.lodash}()},23:function(t,e){!function(){t.exports=this.regeneratorRuntime}()},32:function(t,e,n){"use strict";function r(t){if(Symbol.iterator in Object(t)||"[object Arguments]"===Object.prototype.toString.call(t))return Array.from(t)}n.d(e,"a",(function(){return r}))},362:function(t,e,n){"use strict";n.r(e);var r={};n.r(r),n.d(r,"createNotice",(function(){return y})),n.d(r,"createSuccessNotice",(function(){return g})),n.d(r,"createInfoNotice",(function(){return O})),n.d(r,"createErrorNotice",(function(){return j})),n.d(r,"createWarningNotice",(function(){return h})),n.d(r,"removeNotice",(function(){return m}));var o={};n.r(o),n.d(o,"getNotices",(function(){return x}));var i=n(4),c=n(18),u=n(2),a=n(10),f=n(6),s=function(t){return function(e){return function(){var n=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},r=arguments.length>1?arguments[1]:void 0,o=r[t];if(void 0===o)return n;var i=e(n[o],r);return i===n[o]?n:Object(f.a)({},n,Object(a.a)({},o,i))}}}("context")((function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[],e=arguments.length>1?arguments[1]:void 0;switch(e.type){case"CREATE_NOTICE":return[].concat(Object(c.a)(Object(u.reject)(t,{id:e.notice.id})),[e.notice]);case"REMOVE_NOTICE":return Object(u.reject)(t,{id:e.id})}return t})),l=n(23),d=n.n(l),p="global",b="info",v=d.a.mark(y);function y(){var t,e,n,r,o,i,c,a,f,s,l,y,g,O,j,h,m=arguments;return d.a.wrap((function(d){for(;;)switch(d.prev=d.next){case 0:if(t=m.length>0&&void 0!==m[0]?m[0]:b,e=m.length>1?m[1]:void 0,n=m.length>2&&void 0!==m[2]?m[2]:{},r=n.speak,o=void 0===r||r,i=n.isDismissible,c=void 0===i||i,a=n.context,f=void 0===a?p:a,s=n.id,l=void 0===s?Object(u.uniqueId)(f):s,y=n.actions,g=void 0===y?[]:y,O=n.type,j=void 0===O?"default":O,h=n.__unstableHTML,e=String(e),!o){d.next=8;break}return d.next=8,{type:"SPEAK",message:e,ariaLive:"snackbar"===j?"polite":"assertive"};case 8:return d.next=10,{type:"CREATE_NOTICE",context:f,notice:{id:l,status:t,content:e,__unstableHTML:h,isDismissible:c,actions:g,type:j}};case 10:case"end":return d.stop()}}),v)}function g(t,e){return y("success",t,e)}function O(t,e){return y("info",t,e)}function j(t,e){return y("error",t,e)}function h(t,e){return y("warning",t,e)}function m(t){return{type:"REMOVE_NOTICE",id:t,context:arguments.length>1&&void 0!==arguments[1]?arguments[1]:p}}var w=[];function x(t){return t[arguments.length>1&&void 0!==arguments[1]?arguments[1]:p]||w}var E=n(49),S={SPEAK:function(t){Object(E.speak)(t.message,t.ariaLive||"assertive")}};Object(i.registerStore)("core/notices",{reducer:s,actions:r,selectors:o,controls:S})},4:function(t,e){!function(){t.exports=this.wp.data}()},49:function(t,e){!function(){t.exports=this.wp.a11y}()},6:function(t,e,n){"use strict";n.d(e,"a",(function(){return o}));var r=n(10);function o(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{},o=Object.keys(n);"function"==typeof Object.getOwnPropertySymbols&&(o=o.concat(Object.getOwnPropertySymbols(n).filter((function(t){return Object.getOwnPropertyDescriptor(n,t).enumerable})))),o.forEach((function(e){Object(r.a)(t,e,n[e])}))}return t}}});