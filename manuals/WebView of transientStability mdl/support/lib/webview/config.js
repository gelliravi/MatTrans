var dojoConfig = (function () {
    "use strict";

    var disableNativeXhr = ((window.location.protocol === 'file:')
            && ((navigator.userAgent.indexOf("MSIE") > 0) || (navigator.userAgent.indexOf("Trident") > 0))),
        featureOverrides = disableNativeXhr ? {'native-xhr': 0, 'activex': 1} : {};

    return {
        has: featureOverrides,
        baseUrl: "support/lib/",
        packages: [{
            name: 'dojo',
            location: 'dojo'
        }, {
            name: 'dijit',
            location: 'dijit'
        }, {
            name: 'dgrid',
            location: 'dgrid'
        }, {
            name: 'put-selector',
            location: 'put-selector'
        }, {
            name: 'xstyle',
            location: 'xstyle'
        }, {
            name: 'webview',
            location: 'webview'
        }]
    };
}());