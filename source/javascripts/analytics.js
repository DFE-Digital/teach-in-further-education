/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./js/analytics.js":
/*!*************************!*\
  !*** ./js/analytics.js ***!
  \*************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"Analytics\": () => (/* binding */ Analytics)\n/* harmony export */ });\n/* harmony import */ var js_cookie__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! js-cookie */ \"./node_modules/js-cookie/src/js.cookie.js\");\n/* harmony import */ var js_cookie__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(js_cookie__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _consent__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./consent */ \"./js/consent.js\");\n\r\n\r\n\r\nclass Analytics {\r\n\r\n    static setup(tag) {\r\n\r\n        const v = js_cookie__WEBPACK_IMPORTED_MODULE_0___default().get(_consent__WEBPACK_IMPORTED_MODULE_1__.Consent.cookieName);\r\n        let consentValue = 'denied';\r\n\r\n        if(v !== null && v !== undefined) {\r\n            const granted = JSON.parse(v)\r\n            if(granted.isGranted) {\r\n                consentValue = 'granted'\r\n            }\r\n        }\r\n\r\n        gtag('consent', 'default', {\r\n            'ad_storage': consentValue,\r\n            'analytics_storage': consentValue\r\n        });\r\n\r\n        gtag('js', new Date());\r\n        gtag('config', tag);\r\n        gtag('send', 'pageview')\r\n    }\r\n\r\n    sendAnalytics(category, action, label) {\r\n        gtag('event', action, {\r\n            'event_category': category,\r\n            'event_label': label\r\n        });\r\n    }\r\n\r\n    internalNavigation(hashLink, title) {\r\n        gtag('event', 'page_view', {\r\n            page_title: title,\r\n            page_location: window.location.href,\r\n            page_path: window.location.pathname + '#' + title.replace(' ', '-')\r\n        })\r\n    }\r\n\r\n    raiseQuestionSelected(questionText) {\r\n        this.sendAnalytics('question', 'selected', questionText)\r\n    }\r\n\r\n    raiseQuestionAnswerSubmit(questionText) {\r\n        this.sendAnalytics('question', 'submitted', questionText)\r\n    }\r\n\r\n    raiseExitPointEvent(url) {\r\n        this.sendAnalytics('exitPoint', 'click', url)\r\n    }\r\n\r\n    trackAccordionExpansion(id) {\r\n        const accordion = document.getElementById(id);\r\n        const openedElements =\r\n            Array.from(accordion.querySelectorAll('.govuk-accordion__section--expanded'))\r\n                .map(e => {\r\n                    return e.getAttribute(\"data-label\")\r\n                }).join(',')\r\n\r\n        this.sendAnalytics('accordion', 'expanded', openedElements)\r\n    }\r\n}\r\n\r\nwindow.analytics = {\r\n    setup: Analytics.setup\r\n}\n\n//# sourceURL=webpack://teach-in-further-education/./js/analytics.js?");

/***/ }),

/***/ "./js/consent.js":
/*!***********************!*\
  !*** ./js/consent.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"Consent\": () => (/* binding */ Consent)\n/* harmony export */ });\n/* harmony import */ var js_cookie__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! js-cookie */ \"./node_modules/js-cookie/src/js.cookie.js\");\n/* harmony import */ var js_cookie__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(js_cookie__WEBPACK_IMPORTED_MODULE_0__);\n\r\n\r\nclass Consent {\r\n\r\n    static cookieBaseName = 'teachfe-cookie-preferences';\r\n    static cookieVersion = 1;\r\n    static cookieLifetimeInDays = 90;\r\n\r\n    static get cookieName() {\r\n        return (\r\n            Consent.cookieBaseName + '-v' + Consent.cookieVersion\r\n        );\r\n    }\r\n\r\n    init(id) {\r\n        const v = js_cookie__WEBPACK_IMPORTED_MODULE_0___default().get(Consent.cookieName)\r\n        if(v !== null && v !== undefined) {\r\n            document.getElementById(id).style.display = 'none'\r\n            const granted = JSON.parse(v)\r\n            if(granted.isGranted) {\r\n                this.enableCookies();\r\n            } else {\r\n                this.removeCookies();\r\n            }\r\n        } else {\r\n            document.getElementById(id).style.display = 'block'\r\n        }\r\n    }\r\n\r\n    enableCookies(){\r\n        const v = js_cookie__WEBPACK_IMPORTED_MODULE_0___default().get(Consent.cookieName)\r\n        if(v !== null && v !== undefined) {\r\n            const granted = JSON.parse(v)\r\n            if(granted.isGranted) {\r\n                gtag('consent', 'default', {\r\n                    'ad_storage': 'granted',\r\n                    'analytics_storage': 'granted'\r\n                });\r\n            }\r\n        }\r\n    }\r\n\r\n    removeCookies() {\r\n        gtag('consent', 'update', {\r\n            'ad_storage': 'denied',\r\n            'analytics_storage': 'denied'\r\n        });\r\n\r\n        const cookies = js_cookie__WEBPACK_IMPORTED_MODULE_0___default().get()\r\n\r\n\r\n        for(const cookie in cookies) {\r\n            if(cookie !== Consent.cookieName) {\r\n                js_cookie__WEBPACK_IMPORTED_MODULE_0___default().remove(cookie)\r\n            }\r\n        }\r\n    }\r\n\r\n    saveConsentPreferences(id, prefs) {\r\n        const serialized = JSON.stringify(prefs);\r\n        js_cookie__WEBPACK_IMPORTED_MODULE_0___default().set(Consent.cookieName, serialized, {\r\n            expires: Consent.cookieLifetimeInDays,\r\n            sameSite: 'Lax',\r\n        });\r\n\r\n        document.getElementById(id).style.display = 'none'\r\n    }\r\n\r\n    consentAccepted(id) {\r\n        this.enableCookies();\r\n        this.saveConsentPreferences(id,{ isGranted: true })\r\n    }\r\n\r\n    consentRejected(id) {\r\n        this.removeCookies()\r\n        this.saveConsentPreferences(id,{ isGranted: false })\r\n    }\r\n}\n\n//# sourceURL=webpack://teach-in-further-education/./js/consent.js?");

/***/ }),

/***/ "./node_modules/js-cookie/src/js.cookie.js":
/*!*************************************************!*\
  !*** ./node_modules/js-cookie/src/js.cookie.js ***!
  \*************************************************/
/***/ ((module, exports, __webpack_require__) => {

eval("var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/*!\n * JavaScript Cookie v2.2.1\n * https://github.com/js-cookie/js-cookie\n *\n * Copyright 2006, 2015 Klaus Hartl & Fagner Brack\n * Released under the MIT license\n */\n;(function (factory) {\n\tvar registeredInModuleLoader;\n\tif (true) {\n\t\t!(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory),\n\t\t__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?\n\t\t(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :\n\t\t__WEBPACK_AMD_DEFINE_FACTORY__),\n\t\t__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));\n\t\tregisteredInModuleLoader = true;\n\t}\n\tif (true) {\n\t\tmodule.exports = factory();\n\t\tregisteredInModuleLoader = true;\n\t}\n\tif (!registeredInModuleLoader) {\n\t\tvar OldCookies = window.Cookies;\n\t\tvar api = window.Cookies = factory();\n\t\tapi.noConflict = function () {\n\t\t\twindow.Cookies = OldCookies;\n\t\t\treturn api;\n\t\t};\n\t}\n}(function () {\n\tfunction extend () {\n\t\tvar i = 0;\n\t\tvar result = {};\n\t\tfor (; i < arguments.length; i++) {\n\t\t\tvar attributes = arguments[ i ];\n\t\t\tfor (var key in attributes) {\n\t\t\t\tresult[key] = attributes[key];\n\t\t\t}\n\t\t}\n\t\treturn result;\n\t}\n\n\tfunction decode (s) {\n\t\treturn s.replace(/(%[0-9A-Z]{2})+/g, decodeURIComponent);\n\t}\n\n\tfunction init (converter) {\n\t\tfunction api() {}\n\n\t\tfunction set (key, value, attributes) {\n\t\t\tif (typeof document === 'undefined') {\n\t\t\t\treturn;\n\t\t\t}\n\n\t\t\tattributes = extend({\n\t\t\t\tpath: '/'\n\t\t\t}, api.defaults, attributes);\n\n\t\t\tif (typeof attributes.expires === 'number') {\n\t\t\t\tattributes.expires = new Date(new Date() * 1 + attributes.expires * 864e+5);\n\t\t\t}\n\n\t\t\t// We're using \"expires\" because \"max-age\" is not supported by IE\n\t\t\tattributes.expires = attributes.expires ? attributes.expires.toUTCString() : '';\n\n\t\t\ttry {\n\t\t\t\tvar result = JSON.stringify(value);\n\t\t\t\tif (/^[\\{\\[]/.test(result)) {\n\t\t\t\t\tvalue = result;\n\t\t\t\t}\n\t\t\t} catch (e) {}\n\n\t\t\tvalue = converter.write ?\n\t\t\t\tconverter.write(value, key) :\n\t\t\t\tencodeURIComponent(String(value))\n\t\t\t\t\t.replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g, decodeURIComponent);\n\n\t\t\tkey = encodeURIComponent(String(key))\n\t\t\t\t.replace(/%(23|24|26|2B|5E|60|7C)/g, decodeURIComponent)\n\t\t\t\t.replace(/[\\(\\)]/g, escape);\n\n\t\t\tvar stringifiedAttributes = '';\n\t\t\tfor (var attributeName in attributes) {\n\t\t\t\tif (!attributes[attributeName]) {\n\t\t\t\t\tcontinue;\n\t\t\t\t}\n\t\t\t\tstringifiedAttributes += '; ' + attributeName;\n\t\t\t\tif (attributes[attributeName] === true) {\n\t\t\t\t\tcontinue;\n\t\t\t\t}\n\n\t\t\t\t// Considers RFC 6265 section 5.2:\n\t\t\t\t// ...\n\t\t\t\t// 3.  If the remaining unparsed-attributes contains a %x3B (\";\")\n\t\t\t\t//     character:\n\t\t\t\t// Consume the characters of the unparsed-attributes up to,\n\t\t\t\t// not including, the first %x3B (\";\") character.\n\t\t\t\t// ...\n\t\t\t\tstringifiedAttributes += '=' + attributes[attributeName].split(';')[0];\n\t\t\t}\n\n\t\t\treturn (document.cookie = key + '=' + value + stringifiedAttributes);\n\t\t}\n\n\t\tfunction get (key, json) {\n\t\t\tif (typeof document === 'undefined') {\n\t\t\t\treturn;\n\t\t\t}\n\n\t\t\tvar jar = {};\n\t\t\t// To prevent the for loop in the first place assign an empty array\n\t\t\t// in case there are no cookies at all.\n\t\t\tvar cookies = document.cookie ? document.cookie.split('; ') : [];\n\t\t\tvar i = 0;\n\n\t\t\tfor (; i < cookies.length; i++) {\n\t\t\t\tvar parts = cookies[i].split('=');\n\t\t\t\tvar cookie = parts.slice(1).join('=');\n\n\t\t\t\tif (!json && cookie.charAt(0) === '\"') {\n\t\t\t\t\tcookie = cookie.slice(1, -1);\n\t\t\t\t}\n\n\t\t\t\ttry {\n\t\t\t\t\tvar name = decode(parts[0]);\n\t\t\t\t\tcookie = (converter.read || converter)(cookie, name) ||\n\t\t\t\t\t\tdecode(cookie);\n\n\t\t\t\t\tif (json) {\n\t\t\t\t\t\ttry {\n\t\t\t\t\t\t\tcookie = JSON.parse(cookie);\n\t\t\t\t\t\t} catch (e) {}\n\t\t\t\t\t}\n\n\t\t\t\t\tjar[name] = cookie;\n\n\t\t\t\t\tif (key === name) {\n\t\t\t\t\t\tbreak;\n\t\t\t\t\t}\n\t\t\t\t} catch (e) {}\n\t\t\t}\n\n\t\t\treturn key ? jar[key] : jar;\n\t\t}\n\n\t\tapi.set = set;\n\t\tapi.get = function (key) {\n\t\t\treturn get(key, false /* read as raw */);\n\t\t};\n\t\tapi.getJSON = function (key) {\n\t\t\treturn get(key, true /* read as json */);\n\t\t};\n\t\tapi.remove = function (key, attributes) {\n\t\t\tset(key, '', extend(attributes, {\n\t\t\t\texpires: -1\n\t\t\t}));\n\t\t};\n\n\t\tapi.defaults = {};\n\n\t\tapi.withConverter = init;\n\n\t\treturn api;\n\t}\n\n\treturn init(function () {});\n}));\n\n\n//# sourceURL=webpack://teach-in-further-education/./node_modules/js-cookie/src/js.cookie.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => (module['default']) :
/******/ 				() => (module);
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./js/analytics.js");
/******/ 	
/******/ })()
;